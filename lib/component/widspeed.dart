import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/weatherController.dart';
import 'package:weather_app/model/color.dart';
import 'package:weather_app/model/weather.dart';

class WindSpeedInfo extends StatelessWidget {
  const WindSpeedInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.withOpacity(0.2),
              Colors.blue.withOpacity(0.0)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(30)),
      child: GetBuilder<WeatherController>(
        init: WeatherController(),
        builder: (controller) {
          List h = controller.hourlyList;
          Hourly current = controller.current;
          if (h.length == 0) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
            padding: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.air,
                  size: 50,
                  color: Colors.white,
                ),
                SizedBox(height: 20),
                Text(
                  "${current.values!["windSpeed"]}",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(height: 10),
                Text(
                  "Wind speed",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
