import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:technical_test/data/datasources/news_remote_data_source.dart';
import 'package:technical_test/domain/repositories/news_repository.dart';

@GenerateMocks([
  NewsRepository,
  NewsRemoteDataSource,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
