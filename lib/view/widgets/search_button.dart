import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/controller/home_cubit/home_cubit.dart';
import 'package:flutter_weather_app/controller/search_cubit/search_cubit.dart';
import 'package:flutter_weather_app/core/utils/theme/app_colors.dart';
import 'package:flutter_weather_app/data/models/city_model.dart';
import 'package:searchfield/searchfield.dart';

class SearchButton extends StatefulWidget {
  const SearchButton({
    super.key,
  });

  @override
  State<SearchButton> createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        var cubit = SearchCubit.get(context);
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            //color: Color(0xff070826),
            color: const Color(0xff23224A),
            borderRadius: BorderRadius.circular(16),
          ),
          child: SearchField<CityModel>(
            suggestions: cubit.cities
                .map(
                  (e) => SearchFieldListItem<CityModel>(
                    e.name,
                    child:  SearchedItem(cityModel: e,),
                  ),
                )
                .toList(),
            suggestionState: Suggestion.expand,
            suggestionsDecoration: SuggestionDecoration(
              color: const Color(0xff23224A),
            ),
            textInputAction: TextInputAction.done,
            hint: 'Search by city name',
            searchStyle: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
            searchInputDecoration: const InputDecoration(

              hintStyle: TextStyle(
                color: AppColors.whiteGrey,
              ),
            ),
            maxSuggestionsInViewPort: 6,
            itemHeight: 50,
            onSearchTextChanged: (v) {
              cubit.searchByCityName(v);
              return null;
            },
          ),
        );
      },
    );
  }
}

class SearchedItem extends StatelessWidget {
  final CityModel cityModel;

  const SearchedItem({
    super.key,
    required this.cityModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HomeCubit.get(context).getCityWeatherByLatLong(
          cityModel.lat,
          cityModel.long,
        );
      },
      child: Container(
        width: double.infinity,
        height: 50,
        color: const Color(0xff23224A),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          cityModel.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

