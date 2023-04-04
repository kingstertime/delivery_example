import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:superdostavka/ui/screens/create_order/address/add_address/add_address_screen_controller.dart';
import 'package:superdostavka/ui/shared/colors.dart';
import 'package:superdostavka/ui/shared/ext.dart';
import 'package:superdostavka/ui/shared/icons.dart';
import 'package:superdostavka/ui/shared/widgets/app_scaffold/src/app_scaffold.dart';
import 'package:vfx_flutter_common/getx_helpers.dart';

class AddAddressScreen extends StatexWidget<AddAddressScreenController> {
  AddAddressScreen({Key? key})
      : super(() => AddAddressScreenController(), key: key);

  @override
  Widget buildWidget(BuildContext context) {
    GlobalKey<ExpandableBottomSheetState> key = GlobalKey();

    return Obx(
      () {
        controller.isTapped.value;
        return AppScaffold(
            extendBodyBehindAppBar: true,
            showDefaultAppBar: false,
            appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  color: Colors.black,
                  onPressed: () {
                    Get.back();
                  },
                )),
            resizeToAvoidBottomInset: true,
            navBarEnable: false,
            body: ExpandableBottomSheet(
              key: key,
              expandableContent: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                height: Get.height - 400,
                color: AppColors.mainBackground,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                            child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Кв./Офис',
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                          ),
                        )),
                        5.sbWidth,
                        const Flexible(
                            child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Подъезд',
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                          ),
                        )),
                        5.sbWidth,
                        const Flexible(
                            child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Этаж',
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                          ),
                        )),
                      ],
                    ),
                    10.sbHeight,
                    const TextField(
                      decoration: InputDecoration(
                        hintText: 'Комментарий к адресу доставки',
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                    )
                  ],
                ),
              ),
              background: Stack(
                children: [
                  GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: controller.initialCameraPosition),
                  Center(
                    child: Image.asset(
                      AppIcons.mapPicker,
                      color: Colors.orange,
                      width: 40,
                      height: 40,
                    ),
                  )
                ],
              ),
              persistentHeader: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                height: 200,
                color: AppColors.mainBackground,
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Укажите адрес доставки',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.gps_fixed,
                              color: Colors.orange,
                              size: 20,
                            )),
                      ],
                    ),
                    Flexible(
                      child: TextField(
                        controller: controller.addressController,
                        decoration: const InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey))),
                      ),
                    ),
                    10.sbHeight,
                    if (key.currentState?.expansionStatus !=
                        ExpansionStatus.expanded) ...[
                      TextButton(
                        onPressed: () {
                          if (key.currentState?.expansionStatus ==
                                  ExpansionStatus.expanded &&
                              controller.addressController.text.isNotEmpty) {
                            controller.addAddress();
                            key.currentState?.contract();
                            Get.back();
                          } else {
                            key.currentState?.expand();
                          }
                        },
                        child: Container(
                          width: Get.width - 30,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                              child: Text(
                            'Далее',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
                        ),
                      )
                    ],
                  ],
                ),
              ),
            ));
      },
    );
  }
}
