import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/controller/weatherController.dart';
import 'package:weather_app/model/color.dart';
import 'package:weather_app/model/weather.dart';

class CurrentInfo extends StatelessWidget {
  CurrentInfo({super.key});
  Color fontcolor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.withOpacity(0.5), Colors.blue.withOpacity(0)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          // image: DecorationImage(
          //     image: AssetImage("assets/day.png"),
          //     fit: BoxFit.cover,
          //     alignment: Alignment.topCenter,
          //     filterQuality: FilterQuality.low),
          // border: Border.all(
          //     color: Colors.blue, strokeAlign: BorderSide.strokeAlignInside,width: 10),
          borderRadius: BorderRadius.circular(30)),
      clipBehavior: Clip.hardEdge,
      child: Container(
        decoration: BoxDecoration(
            // gradient: LinearGradient(
            //   colors: [
            //     const Color.fromARGB(255, 255, 255, 255).withOpacity(1),
            //     Color.fromARGB(255, 255, 255, 255).withOpacity(0.4)
            //   ],
            //   begin: Alignment.centerLeft,
            //   end: Alignment.topRight,
            // ),
            ),
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
            print(current.values);
            return Container(
              padding:
                  EdgeInsets.only(top: 50, bottom: 20, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.address.value,
                            style: TextStyle(
                                color: fontcolor.withOpacity(0.5),
                                fontSize: 30),
                          ),
                          Text(
                            DateFormat("h:mm a dd MMMM, yyyy")
                                .format(DateTime.now()),
                            style: TextStyle(fontSize: 10, color: fontcolor),
                          ),
                        ],
                      ),
                      Spacer(),
                      // Image.network(
                      //     "https://files.readme.io/fcae973-weather_icon_small_ic_rain_light_partly_cloudy3x.png")
                    ],
                  ),
                  SizedBox(height: 30),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: current.values!['temperature'].toString(),
                          style: TextStyle(
                              fontSize: 120,
                              fontWeight: FontWeight.normal,
                              color: fontcolor),
                        ),
                        TextSpan(
                          text: " °C",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.normal,
                              color: fontcolor),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Divider(
                    color: black,
                  ),
                  Text(
                    controller.weatherCode["weatherCode"]
                        [current.values!['weatherCode']!.toStringAsFixed(0)],
                    style: TextStyle(
                        fontSize: 30, color: fontcolor.withOpacity(0.5)),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
