import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:weather_app/component/Currentinfo.dart';
import 'package:weather_app/component/DayChart.dart';
import 'package:weather_app/component/humidity.dart';
import 'package:weather_app/component/temp.dart';
import 'package:weather_app/component/tempChart.dart';
import 'package:weather_app/component/widspeed.dart';
import 'package:weather_app/model/color.dart';

import '../controller/weatherController.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: black,
        body: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CurrentInfo(),
              Row(
                children: [
                  // Expanded(child: TemperatureInfo()),
                  Expanded(child: HumidityInfo()),
                  Expanded(child: WindSpeedInfo()),
                ],
              ),
              TemperatureChartInfo(),
              DayChartInfo(),
            ],
          ),
        ));
  }
}
