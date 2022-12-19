import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_news/Network/SharedHelper.dart';
import 'package:new_news/Network/dioHelper.dart';
import 'package:new_news/NewsLayout/Cubit/States.dart';
import 'package:new_news/modules/Screens/Business.dart';
import 'package:new_news/modules/Screens/Science.dart';
import 'package:new_news/modules/Screens/Settings.dart';
import 'package:new_news/modules/Screens/Sports.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialStates());

  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<String> appBar = const [
    'Business News',
    'Sports News',
    'Science News',
    'Settings',
  ];
  List<BottomNavigationBarItem> itemBottom = const [
    BottomNavigationBarItem(
        icon: Icon(Icons.business_center_rounded), label: 'Business'),
    BottomNavigationBarItem(
        icon:Icon(Icons.sports),
        label: 'Sports'
    ),
    BottomNavigationBarItem(
        icon:Icon(Icons.science),
        label: 'Science'
    ),
    BottomNavigationBarItem(
        icon:Icon(Icons.settings),
        label: 'Settings'
    ),
  ];
  List<Widget> screens=const[
    business(),
    sports(),
    science(),
    settings(),
  ];

  void changeIndex(int index){
    currentIndex = index;
    emit(NewsChangeButtonNavStates());
  }


  List<dynamic>newsBusiness =[];
  void getNewsBusiness()
  {
    DioHelper.getData(
        url: 'v2/top-headlines',
        query:{
             'country': 'eg',
             'category': 'business',
             'apiKey': 'cdad916ab5184dccaa943436cdae85d1',
        }
    ).then((value) {
      newsBusiness=value.data['articles'];
      emit(NewsDataBusinessSuccessStates());
    }).catchError((error){
      print('${error.toString()} business');
      emit(NewsDataBusinessErrorStates(error.toString())
      );
    });
  }

  List<dynamic>newsSport =[];
  void getNewsSport()
  {
    DioHelper.getData(
        url: 'v2/top-headlines',
        query:{
          'country': 'eg',
          'category': 'sport',
          'apiKey': 'cdad916ab5184dccaa943436cdae85d1',
        }
    ).then((value) {
      newsSport=value.data['articles'];
      emit(NewsDataSportSuccessStates());
    }).catchError((error){
      print('${error.toString()} sport');
      emit(NewsDataSportErrorStates(error.toString()));
    });
  }

  List<dynamic>newsScience =[];
  void getNewsScience()
  {
    DioHelper.getData(
        url: 'v2/top-headlines',
        query:{
          'country': 'eg',
          'category': 'science',
          'apiKey': 'cdad916ab5184dccaa943436cdae85d1',
    }).then((value) {
      newsScience = value.data['articles'];
      emit(NewsDataScienceSuccessStates());
    }).catchError((error) {
      print('${error.toString()} science');
      emit(NewsDataScienceErrorStates(error.toString()));
    });
  }

  String? chick;
  List<dynamic> newsSearch = [];

  void getNewsSearch(value) {
    newsSearch = [];
    emit(NewsDataSearchSuccessStates());

    DioHelper.getData(url: 'v2/everything', query: {
      'q': '$value',
          'apiKey': 'cdad916ab5184dccaa943436cdae85d1',
        }
    ).then((value) {
      newsSearch = value.data['articles'];
      emit(NewsDataSearchSuccessStates());
    }).catchError((error) {
      print('${error.toString()} science');
      emit(NewsDataSearchErrorStates(error.toString()));
    });
  }

  bool isDark = false;

  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      fromShared = isDark;
    } else {
      isDark = !isDark;
    }
    SharedHelper.putBoolData(key: 'isDark', value: isDark).then((value) {
      print(isDark);
      emit(NewsChangeMoodStates());
    });
  }


}


//https://gnewsapi.net
// /api/search?
// q=covid-19&language=ar&country=eg&api_token=[API TOKEN]

//https://newsapi.org/
// v2/top-headlines?
// country=eg&category=business&apiKey=cdad916ab5184dccaa943436cdae85d1
