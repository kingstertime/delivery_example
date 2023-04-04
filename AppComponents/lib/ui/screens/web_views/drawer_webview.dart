import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superdostavka/ui/screens/web_views/drawer_webview_controller.dart';
import 'package:superdostavka/ui/shared/colors.dart';
import 'package:superdostavka/ui/shared/widgets/app_scaffold/src/app_scaffold.dart';
import 'package:vfx_flutter_common/getx_helpers.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DrawerWebView extends StatexWidget<DrawerWebViewController> {
  DrawerWebView({Key? key}) : super(() => DrawerWebViewController(), key: key);

  @override
  Widget buildWidget(BuildContext context) {
    return AppScaffold(
        navBarEnable: false,
        appBar: AppBar(
          backgroundColor: AppColors.purple,
          title: Text(controller.arguments.elementAt(1)),
          leading: Builder(
            builder: (ctx) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Get.back();
              },
            ),
          ),
        ),
        body: WebView(
          initialUrl: controller.arguments.first,
        ));
  }
}
