import 'package:dartz/dartz.dart';
import 'package:technical_test/domain/entities/news.dart';
import 'package:technical_test/utils/failure.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<News>>> getListNews();
}
