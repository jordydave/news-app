import 'package:dartz/dartz.dart';
import 'package:technical_test/data/datasources/news_remote_data_source.dart';
import 'package:technical_test/domain/entities/news.dart';
import 'package:technical_test/domain/repositories/news_repository.dart';
import 'package:technical_test/utils/exception.dart';
import 'package:technical_test/utils/failure.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource remoteDataSource;

  NewsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<News>>> getListNews() async {
    try {
      final result = await remoteDataSource.getListNews();
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    }
  }
}
