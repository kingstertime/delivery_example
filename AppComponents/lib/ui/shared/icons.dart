import 'package:flutter/material.dart';

class AppIcons {
  static const menu = 'assets/images/menu.png';
  static const cart = 'assets/images/cart.png';
  static const orders = 'assets/images/orders.png';
  static const burgerButton = 'assets/images/burger_button.png';
  static const star = 'assets/images/star.png';
  static const fillStar = 'assets/images/star_fill.png';
  static const gift = 'assets/images/gift.png';
  static const order = 'assets/images/order.png';
  static const profile = 'assets/images/profile.png';
  static const delivery = 'assets/images/delivery.png';
  static const plus = 'assets/images/plus.png';
  static const minus = 'assets/images/minus.png';
  static const mapPin = 'assets/images/map_pin.png';
  static const clock = 'assets/images/clock.png';
  static const wallet = 'assets/images/wallet.png';
  static const twoPeople = 'assets/images/two_people.png';
  static const user = 'assets/images/user.png';
  static const phone = 'assets/images/phone.png';
  static const comment = 'assets/images/comment.png';
  static const mapPicker = 'assets/images/map_picker.png';
  static const trash = 'assets/images/trash.svg';
  static const emptyCart = 'assets/images/empty_cart.png';
  static const illustrationCart = 'assets/images/illustration_cart.svg';
  static const ringing = 'assets/images/ringing.svg';
  static const bonusPay = 'assets/images/bonus_pay.svg';

  static Widget img(String path,
      {double? width, double? height, Color? color, BoxFit? fit}) {
    return Image.asset(
      path,
      width: width ?? 24,
      height: height ?? 24,
      color: color,
      fit: fit,
    );
  }
}
