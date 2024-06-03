import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/weatherController.dart';
import 'package:weather_app/model/color.dart';
import 'package:weather_app/model/weather.dart';

class HumidityInfo extends StatelessWidget {
  const HumidityInfo({super.key});

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
                  Icons.water_drop_outlined,
                  size: 50,
                  color: Colors.white,
                ),
                SizedBox(height: 20),
                Text(
                  "${current.values["humidity"]}",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(height: 10),
                Text(
                  "Humidity",
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
