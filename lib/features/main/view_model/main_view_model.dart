import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/config/controller/navigation_controller.dart';
import 'package:my_portfolio/config/utils/enum.dart';
import 'package:my_portfolio/features/main/model/main_nav_item.dart';
import 'package:my_portfolio/features/main/repo/main_repo.dart';

class MainViewModel extends GetxController {
  final MainRepo _repo;

  MainViewModel({MainRepo? repo}) : _repo = repo ?? MainRepo();

  late final List<MainNavItem> navItems;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void onInit() {
    super.onInit();
    navItems = _repo.getNavItems();
  }

  void openDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
  }

  void closeDrawer() {
    if (scaffoldKey.currentState?.isEndDrawerOpen ?? false) {
      scaffoldKey.currentState?.closeEndDrawer();
    }
  }

  void onNavItemTap(SectionType section) {
    closeDrawer();
    NavigationController.to.scrollToSection(section);
  }
}
