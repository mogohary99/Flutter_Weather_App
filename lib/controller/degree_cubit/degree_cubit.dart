import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/core/extensions/weather_extension.dart';
import 'package:flutter_weather_app/data/commen/shared_pref_module.dart';

part 'degree_state.dart';

class DegreeCubit extends Cubit<DegreeState> {
  final SharedPreferenceModule sharedPreferenceModule;

  DegreeCubit({
    required this.sharedPreferenceModule,
  }) : super(DegreeInitial());

  static DegreeCubit get(context) => BlocProvider.of(context);

  changeDegreeType(DegreeType degreeType){
    emit(ChangeDegreeLoadingState());
    sharedPreferenceModule.setDegreeType(degreeType);
    emit(ChangeDegreeSuccessState());
  }

  String getDegreeType(double temp){
    DegreeType? type  =sharedPreferenceModule.getDegreeType?.toEnum;
    switch(type){
      case DegreeType.celsius:
        return temp.toCelsius;
      case DegreeType.fahrenheit:
        return temp.toFahrenheit;
      case null:
        return temp.toCelsius;
    }

  }
}
