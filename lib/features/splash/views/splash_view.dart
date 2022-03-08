import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared_contents/constants/colors/colors.dart';
import '../../../shared_contents/constants/images/images.dart';
import '../controller/splash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: GetBuilder<SplashController>(
          init: SplashController(),
          builder: (controller) => AnimatedContainer(
            duration: const Duration(milliseconds: 800),
            curve: Curves.decelerate,
            width: controller.width,
            height: controller.width + 10,
            onEnd: () => controller.onEnd(),
            child: Image.asset(
              AppImages.appLogo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
