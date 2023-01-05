import 'package:get_it/get_it.dart';
import 'package:technical_test/data/datasources/news_remote_data_source.dart';
import 'package:technical_test/data/repositories/news_repository_impl.dart';
import 'package:technical_test/domain/repositories/news_repository.dart';
import 'package:technical_test/presentation/bloc/news_bloc.dart';
import 'package:http/http.dart' as http;

import 'domain/usecases/get_list_news.dart';

final locator = GetIt.instance;

void init() {
  // Blocs
  locator.registerFactory(() => NewsBloc(locator()));

  // Use cases
  locator.registerLazySingleton(() => GetListNews(repository: locator()));

  // Repository
  locator.registerLazySingleton<NewsRepository>(
    () => NewsRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  // Data sources
  locator.registerLazySingleton<NewsRemoteDataSource>(
    () => NewsRemoteDataSourceImpl(client: locator()),
  );

  // Others
  locator.registerLazySingleton(() => http.Client());
}
