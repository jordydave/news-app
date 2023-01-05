import 'package:dartz/dartz.dart';
import 'package:technical_test/domain/entities/news.dart';
import 'package:technical_test/domain/repositories/news_repository.dart';
import 'package:technical_test/utils/failure.dart';

class GetListNews {
  final NewsRepository repository;

  GetListNews({required this.repository});

  Future<Either<Failure, List<News>>> execute() {
    return repository.getListNews();
  }
}
