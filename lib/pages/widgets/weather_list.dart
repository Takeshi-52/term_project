import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:term_project/helpers/weather_current_list.dart';
import 'package:term_project/models/weather_model.dart';
import 'package:term_project/services/weather_Api.dart';

class weatherList extends StatefulWidget {
  const weatherList({super.key});

  @override
  State<weatherList> createState() => _weatherListState();
}

class _weatherListState extends State<weatherList> {
  WeatherApiCaller client = WeatherApiCaller();
  Weather? myloc;
  Weather? newyork;
  Weather? japan;
  Weather? singpo;
  Weather? aus;
  Weather? moroc;

  Future<void> getData() async {
    myloc = await client.getCurrentWeather('Thailand');
    newyork = await client.getCurrentWeather('New York City');
    japan = await client.getCurrentWeather('Japan');
    singpo = await client.getCurrentWeather('Singapore');
    aus = await client.getCurrentWeather('Australia');
    moroc = await client.getCurrentWeather('Morocco');
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Weather',
              style: GoogleFonts.playfairDisplay(
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color.fromARGB(255, 87, 87, 87),
      appBar: _buildAppBar(),
      body: Column(
        children: [
          FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(30.0),
                    children: [
                      currentlistWeather(
                        '${myloc?.cityName ?? ''}',
                        '${myloc?.description ?? ''}',
                        '${myloc?.temperature?.round().toDouble() ?? ''}',
                        '${myloc?.weat_icon ?? ''}',
                      ),
                      SizedBox(height: 16.0),
                      currentlistWeather(
                        '${newyork?.cityName ?? ''}',
                        '${newyork?.description ?? ''}',
                        '${newyork?.temperature?.round().toDouble() ?? ''}',
                        '${newyork?.weat_icon ?? ''}',
                      ),
                      SizedBox(height: 16.0),
                      currentlistWeather(
                        '${japan?.cityName ?? ''}',
                        '${japan?.description ?? ''}',
                        '${japan?.temperature?.round().toDouble() ?? ''}',
                        '${japan?.weat_icon ?? ''}',
                      ),
                      SizedBox(height: 16.0),
                      currentlistWeather(
                        '${singpo?.cityName ?? ''}',
                        '${singpo?.description ?? ''}',
                        '${singpo?.temperature?.round().toDouble() ?? ''}',
                        '${singpo?.weat_icon ?? ''}',
                      ),
                      SizedBox(height: 16.0),
                      currentlistWeather(
                        '${aus?.cityName ?? ''}',
                        '${aus?.description ?? ''}',
                        '${aus?.temperature?.round().toDouble() ?? ''}',
                        '${aus?.weat_icon ?? ''}',
                      ),
                      SizedBox(height: 16.0),
                      currentlistWeather(
                        '${moroc?.cityName ?? ''}',
                        '${moroc?.description ?? ''}',
                        '${moroc?.temperature?.round().toDouble() ?? ''}',
                        '${moroc?.weat_icon ?? ''}',
                      ),
                    ],
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
