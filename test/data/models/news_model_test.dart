import 'package:flutter_test/flutter_test.dart';
import 'package:technical_test/data/models/news_model.dart';
import 'package:technical_test/domain/entities/news.dart';

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

  const tNews = News(
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
  test('should be a subclass of News entity', () async {
    final result = tNewsModel.toEntity();
    expect(result, tNews);
  });
}
