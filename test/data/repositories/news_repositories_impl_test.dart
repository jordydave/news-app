import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:technical_test/data/models/news_model.dart';
import 'package:technical_test/data/repositories/news_repository_impl.dart';
import 'package:technical_test/domain/entities/news.dart';
import 'package:technical_test/utils/exception.dart';
import 'package:technical_test/utils/failure.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late NewsRepositoryImpl repository;
  late MockNewsRemoteDataSource mockNewsRemoteDataSource;

  setUp(() {
    mockNewsRemoteDataSource = MockNewsRemoteDataSource();
    repository = NewsRepositoryImpl(remoteDataSource: mockNewsRemoteDataSource);
  });

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

  final tNewsModelList = <NewsModel>[tNewsModel];
  final tNewsList = <News>[tNews];

  group(
    'List of News',
    () {
      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        // arrange
        when(mockNewsRemoteDataSource.getListNews())
            .thenAnswer((_) async => tNewsModelList);
        // act
        final result = await repository.getListNews();
        // assert
        verify(mockNewsRemoteDataSource.getListNews());
        final resultList = result.getOrElse(() => []);
        expect(resultList, tNewsList);
      });

      test(
          'should return server failure when the call to remote data source is unsuccessful',
          () async {
        // arrange
        when(mockNewsRemoteDataSource.getListNews())
            .thenThrow(ServerException());
        // act
        final result = await repository.getListNews();
        // assert
        verify(mockNewsRemoteDataSource.getListNews());
        expect(result, equals(const Left(ServerFailure(''))));
      });
    },
  );
}
