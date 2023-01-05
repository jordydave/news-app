import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:technical_test/domain/entities/news.dart';
import 'package:technical_test/domain/usecases/get_list_news.dart';
import 'package:technical_test/presentation/bloc/news_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:technical_test/utils/failure.dart';

import 'news_test.mocks.dart';

@GenerateMocks([GetListNews])
void main() {
  late NewsBloc bloc;
  late MockGetListNews mockGetListNews;

  setUp(() {
    mockGetListNews = MockGetListNews();
    bloc = NewsBloc(mockGetListNews);
  });

  const tNewsModel = News(
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
  final tNewsModelList = <News>[tNewsModel];

  test('initial state should be empty', () {
    expect(bloc.state, equals(NewsEmpty()));
  });
  blocTest<NewsBloc, NewsState>(
    'Should emit [Loading, HasData] when List News is gotten successfully',
    build: () {
      when(mockGetListNews.execute())
          .thenAnswer((_) async => Right(tNewsModelList));
      return bloc;
    },
    act: (bloc) => bloc.add(NewsListRequested()),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      NewsLoading(),
      NewsHasData(news: tNewsModelList),
    ],
    verify: (bloc) {
      verify(mockGetListNews.execute());
    },
  );

  blocTest<NewsBloc, NewsState>(
    'Should emit [Loading, Error] when List News is unsuccessfull.',
    build: () {
      when(mockGetListNews.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return bloc;
    },
    act: (bloc) => bloc.add(NewsListRequested()),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      NewsLoading(),
      const NewsError(message: 'Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetListNews.execute());
    },
  );
}
