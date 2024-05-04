import 'package:flutter/material.dart';

mixin AppImages {
  static const Widget homeHeader = Image(
    image: AssetImage('assets/images/header_bg.jpg'),
    fit: BoxFit.fill,
  );
  static const Widget logoImage = Image(
    image: AssetImage('assets/images/logo.png'),
    fit: BoxFit.fill,
  );
  static final homeIconSelected = Image.asset(
    'assets/icons/home_icon_selected.png',
    fit: BoxFit.contain,
    width: 16,
    height: 16,
  );
  static final diaryIconSelected = Image.asset(
    'assets/icons/diary_icon_selected.png',
    fit: BoxFit.contain,
    width: 16,
    height: 16,
  );
  static final diaryIcon = Image.asset(
    'assets/icons/diary_icon.png',
    fit: BoxFit.contain,
    width: 16,
    height: 16,
  );
  static final marketIconSelected = Image.asset(
    'assets/icons/market_icon_selected.png',
    fit: BoxFit.contain,
    width: 16,
    height: 16,
  );
  static final marketIcon = Image.asset(
    'assets/icons/market_icon.png',
    fit: BoxFit.contain,
    width: 16,
    height: 16,
  );
  static final notificationIcon = Image.asset(
    'assets/icons/notification_icon.png',
    fit: BoxFit.contain,
    width: 16,
    height: 16,
  );

  static final connectingDriverGif = Image.asset(
    'assets/icons/gif/connectingDriverGif.gif',
    fit: BoxFit.fill,
    width: 100,
    height: 100,
  );
  static final loadingBarGif = Image.asset(
    'assets/icons/gif/loading_bar.gif',
    fit: BoxFit.fill,
    width: 1500,
    height: 80,
  );

// Images
  static const logoWhite = 'assets/images/logo_original.jpg';
  static const logoTrans = 'assets/images/logo_white.png';
  static const logoHorizontalWhite = 'assets/images/logo_horizontal_white.png';
  static const loginImage = 'assets/images/pic3.jpg';
  static const forgotPasswordImage = 'assets/images/pic1.jpg';
  static const forgotImage = 'assets/images/forgot_image.png';
  static const logo = 'assets/images/logo.png';
  static const before = 'assets/images/before.png';
  static const exerciseCard = 'assets/images/exercise_card.jpg';
  static const mealCard = 'assets/images/meal_card.jpg';
  static const popularCard = 'assets/images/popular.jpg';
  static const fastingCard = 'assets/images/fasting.jpg';
  static const dietCard = 'assets/images/diet.jpg';
  static const hiitCard = 'assets/images/hiit.jpg';
}
