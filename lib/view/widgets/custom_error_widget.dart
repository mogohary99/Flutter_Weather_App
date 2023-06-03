import 'package:flutter/material.dart';
import 'package:flutter_weather_app/controller/home_cubit/home_cubit.dart';

class CustomErrorWidget extends StatelessWidget {
  final String error;
  const CustomErrorWidget({
  super.key, required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            error,
            style:  const TextStyle(
                color: Colors.white,
                fontSize: 18
            ),
          ),
          const SizedBox(height: 10,),
          MaterialButton(
            onPressed: (){
              HomeCubit.get(context).getCityWeather();
            },
            color: Colors.white,
            child: const Text(
              'Try Again',
            ),
          )
        ],
      ),
    );
  }
}

