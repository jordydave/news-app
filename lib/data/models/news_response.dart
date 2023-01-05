import 'package:equatable/equatable.dart';
import 'package:technical_test/data/models/news_model.dart';

class NewsResponse extends Equatable {
  final List<NewsModel> news;

  const NewsResponse({required this.news});

  factory NewsResponse.fromJson(List<dynamic> json) => NewsResponse(
        news: List<NewsModel>.from(
          json.map(
            (x) => NewsModel.fromJson(x),
          ),
        ),
      );

  @override
  List<Object?> get props => [news];
}
