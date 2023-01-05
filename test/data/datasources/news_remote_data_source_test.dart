import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:technical_test/data/datasources/news_remote_data_source.dart';
import 'package:technical_test/data/models/news_response.dart';
import 'package:technical_test/utils/exception.dart';

import '../../helpers/test_helper.mocks.dart';
import '../../json_reader.dart';

void main() {
  const baseUrl =
      'https://60a4954bfbd48100179dc49d.mockapi.io/api/innocent/newsapp/articles';

  late NewsRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = NewsRemoteDataSourceImpl(client: mockHttpClient);
  });

  group(
    'get list of news',
    () {
      final tNewsList = NewsResponse.fromJson(
        json.decode(
          readJson('dummy_data/news.json'),
        ),
      ).news;

      test(
        'should return list of News Model when the response code is 200',
        () async {
          // arrange
          when(mockHttpClient.get(Uri.parse(baseUrl))).thenAnswer((_) async =>
              http.Response(readJson('dummy_data/news.json'), 200));
          // act
          final result = await dataSource.getListNews();
          // assert
          expect(result, equals(tNewsList));
        },
      );
      test(
        'should throw a ServerException when the response code is 404 or other',
        () async {
          // arrange
          when(mockHttpClient.get(Uri.parse(baseUrl)))
              .thenAnswer((_) async => http.Response('Not Found', 404));
          // act
          final call = dataSource.getListNews();
          // assert
          expect(() => call, throwsA(isA<ServerException>()));
        },
      );
    },
  );
}
