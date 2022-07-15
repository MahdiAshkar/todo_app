import 'package:get/get.dart';
import 'package:todo/pages/home_screen.dart';

class Routes {
  static List<GetPage> get pages =>
      [GetPage(name: '/homescreen', page: () => const HomeScreen())];
}
