// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';

enum GalleryModelStatus {
  Ended,
  Loading,
  Error,
}

class ImageModel
{
  String _id;
  String _name;
  String _desc;
  String _link;

  void setName(String newTitle) {
      _name = newTitle;
  }

  void setDescription(String newDescription) {
      _desc = newDescription;
  }

  void setLink(String newLink) {
      _link = newLink;
  }

  void setId(String newId) {
      _id = newId;
  }

  String getLink() {
      return (_link);
  }

  String getName() {
      return (_name);
  }

  String getDescription() {
      return (_desc);
  }

  String getId() {
      return (_id);
  }
}

class GalleryModel extends ChangeNotifier
{
  GalleryModelStatus _status;
  String _errorCode;
  String _errorMessage;

  String get errorCode => _errorCode;
  String get errorMessage => _errorMessage;
  GalleryModelStatus get status => _status;

  GalleryModel();

  GalleryModel.instance();

	List<ImageModel> _images = [];

	void setImage(String title, String description, String link, String id)
  {
    _status = GalleryModelStatus.Loading;
    notifyListeners();

    ImageModel image;
    image.setId(id);
		image.setLink(link);
		image.setName(title);
		image.setDescription(description);
		_images.add(image);

    _status = GalleryModelStatus.Ended;
    notifyListeners();
	}

	List<ImageModel> getImages()
  {
		return (_images);
	}

	void clearImages()
  {
    _status = GalleryModelStatus.Loading;
    notifyListeners();
		_images.clear();
    _status = GalleryModelStatus.Ended;
    notifyListeners();
	}
}