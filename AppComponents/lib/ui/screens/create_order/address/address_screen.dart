import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superdostavka/routing.dart';
import 'package:superdostavka/ui/screens/create_order/address/address_screen_controller.dart';
import 'package:superdostavka/ui/shared/colors.dart';
import 'package:superdostavka/ui/shared/ext.dart';
import 'package:superdostavka/ui/shared/widgets/app_scaffold/src/app_scaffold.dart';
import 'package:vfx_flutter_common/getx_helpers.dart';

class AddressScreen extends StatexWidget<AddressScreenController> {
  AddressScreen({Key? key}) : super(() => AddressScreenController(), key: key);

  @override
  Widget buildWidget(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: AppScaffold(
          showDefaultAppBar: false,
          navBarEnable: false,
          backgroundColor: AppColors.mainBackground,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.orange,
            onPressed: () => Get.toNamed(AppRoutes.addAddress),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              iconSize: 20,
              onPressed: () => Get.back(),
            ),
            title: const TabBar(
              tabs: [
                Tab(
                  text: 'Доставка',
                ),
                Tab(
                  text: 'Самовывоз',
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [DeliveryTab(), PickupTab()],
          )),
    );
  }
}

class DeliveryTab extends GetViewSim<AddressScreenController> {
  const DeliveryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.addressesList.value.isEmpty) {
        return const SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'Список пуст',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
        );
      } else {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.sbHeight,
              const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  'Адрес доставки',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              5.sbHeight,
              const Divider(
                color: Colors.grey,
                height: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.addressesList.value.length,
                    itemBuilder: (context, index) {
                      final currentAddress =
                          controller.addressesList.value.elementAt(index);
                      return AddressItem(
                        address: currentAddress,
                        onRemove: () {
                          controller.removeAddress(index);
                        },
                        onTap: () {
                          controller.setCurrentAddress(index);
                          Get.back();
                        },
                      );
                    }),
              )
            ],
          ),
        );
      }
    });
  }
}

class AddressItem extends GetViewSim<AddressScreenController> {
  const AddressItem({
    required this.address,
    required this.onRemove,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final String address;

  final Function() onRemove;

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => onTap(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(address),
              const Spacer(),
              IconButton(
                  onPressed: () => onRemove(),
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 20,
                  ))
            ],
          ),
          const Divider(
            color: Colors.grey,
            height: 1,
          )
        ],
      ),
    );
  }
}

class PickupTab extends GetViewSim<AddressScreenController> {
  const PickupTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        10.sbHeight,
        const Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text(
            'Пункт самовывоза',
            style: TextStyle(fontSize: 12),
          ),
        ),
        3.sbHeight,
        const Divider(
          color: Colors.grey,
          height: 2,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: ListView.builder(
              itemCount: controller.pickupAddresses.value.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final currentAddress = controller.pickupAddresses.value[index];
                return TextButton(
                    onPressed: () => controller.tapOnAddress(currentAddress),
                    child: Text(
                      currentAddress.name.getOrElse(),
                      style: const TextStyle(color: Colors.black),
                    ));
              }),
        )
      ],
    ));
  }
}
