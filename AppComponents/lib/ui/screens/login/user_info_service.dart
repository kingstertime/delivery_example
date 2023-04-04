import 'package:get/get.dart';
import 'package:superdostavka/core/utils/stream_subscriber.dart';
import 'package:superdostavka/domain/user_info/user_info.dart';
import 'package:superdostavka/logic/user_info/user_info_bloc.dart';
import 'package:vfx_flutter_common/get_rx_decorator.dart';

class UserInfoService extends GetxService with StreamSubscriberMixin {
  UserInfoService({UserInfoBloc? userInfoBloc})
      : userInfoBloc = userInfoBloc ?? UserInfoBloc.makeInstance();

  final UserInfoBloc userInfoBloc;

  final GetRxDecorator<UserInfo> userInfo = UserInfo.empty.obsDeco();

  final isLoading = false.obsDeco();

  @override
  void onInit() {
    super.onInit();
    userInfoBloc.stream.listen(_processUserInfo);
    getUserInfo();
  }

  void getUserInfo() => userInfoBloc.add(UserInfoEvent.getUserInfo(2));

  void _processUserInfo(UserInfoState state) {
    state.maybeWhen(
        gotUserInfo: (d) {
          d.maybeWhen(
              loading: () => isLoading.value = true,
              result: (r) {
                isLoading.value = false;
                r.fold((l) {
                  userInfo.value = UserInfo.empty;
                  userInfo.refresh();
                }, (r) {
                  userInfo.value = r;
                  userInfo.refresh();
                });
              },
              orElse: () {});
        },
        orElse: () {});
  }
}
