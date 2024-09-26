import 'package:get/get.dart';

import '../../modules/category_detailes/binding/category_details_binding.dart';
import '../../modules/category_detailes/view/category_details_page.dart';
import '../../modules/detailes/binding/detaile_binding.dart';
import '../../modules/detailes/view/pages/detail_page.dart';
import '../../modules/main/binding/main_binding.dart';
import '../../modules/main/view/pages/main_page.dart';
import '../../modules/splash/view/pages/splash_page.dart';
import '../constant/routes/app_routes.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: AppRoutes.splashRoute,
      page: () => const SplashPage(),
      transition: Transition.fade,
      // binding: SplashBinding(),
      transitionDuration: const Duration(milliseconds: 700)),
  GetPage(
      name: AppRoutes.mainRoute,
      page: () => MainPage(),
      transition: Transition.fade,
      binding: MainBinding(),
      transitionDuration: const Duration(milliseconds: 700)),
  GetPage(
      name: AppRoutes.viewDetails,
      page: () => DetailPage(),
      transition: Transition.fade,
      binding: DetailBinding(),
      transitionDuration: const Duration(milliseconds: 700)),
  GetPage(
      name: AppRoutes.categoryDetails,
      page: () => CategoryDetailsPage(),
      transition: Transition.fade,
      binding: CategoryDetailBinding(),
      transitionDuration: const Duration(milliseconds: 700)),
];
