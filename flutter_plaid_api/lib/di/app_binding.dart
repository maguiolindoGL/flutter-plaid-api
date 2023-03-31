import 'package:get/instance_manager.dart';
import 'package:plaid_poc/ui/bottomnav/getx/bottom_nav_controller.dart';

class AppBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavController());
  }

}