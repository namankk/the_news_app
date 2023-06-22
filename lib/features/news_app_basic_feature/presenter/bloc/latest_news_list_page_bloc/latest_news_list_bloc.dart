import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_news_app/features/news_app_basic_feature/domain/usecase/get_list_of_article_use_case.dart';
import 'package:the_news_app/features/news_app_basic_feature/presenter/bloc/latest_news_list_page_bloc/latest_news_list_events.dart';
import 'package:the_news_app/features/news_app_basic_feature/presenter/bloc/latest_news_list_page_bloc/latest_news_list_states.dart';

class LatestNewListBloc extends Bloc<LatestNewsEvents,LatestNewsListStates>{
  final GetListOfArticleUseCase _getListOfArticleUseCase;

  LatestNewListBloc(this._getListOfArticleUseCase):super(LatestNewsListEmpty()){
    on<OnLatestNewsViewInitialise>((event, emit)async{
      emit(LatestNewsListLoading());
      final result= await _getListOfArticleUseCase();
      result.fold((failure) => emit(LatestNewsListError("Something went wrong")), (data) => emit(LatestNewsListHasData(data)));
    });
  }

}