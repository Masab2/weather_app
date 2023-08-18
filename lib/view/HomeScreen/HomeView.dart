import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/Utils/Colors/AppColors.dart';
import 'package:weather_app/Utils/Urls/appUrls.dart';
import 'package:weather_app/Utils/Utils.dart';
import 'package:weather_app/data/status.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/res/components/Rowone.dart';
import 'package:weather_app/res/components/minMaxRow.dart';
import 'package:weather_app/view/Settings/settings.dart';
import '../../viewModels/controller/HomeViewModel/homeViewController.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeContoller = Get.put(HomeViewController());
  @override
  void initState() {
    // implement initState
    super.initState();
    homeContoller.getCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "${DateFormat.EEEE().format(DateTime.now())}\t\t${DateFormat('dd-LLLL-yyyy').format(DateTime.now())}",
          style: GoogleFonts.workSans(
              textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColor.subheadingColor)),
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: 1,
                  // row has two child icon and text.
                  child: Row(
                    children: [
                      const Icon(Icons.settings),
                      SizedBox(
                        width: Get.width * 0.03,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Settings(),
                              ));
                        },
                        child: Text(
                          "Settings",
                          style: GoogleFonts.workSans(
                              textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          )),
                        ),
                      )
                    ],
                  ),
                ),
              ];
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Obx(() {
          switch (homeContoller.rxRequestStatus.value) {
            case Status.LOADING:
              return const Center(child: CircularProgressIndicator());
            case Status.ERROR:
              return const Text('SomeThing Went Wrong');
            case Status.COMPLETED:
              return Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.07,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                          child: Text(
                        homeContoller.weathermodel.value.name!
                            .toUpperCase()
                            .toString(),
                        style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 27, fontWeight: FontWeight.bold)),
                      )),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Center(
                          child: Text(
                        homeContoller.weathermodel.value.weather!.first.main!
                            .toUpperCase()
                            .toString(),
                        style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: AppColor.subheadingColor)),
                      )),
                      Image.network(
                        AppUrls.buildUrlIcon(homeContoller
                            .weathermodel.value.weather!.first.icon
                            .toString()),
                        height: 130,
                        width: 130,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            Utils.kelvin_to_clecius(homeContoller
                                    .weathermodel.value.main!.temp!
                                    .toDouble())
                                .toString()
                                .substring(0, 4),
                            style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                    fontSize: 69, fontWeight: FontWeight.w400)),
                          ),
                          Text(
                            ' c',
                            style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            )),
                          )
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.04,
                      ),
                      MinMaxRow(
                        max: Utils.kelvin_to_clecius(homeContoller
                                .weathermodel.value.main!.tempMax!
                                .toDouble())
                            .toString()
                            .substring(0, 4),
                        min: Utils.kelvin_to_clecius(homeContoller
                                .weathermodel.value.main!.tempMin!
                                .toDouble())
                            .toString()
                            .substring(0, 4),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: Get.height * 0.05),
                    child: const Divider(
                      color: AppColor.subheadingColor,
                      thickness: 0.20,
                      indent: 25,
                      endIndent: 25,
                    ),
                  ),
                  RowOne(
                    value1: homeContoller.weathermodel.value.sys!.country
                        .toString(),
                    value2: Utils.dateFormated(
                        homeContoller.weathermodel.value.sys!.sunrise),
                    value3: Utils.dateFormated(
                        homeContoller.weathermodel.value.sys!.sunset),
                    text1: 'Country',
                    text2: 'Sun Rise',
                    text3: 'Sun Set',
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: Get.height * 0.03),
                    child: const Divider(
                      color: AppColor.subheadingColor,
                      thickness: 0.20,
                      indent: 25,
                      endIndent: 25,
                    ),
                  ),
                  RowOne(
                    value1:
                        '${homeContoller.weathermodel.value.wind!.speed.toString()} m/s',
                    value2:
                        '${Utils.PressureConvertions(homeContoller.weathermodel.value.main!.pressure).toDouble().toString().substring(0, 4)} hg',
                    value3:
                        '${homeContoller.weathermodel.value.main!.humidity.toString()}%',
                    text1: 'Wind Speed',
                    text2: 'Pressure',
                    text3: 'Humidity',
                  ),
                ],
              );
          }
        }),
      ),
    );
  }
}
