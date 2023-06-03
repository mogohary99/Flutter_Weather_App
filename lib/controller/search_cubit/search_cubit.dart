import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/data/models/city_model.dart';

import '../../data/datasource/search_service.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchService searchService;

  SearchCubit({
    required this.searchService,
  }) : super(SearchInitial());

  static SearchCubit get(context) => BlocProvider.of(context);


  List<CityModel> cities= [];
  Future<void> searchByCityName(String cityName)async{
    cities=[];
    emit(SearchByCityLoadingState());
    try{
      final res = await searchService.searchByCityName(cityName);
      cities.add(res);
      print(res);
      emit(SearchByCitySuccessState());
    }catch(e){
      print(e);
      emit(SearchByCityErrorState(error: e.toString()));
    }
  }
}
