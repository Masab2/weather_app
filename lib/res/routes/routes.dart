import 'package:get/get.dart';
import 'package:weather_app/res/routes/routes_names.dart';
import 'package:weather_app/view/HomeScreen/HomeView.dart';
import 'package:weather_app/view/Splash_Screen/Splash_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RoutesNames.SplashScreen,
            page: () => const SplashScreen(),
            transition: Transition.leftToRight),
        GetPage(
            name: RoutesNames.HomeScreen,
            page: () => const HomeView(),
            transition: Transition.leftToRight)
      ];
}
