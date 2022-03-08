import 'package:get/get.dart';
import '../../services/screen_one/screen_one_service.dart';
import '../../services/screen_one/screen_one_service_impl.dart';
import '../../features/screen_one/controllers/screen_one_controller.dart';
import '../../features/screen_one/views/screen_one_view.dart';
import '../../features/splash/views/splash_view.dart';

class Routes {
  static const String splashView = '/';
  static const String screenOneView = '/screen-one-view';

  static final List<GetPage> pages = [
    GetPage(
      name: splashView,
      page: () => const SplashView(),
    ),
    GetPage(
      name: screenOneView,
      page: () => const ScreenOneView(),
      binding: BindingsBuilder.put(() => ScreenOneController()),
    ),
  ];
}

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScreenOneService>(
      () => ScreenOneServiceImpl(),
      fenix: true,
    );
  }
}
