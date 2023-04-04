import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superdostavka/core/utils/stream_subscriber.dart';
import 'package:superdostavka/domain/api_key/api_key.dart';
import 'package:superdostavka/domain/core/value_objects.dart';
import 'package:superdostavka/logic/auth/auth_bloc.dart';
import 'package:superdostavka/routing.dart';
import 'package:superdostavka/ui/screens/login/user_info_service.dart';
import 'package:superdostavka/ui/shared/app_alert.dart';
import 'package:vfx_flutter_common/get_rx_decorator.dart';

class AuthService extends GetxService with StreamSubscriberMixin {
  AuthService({
    AuthBloc? authBloc,
    UserInfoService? userInfoService,
  })  : authBloc = authBloc ?? AuthBloc.makeInstance(),
        userInfoService = userInfoService ?? Get.find();

  final AuthBloc authBloc;

  final currentPhone = 0.obsDeco();

  final isCodeSent = false.obsDeco();

  final isAuthenticated = false.obsDeco();

  final isLoading = false.obsDeco();

  final apiKey = ApiKey(apiKey: ''.nonEmpty).obsDeco();

  final UserInfoService userInfoService;

  @override
  void onInit() {
    super.onInit();
    authBloc.stream.listen(_processAuth);
     /*authBloc.add(AuthEvent.saveApiKey(ApiKey(
        apiKey: 'NDAyMGE0MWM2YjMxOWZhMTQ1OTU0NzY2MDRiNGJjMWNiNWRiMWNhNg'
            .nonEmpty)));*/
    /*authBloc.add(AuthEvent.saveApiKey(ApiKey(apiKey: ''.nonEmpty)));*/
    getApiKey();
  }

  void getApiKey() => authBloc.add(const AuthEvent.getApiKey());

  void sendCode(int phone) => authBloc.add(AuthEvent.sendCode(phone));

  void generateApiKey(
          {required int phone, required int code, required int cityId}) =>
      authBloc.add(AuthEvent.generateApiKey(phone, code, cityId));

  void logout() {
    isAuthenticated.value = false;
    authBloc.add(AuthEvent.saveApiKey(ApiKey(apiKey: ''.nonEmpty)));
  }

  void _processAuth(AuthState state) {
    state.maybeWhen(
        sentCode: (d) {
          d.maybeWhen(
              loading: () => isLoading.value = true,
              result: (result) {
                isLoading.value = false;
                result.fold((l) {
                  isCodeSent.value = false;
                }, (r) {
                  isCodeSent.value = r.isSent;
                  Get.toNamed(AppRoutes.code);
                });
              },
              orElse: () => isCodeSent.value = false);
        },
        gotApiKey: (d) {
          d.maybeWhen(
              result: (result) {
                result.fold((l) {
                  isAuthenticated.value = false;
                }, (r) {
                  apiKey.value = r;
                  if (r.apiKey.getOrElse().isNotEmpty) {
                    userInfoService.getUserInfo();
                    isAuthenticated.value = true;
                  }
                });
              },
              orElse: () {});
        },
        generatedApiKey: (d) {
          d.maybeWhen(
              loading: () => isLoading.value = true,
              result: (result) {
                isLoading.value = false;
                result.fold((l) {
                  appAlert(value: '${l.error}', color: Colors.red);
                  isAuthenticated.value = false;
                }, (r) {
                  debugPrint('test: ${r.apiKey}');
                  if (r.apiKey.getOrElse().isNotEmpty) {
                    apiKey.value = r;
                    authBloc.add(AuthEvent.saveApiKey(r));
                    userInfoService.getUserInfo();
                    isAuthenticated.value = true;
                    debugPrint('tut');
                    Get.toNamed(AppRoutes.menu);
                  } else {
                    appAlert(value: 'Неверный код', color: Colors.red);
                    isAuthenticated.value = false;
                  }
                });
              },
              orElse: () {});
        },
        orElse: () {});
  }
}
