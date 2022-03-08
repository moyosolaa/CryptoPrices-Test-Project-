import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../shared_contents/router/router.dart';

class TalosTest extends StatelessWidget {
  const TalosTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBindings(),
      debugShowCheckedModeBanner: false,
      title: 'Talos Test',
      initialRoute: Routes.splashView,
      getPages: Routes.pages,
    );
  }
}
