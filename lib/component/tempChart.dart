import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weather_app/controller/weatherController.dart';
import 'package:weather_app/model/color.dart';
import 'package:weather_app/model/weather.dart';

class TemperatureChartInfo extends StatelessWidget {
  TemperatureChartInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      decoration:
          BoxDecoration(color: black, borderRadius: BorderRadius.circular(30)),
      child: GetBuilder<WeatherController>(
        init: WeatherController(),
        builder: (controller) {
          List h = controller.hourlyList;
          if (h.length == 0) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          h = h.sublist(0, 24);
          // for (var i = 0; i < h.length; i++) {
          //   print(h[i].time.toString() +
          //       " " +
          //       h[i].values["temperature"].toString());
          // }
          return Container(
            padding: EdgeInsets.only(top: 20, bottom: 20, left: 0, right: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SfCartesianChart(
                  plotAreaBorderWidth: 0,
                  // title: ChartTitle(
                  //     text: isCardView ? '' : 'Average high/low temperature of London'),
                  // legend: Legend(isVisible: true),
                  title: ChartTitle(
                      text: "Temperature",
                      alignment: ChartAlignment.near,
                      textStyle: TextStyle(color: Colors.white)),
                  primaryXAxis: CategoryAxis(
                    majorGridLines: MajorGridLines(width: 0),
                    // minimum: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 12, 30),
                    // initialZoomPosition: 0.1,
                    tickPosition: TickPosition.outside,
                    initialZoomFactor: 0.2,

                    axisLine: AxisLine(width: 0),
                    majorTickLines: MajorTickLines(size: 0, color: Colors.blue),
                  ),
                  tooltipBehavior: TooltipBehavior(enable: true),
                  trackballBehavior: TrackballBehavior(enable: true),
                  primaryYAxis: NumericAxis(
                      axisLine: AxisLine(width: 0),
                      maximum: 45,
                      minimum: 25,
                      majorGridLines: MajorGridLines(
                          width: 1, color: Colors.grey.withOpacity(0.1)),
                      edgeLabelPlacement: EdgeLabelPlacement.shift,
                      labelFormat: '{value}°C',
                      majorTickLines:
                          MajorTickLines(size: 0, color: Colors.blue)),
                  zoomPanBehavior: ZoomPanBehavior(

                      /// To enable the pinch zooming as true.
                      enablePinching: true,
                      zoomMode: ZoomMode.x,
                      enablePanning: true,
                      enableMouseWheelZooming: true),

                  series: [
                    SplineAreaSeries<dynamic, String>(
                      enableTooltip: true,
                      dataLabelSettings: DataLabelSettings(
                        isVisible: true,
                        textStyle: TextStyle(color: Colors.white),
                      ),
                      dataSource: h,
                      markerSettings: MarkerSettings(
                          isVisible: true,
                          color: Colors.black,
                          borderWidth: 0.5),
                      borderColor: Colors.blue,
                      color: Colors.blue.withOpacity(0.6),
                      gradient: LinearGradient(
                          colors: [Colors.black, Colors.blue].reversed.toList(),
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                      name: 'Temperature',
                      xValueMapper: (dynamic sales, _) {
                        // print(_.toString() +
                        //     "" +
                        //     sales.time.toString() +
                        //     " " +
                        //     sales.values['temperature'].toString());
                        return DateFormat("hh:mm a").format(sales.time);
                      },
                      yValueMapper: (dynamic sales, _) =>
                          sales.values['temperature'],
                    )
                  ],
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
