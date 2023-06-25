import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_news_app/features/news_app_basic_feature/presenter/bloc/latest_news_bottom_navigation_bloc/latest_news_bottom_nav_bar_items.dart';
import 'package:the_news_app/features/news_app_basic_feature/presenter/bloc/latest_news_bottom_navigation_bloc/latest_news_bottom_navigation_states.dart';

class LatestNewsBottomNavigationBloc extends Cubit<LatestNewsBottomNavigationState>{
  LatestNewsBottomNavigationBloc():super(LatestNewsBottomNavigationCurrentState());

  void mapEventWithStates(NavBarItems navBarItems){
    switch(navBarItems){
      case NavBarItems.home:
        emit(LatestNewsBottomNavigationCurrentState(currentIndex: 0));
        break;
      case NavBarItems.latestNews:
        emit(LatestNewsBottomNavigationCurrentState(currentIndex: 1));
        break;
      case NavBarItems.details:
        emit(LatestNewsBottomNavigationCurrentState(currentIndex: 2));
        break;
    }
  }

}