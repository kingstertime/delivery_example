import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superdostavka/domain/config/config.dart';
import 'package:superdostavka/logic/core/config_service.dart';
import 'package:superdostavka/ui/shared/dialog.dart';
import 'package:vfx_flutter_common/get_rx_decorator.dart';
import 'package:vfx_flutter_common/getx_helpers.dart';

class CityScreenController extends StatexController {
  CityScreenController({ConfigService? configService})
      : configService = configService ?? Get.find();

  final ConfigService configService;

  GetRxDecorator<List<City>> get cities => configService.config.value
      .fold((l) => <City>[].obsDeco(), (r) => r.cities.obsDeco());

  void onCityTap(City city, BuildContext context) {
    if (configService.currentCity.value.id != 0) {
      showDialog(
          context: context,
          builder: (context) => AppDialog(
                title: 'Внимание',
                desc: 'При смене типа доставки ваша корзина обнуляется',
                cancelButton: 'Отмена',
                submitButton: 'Хорошо',
                onSubmit: () => configService.chooseCity(city),
              ));
    } else {
      configService.chooseCity(city);
    }
  }
}
