import 'package:get/get.dart';
import 'package:sitedi/app/modules/auth/controllers/auth_controller.dart';
import 'package:sitedi/app/modules/home/controllers/home_controller.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
    Get.put(HomeController(), permanent: true);
  }
}
