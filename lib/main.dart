import 'package:animation/app_router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'animation/implicit.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: appRoutes,
      debugShowCheckedModeBanner: false,
    
    );
  }
}
