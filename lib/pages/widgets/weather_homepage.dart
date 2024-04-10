import 'package:flutter/material.dart';
import 'package:term_project/helpers/my_text_field.dart';
import 'package:term_project/helpers/weather_HLtemp.dart';
import 'package:term_project/helpers/weather_Icon.dart';
import 'package:term_project/helpers/weather_current.dart';
import 'package:term_project/models/weather_model.dart';
import 'package:term_project/services/weather_Api.dart';

class weatherHomePage extends StatefulWidget {
  const weatherHomePage({super.key});

  @override
  State<weatherHomePage> createState() => _weatherHomePageState();
}

class _weatherHomePageState extends State<weatherHomePage> {
  WeatherApiCaller client = WeatherApiCaller();
  Weather? data;
  final TextEditingController _cityController = TextEditingController();

  Future<void> getData(String city) async {
    data = await client.getCurrentWeather(city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xFFf9f9f9),
      body: FutureBuilder(
        future: getData(
            _cityController.text.isEmpty ? 'Thailand' : _cityController.text),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SizedBox(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 150.0),
                    child: MyTextField(
                      controller: _cityController,
                      hintText: 'search here',
                      keyboardType: TextInputType.text,
                      onSubmitted: (value) {
                        setState(() {
                          getData(value);
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 40.0),
                  currentWeather('${data!.temperature?.round().toDouble()}',
                      '${data!.cityName}'),
                  SizedBox(height: 10.0),
                  weatehrIcon('${data!.weat_icon}'),
                  SizedBox(height: 10.0),
                  HLTemp(
                      '${data!.description}',
                      '${data!.temp_max?.round().toDouble()}',
                      '${data!.temp_min?.round().toDouble()}'),
                  SizedBox(height: 50.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Container(
                      height: 200.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 30.0,
                            offset: Offset(0, 10.0),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Humidity:  ${data!.humidity}%',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 25.0),
                            Text(
                              'Pressure:  ${data!.pressure}hPa',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 25.0),
                            Text(
                              'Wind:  ${data!.wind}meter/sec',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container();
        },
      ),
    );
  }
}
