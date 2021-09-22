abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsButtomNavState extends NewsStates {}

class NewsGetBusinessSuccessState extends NewsStates {}

class NewsGetBusinessLoadingState extends NewsStates {}

class NewsGetBusinessErrorState extends NewsStates {
  final String error;
  NewsGetBusinessErrorState(this.error);
}

class NewsGetSportsSuccessState extends NewsStates {}

class NewsGetSportsLoadingState extends NewsStates {}

class NewsGetSportsErrorState extends NewsStates {
  final String error;
  NewsGetSportsErrorState(this.error);
}

class NewsGetScienceSuccessState extends NewsStates {}

class NewsGetScienceLoadingState extends NewsStates {}

class NewsGetScienceErrorState extends NewsStates {
  final String error;
  NewsGetScienceErrorState(this.error);
}

class NewsGetSettingsSuccessState extends NewsStates {}

class NewsGetSettingsLoadingState extends NewsStates {}

class NewsGetSearchLoadingState extends NewsStates {}

class NewsGetSearchSuccessState extends NewsStates {}

class NewsGetSettingsErrorState extends NewsStates {
  final String error;
  NewsGetSettingsErrorState(this.error);
}

class NewsGetSearchErrorState extends NewsStates {
  final String error;
  NewsGetSearchErrorState(this.error);
}
