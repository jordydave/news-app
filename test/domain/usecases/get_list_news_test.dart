import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:technical_test/domain/entities/news.dart';
import 'package:technical_test/domain/usecases/get_list_news.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetListNews usecase;
  late MockNewsRepository mockNewsRepository;

  setUp(() {
    mockNewsRepository = MockNewsRepository();
    usecase = GetListNews(repository: mockNewsRepository);
  });

  final tNews = <News>[];

  test('should get list of news from the repository', () async {
    // arrange
    when(mockNewsRepository.getListNews())
        .thenAnswer((_) async => Right(tNews));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(tNews));
  });
}
