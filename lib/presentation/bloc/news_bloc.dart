import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_test/domain/usecases/get_list_news.dart';

import '../../domain/entities/news.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetListNews getListNews;

  NewsBloc(this.getListNews) : super(NewsEmpty()) {
    on<NewsListRequested>((event, emit) async {
      emit(NewsLoading());
      final result = await getListNews.execute();
      result.fold(
        (failure) => emit(NewsError(message: failure.message)),
        (news) => emit(NewsHasData(news: news)),
      );
    });
  }
}
