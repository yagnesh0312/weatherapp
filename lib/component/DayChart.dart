import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weather_app/component/DayComponent.dart';
import 'package:weather_app/controller/weatherController.dart';
import 'package:weather_app/model/color.dart';
import 'package:weather_app/model/weather.dart';

class DayChartInfo extends StatelessWidget {
  DayChartInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      decoration:
          BoxDecoration(color: black, borderRadius: BorderRadius.circular(30)),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Daily",
                  style: TextStyle(color: Colors.white,fontSize: 20),
                ),
                SizedBox(height:20),
                Container(
                  height: Get.height *0.38,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: h.length,
                      itemBuilder: (c, i) {
                        return DayComponent(data: h[i] as Daily);
                      }),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

/// Private class for storing the spline area chart datapoints.
