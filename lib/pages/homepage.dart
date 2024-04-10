import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:term_project/pages/widgets/weather_homepage.dart';
import 'package:term_project/pages/widgets/weather_list.dart';
import 'package:term_project/pages/widgets/weather_map.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;

  void _handleClickButton(int index) {
    setState(() {
      _selectedIndex = index;
      HapticFeedback.lightImpact();
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildPageBody() {
      switch (_selectedIndex) {
        case 0:
          return const weatherMap();
        case 1:
          return const weatherHomePage();
        case 2:
          return const weatherList();
        default:
          return const weatherHomePage();
      }
    }

    return Scaffold(
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 30,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  _handleClickButton(0);
                },
                child: Icon(Icons.map),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  _handleClickButton(1);
                },
                child: Icon(Icons.home),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  _handleClickButton(2);
                },
                child: Icon(Icons.list),
              ),
            ),
          ],
        ),
      ),
      body: _buildPageBody(),
    );
  }
}
