abstract class NewsStates{}

class NewsInitialStates extends NewsStates {}

class NewsChangeButtonNavStates extends NewsStates{}

class NewsDataBusinessSuccessStates extends NewsStates{}

class NewsDataBusinessErrorStates extends NewsStates{
  late final String error;
  NewsDataBusinessErrorStates(this.error);
}

class NewsDataSportSuccessStates extends NewsStates{}

class NewsDataSportErrorStates extends NewsStates{
  late final String error;
  NewsDataSportErrorStates(this.error);
}

class NewsDataScienceSuccessStates extends NewsStates{}

class NewsDataScienceErrorStates extends NewsStates{
  late final String error;
  NewsDataScienceErrorStates(this.error);
}

class NewsDataSearchSuccessStates extends NewsStates{}

class NewsDataSearchErrorStates extends NewsStates{
  late final String error;
  NewsDataSearchErrorStates(this.error);
}


class NewsChangeMoodStates extends NewsStates{}