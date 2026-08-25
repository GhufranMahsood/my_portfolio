import 'package:flutter/material.dart';
import 'package:my_portfolio/config/theme/theme.dart';
import 'package:my_portfolio/config/utils/extensions.dart';
import 'package:my_portfolio/features/main/view/main_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      MainView().navigateAndRemove;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.black);
  }
}
