import 'package:get/get.dart';

import '../../../shared_contents/router/router.dart';

class SplashController extends GetxController {
  double width = 100;

  @override
  void onInit() {
    Future.delayed(const Duration(milliseconds: 400), () => animateLogo());
    _goHome();
    super.onInit();
  }

  void animateLogo() {
    width = 120;
    update();
  }

  void onEnd() {
    width = width == 100 ? 120 : 100;
    update();
  }

  void _goHome() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offAllNamed(Routes.screenOneView);
  }
}
