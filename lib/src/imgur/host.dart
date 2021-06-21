import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:epicture_final/src/imgur/constants.dart' as vars;

class HostState extends State<Host> {
	FlutterWebviewPlugin _webView = new FlutterWebviewPlugin();
  static const String _sampleResponseUrl = "https://m.imgur.com/#";
  StreamSubscription _onDestroy;
  StreamSubscription<String> _onUrlChanged;
  StreamSubscription<WebViewStateChanged> _onStateChanged;
	
  @override
	Widget build(BuildContext context) {
      final authUrl = Uri.https('api.imgur.com', '/oauth2/authorize', {
        'client_id': '${vars.Constants.clientId}',
        'response_type': 'token',
      });
      var view = new WebviewScaffold(clearCache: true, clearCookies: true, appBar: AppBar(
          title: Text("Authentication client")
        ),
        url: authUrl.toString(),
        withZoom: false
      );
      return (view);
	}

  parseResponse(var params) {
    var valuesDict = new Map();

    for (var param in params.split('&')) {
        var values = param.split('=');
        valuesDict[values[0]] = values[1];
		}
    return (valuesDict);
  }

	getParams(String url) {
		var params = url.substring(HostState._sampleResponseUrl.length);
		return parseResponse(params);
	}

	closeWebView() async {
    print('before closing');
    var wait = await _webView.close();
    print('poping now');
	  Navigator.pop(context);
	}

	@override
	void initState() {
		super.initState();

    _webView.close();

    // Add a listener to on destroy WebView, so you can make came actions.
    _onDestroy = _webView.onDestroy.listen((_) {
      print("destroy");
    });

    _onStateChanged = _webView.onStateChanged.listen((WebViewStateChanged state) {
      setState(() {
        print("URL changed: $state.url");
        if (state.url.contains(HostState._sampleResponseUrl)) {
            var params = getParams(state.url);
            vars.Constants.accessToken = params['access_token'];
            vars.Constants.refreshToken = params['refresh_token'];
            vars.Constants.username = params['account_username'];
            vars.Constants.userId = params['account_id'];
            vars.Constants.expiration = int.parse(params['expires_in']);
            Navigator.of(context).pushNamedAndRemoveUntil('/user', (Route<dynamic> route) => false);
            _webView.close();
          }
        });
    });
	}

	@override
	void dispose() {
    _onDestroy.cancel();
    _onUrlChanged.cancel();
    _onStateChanged.cancel();
		_webView.dispose();
		super.dispose();
	}
}

class Host extends StatefulWidget {

	Host({Key key}) : super(key: key);

	@override
	HostState createState() => new HostState();
}