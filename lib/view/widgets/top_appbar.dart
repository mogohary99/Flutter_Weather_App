import 'package:flutter/material.dart';
import 'package:flutter_weather_app/controller/degree_cubit/degree_cubit.dart';
import 'package:flutter_weather_app/core/shared/custom_popup_menu_button.dart';
import 'package:flutter_weather_app/data/commen/shared_pref_module.dart';
import 'package:flutter_weather_app/view/widgets/search_button.dart';

import '../../controller/home_cubit/home_cubit.dart';
import '../../core/utils/theme/app_colors.dart';

class TopAppBar extends StatelessWidget {
  const TopAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: SearchButton()),
        Container(
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            color: const Color(0xff23224A),
            borderRadius: BorderRadius.circular(8),
          ),
          child: IconButton(
            onPressed: () {
              HomeCubit.get(context).getCurrentPosition();
            },
            icon: const Icon(
              Icons.location_on_sharp,
              color: AppColors.whiteGrey,
            ),
          ),
        ),
        CustomPopUpMenuButton(
          buttons: [
            PopUpMenuItemModel(
              name: 'Celsius',
              onTap: () {
                DegreeCubit.get(context).changeDegreeType(DegreeType.celsius);
              },
            ),
            PopUpMenuItemModel(
              name: 'Fahrenheit',
              onTap: () {
                DegreeCubit.get(context).changeDegreeType(DegreeType.fahrenheit);
              },
            ),
          ],
        ),
      ],
    );
  }
}
