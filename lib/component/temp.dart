import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/weatherController.dart';
import 'package:weather_app/model/color.dart';

class TemperatureInfo extends StatelessWidget {
  const TemperatureInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
          color: darkGrey, borderRadius: BorderRadius.circular(30)),
      child: GetBuilder<WeatherController>(
        init: WeatherController(),
        builder: (controller) {
          List h = controller.dailyList;
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
                  Icons.local_fire_department_outlined,
                  size: 50,
                  color: Colors.white,
                ),
                SizedBox(height: 20),
                Text(
                  "${h[0].values.temperatureAvg.toStringAsFixed(0)}°C",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(height: 10),
                Text(
                  "Temperature",
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
