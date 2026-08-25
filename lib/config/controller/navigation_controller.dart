import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/config/utils/enum.dart';

class NavigationController extends GetxController {
  static NavigationController get to => Get.find();

  final ScrollController scrollController = ScrollController();
  final Rx<SectionType> activeSection = SectionType.header.obs;
  final RxBool showBackToTop = false.obs;

  // GlobalKeys for each section
  final GlobalKey headerKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey techKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey experienceKey = GlobalKey();
  final GlobalKey communityKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (scrollController.offset > 400 && !showBackToTop.value) {
      showBackToTop.value = true;
    } else if (scrollController.offset <= 400 && showBackToTop.value) {
      showBackToTop.value = false;
    }
  }

  void scrollToSection(SectionType section) {
    activeSection.value = section;
    GlobalKey? targetKey;
    switch (section) {
      case SectionType.header:
        targetKey = headerKey;
        break;
      case SectionType.about:
        targetKey = aboutKey;
        break;
      case SectionType.tech:
        targetKey = techKey;
        break;
      case SectionType.projects:
        targetKey = projectsKey;
        break;
      case SectionType.experience:
        targetKey = experienceKey;
        break;
      case SectionType.community:
        targetKey = communityKey;
        break;
      case SectionType.contact:
        targetKey = contactKey;
        break;
    }

    if (targetKey.currentContext != null) {
      Scrollable.ensureVisible(
        targetKey.currentContext!,
        duration: const Duration(milliseconds: 650),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  void scrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  void onClose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.onClose();
  }
}
