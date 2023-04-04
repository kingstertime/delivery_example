import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superdostavka/ui/screens/city/city_screen_controller.dart';
import 'package:superdostavka/ui/shared/colors.dart';
import 'package:superdostavka/ui/shared/ext.dart';
import 'package:superdostavka/ui/shared/widgets/app_scaffold/src/app_scaffold.dart';
import 'package:vfx_flutter_common/getx_helpers.dart';

class CityScreen extends StatexWidget<CityScreenController> {
  CityScreen({Key? key}) : super(() => CityScreenController(), key: key);

  @override
  Widget buildWidget(BuildContext context) {
    var backButton = false;
    if (Get.arguments != null && Get.arguments is bool) {
      backButton = Get.arguments;
    }
    return AppScaffold(
        backgroundColor: AppColors.purple,
        drawerEnableOpenDragGesture: false,
        navBarEnable: false,
        showDefaultAppBar: false,
        appBar: AppBar(
          elevation: 0,
          leading: backButton
              ? const BackButton(
                  color: Colors.white,
                )
              : null,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0.2),
              child: Container(
                color: Colors.white,
                height: 0.2,
              )),
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            'Выберите город',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        body: Obx(
          () {
            debugPrint('city: ${controller.cities.value}');
            return Column(
              children: [
                10.sbHeight,
                ListView.builder(
                    itemCount: controller.cities.value.length,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final currentCity = controller.cities.value[index];
                      return CityRow(
                          onTap: () =>
                              controller.onCityTap(currentCity, context),
                          cityName: currentCity.name.getOrElse());
                    })
              ],
            );
          },
        ));
  }
}

class CityRow extends StatelessWidget {
  const CityRow({Key? key, required this.onTap, required this.cityName})
      : super(key: key);

  final Function() onTap;

  final String cityName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(cityName,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            5.sbHeight,
            const Divider(
              color: Colors.white,
              thickness: 1,
            )
          ],
        ),
      ),
    );
  }
}
