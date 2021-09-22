import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/model/shop_app/search_model.dart';
import 'package:login/module/shop_app/search_screen/cubit/states.dart';
import 'package:login/shared/component/constants.dart';
import 'package:login/shared/network/end_point.dart';
import 'package:login/shared/network/remote/dio_helper.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel model;

  void search(String text) {
    emit(SearchLoadingState());

    DioHelper.postData(
      url: SEARCH,
      data: {
        'text': text,
      },
      token: token,
    ).then((value) {
      //
      model = SearchModel.fromJson(value.data);

      emit(SearchSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(SearchErrorState());
    });
  }
}
