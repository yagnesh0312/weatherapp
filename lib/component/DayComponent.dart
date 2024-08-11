import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/weather.dart';

class DayComponent extends StatelessWidget {
  final Daily data;
  DayComponent({super.key, required this.data});
  var fontColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(300),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: EdgeInsets.symmetric(horizontal: 10,),
      // width: Get.width / 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${DateFormat('E').format(data.time!)}",
            style: TextStyle(color: fontColor, fontSize: 30),
          ),
          SizedBox(height: 10),
          Text(
            "Temerature",
            style: TextStyle(color: fontColor.withOpacity(0.6), fontSize: 10),
          ),
          Text(
            "${data.values!.temperatureAvg!.toStringAsFixed(0)}°",
            style: TextStyle(color: fontColor, fontSize: 30),
          ),
          SizedBox(height: 10),
          Text(
            "Humidity",
            style: TextStyle(color: fontColor.withOpacity(0.6), fontSize: 10),
          ),
          Text(
            "${data.values!.humidityAvg!.toStringAsFixed(0)}",
            style: TextStyle(color: fontColor, fontSize: 30),
          ),
          SizedBox(height: 10),
          Text(
            "Wind Speed",
            style: TextStyle(color: fontColor.withOpacity(0.6), fontSize: 10),
          ),
          Text(
            "${data.values!.windGustAvg!.toStringAsFixed(0)} kms",
            style: TextStyle(color: fontColor, fontSize: 30),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
