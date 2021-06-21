import 'package:test/test.dart';
import 'package:epicture_final/src/app/view/user_page.dart';

void main() {
  group('User Page', () {
    String src = "{id: nuY5IOc, title: October 16, description: null, datetime: 1602887056, cover: Ce14qXm, cover_width: 4993, cover_height: 4996, account_url: DailyStrudel, account_id: 100479365, privacy: hidden, layout: blog, views: 1169, link: https://imgur.com/a/nuY5IOc, ups: 44, downs: 3, points: 41, score: 41, is_album: true, vote: null, favorite: false, nsfw: false, section: , comment_count: 7, favorite_count: 6, topic: No Topic, topic_id: 29, images_count: 2, in_gallery: true, is_ad: false, tags: [{name: cat, display_name: cat, followers: 1498391, total_items: 228932, following: false, is_whitelisted: false, background_hash: xeEIpAn, thumbnail_hash: null, accent: 159559, background_is_animated: false, thumbnail_is_animated: false, is_promoted: false, description: feline friends, logo_hash: null, logo_destination_url: null, description_annotations: {}}, {name: cute_cat, display_name: cute cat, followers: 3397, total_items: 4960, following: false, is_whitelisted: false, background_hash: OHK1wWY, thumbnail_hash: null}";
    final testClass = UserPage();
    test('find correct link', () {
      expect(testClass.getLink(src), "https://imgur.com/a/nuY5IOc");
    });

    test('find correct id', () {
      expect(testClass.getId(src), "nuY5IOc");
    });

    test('find correct name', () {
      expect(testClass.getName(src), "cat");
    });

    // test('find correct title', () {
    //   expect(testClass.getTitle(src), "October 16");
    // });
  });
}