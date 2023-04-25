import 'package:flutter/material.dart';
import 'package:massage/screens/home/home_screen.dart';
import 'package:massage/screens/booking_screen.dart';
import 'package:massage/screens/notification_screen.dart';
import 'package:massage/screens/account/account_screen.dart';

class NavigatorItem {
  final String label;
  final String iconPath;
  final int index;
  final Widget screen;

  NavigatorItem(this.label, this.iconPath, this.index, this.screen);
}

List<NavigatorItem> navigatorItems = [
  NavigatorItem("HOME", "assets/icons/home.svg", 0, HomeScreen()),
  NavigatorItem("BOOKING", "assets/icons/calendar.svg", 1, BookingScreen()),
  NavigatorItem("NOTIFICATION", "assets/icons/notification-bell.svg", 2,
      NotificationScreen()),
  NavigatorItem("ACCOUNT", "assets/icons/user.svg", 3, AccountScreen()),
];
