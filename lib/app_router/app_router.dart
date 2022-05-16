import 'package:animation/animation/explicit.dart';
import 'package:animation/animation/implicit.dart';
import 'package:get/get.dart';

class Routes {
  static const String implicitRoute = '/';
  static const String explicitRoute = '/explicitScreen';
  // static const String heroRoute = '/heroScreen';

}

List<GetPage<dynamic>> appRoutes = [
  GetPage(
    name: Routes.implicitRoute,
    page: () => Implicit(),
    transition: Transition.downToUp,
    transitionDuration: Duration(seconds: 1),
  ),
  GetPage(
    name: Routes.explicitRoute,
    page: () => Explicit(),
    transition: Transition.leftToRight,
    transitionDuration: Duration(seconds: 1),
  ),
  // GetPage(
  //   name: Routes.heroRoute,
  //   page: () => HeroAnimatiion(),
  //   transition: Transition.cupertino,
  //   transitionDuration: Duration(seconds: 1),
  // ),
];
