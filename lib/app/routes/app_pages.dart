import 'package:get/get.dart';

import 'package:kamus3bahasa/app/modules/detail/bindings/detail_binding.dart';
import 'package:kamus3bahasa/app/modules/detail/views/detail_view.dart';
import 'package:kamus3bahasa/app/modules/favorite/bindings/favorite_binding.dart';
import 'package:kamus3bahasa/app/modules/favorite/views/favorite_view.dart';
import 'package:kamus3bahasa/app/modules/home/bindings/home_binding.dart';
import 'package:kamus3bahasa/app/modules/home/views/home_view.dart';
import 'package:kamus3bahasa/app/modules/kalimat/bindings/kalimat_binding.dart';
import 'package:kamus3bahasa/app/modules/kalimat/views/kalimat_view.dart';
import 'package:kamus3bahasa/app/modules/team/bindings/team_binding.dart';
import 'package:kamus3bahasa/app/modules/team/views/team_view.dart';
import 'package:kamus3bahasa/app/modules/translate/bindings/translate_binding.dart';
import 'package:kamus3bahasa/app/modules/translate/views/translate_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL,
      page: () => DetailView(),
      binding: DetailBinding(),
    ),
    GetPage(
      name: _Paths.TRANSLATE,
      page: () => TranslateView(),
      binding: TranslateBinding(),
    ),
    GetPage(
      name: _Paths.KALIMAT,
      page: () => KalimatView(),
      binding: KalimatBinding(),
    ),
    GetPage(
      name: _Paths.FAVORITE,
      page: () => FavoriteView(),
      binding: FavoriteBinding(),
    ),
    GetPage(
      name: _Paths.TEAM,
      page: () => TeamView(),
      binding: TeamBinding(),
    ),
  ];
}
