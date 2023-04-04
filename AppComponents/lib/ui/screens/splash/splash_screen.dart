import 'package:flutter/material.dart';
import 'package:superdostavka/ui/screens/splash/splash_screen_contorller.dart';
import 'package:vfx_flutter_common/getx_helpers.dart';

class SplashScreen extends StatexWidget<SplashScreenController> {
  SplashScreen({Key? key}) : super(() => SplashScreenController(), key: key);

  @override
  Widget buildWidget(BuildContext context) {
    return const Material(
      child: Center(
        child: Icon(Icons.ac_unit),
      ),
    );
  }
}
