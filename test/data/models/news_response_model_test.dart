import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:technical_test/data/models/news_model.dart';
import 'package:technical_test/data/models/news_response.dart';

import '../../json_reader.dart';

void main() {
  const tNewsModel = NewsModel(
    id: "1",
    createdAt: "1",
    contributorName: "contributorName",
    contributorAvatar: "contributorAvatar",
    title: "title",
    content: "content",
    contentThumbnail: "contentThumbnail",
    slideshow: [
      "http://placeimg.com/640/480/nature",
      "http://placeimg.com/640/480/nature",
      "http://placeimg.com/640/480/nature"
    ],
  );
  const tNewsResponseModel = NewsResponse(news: <NewsModel>[tNewsModel]);

  test('should return a valid model from JSON', () async {
    // arrange
    final List<dynamic> jsonMap = json.decode(readJson('dummy_data/news.json'));
    // act
    final result = NewsResponse.fromJson(jsonMap);
    // assert
    expect(result, tNewsResponseModel);
  });
}
