import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final FocusNode emailFocus = FocusNode();
  final TextEditingController passWordController = TextEditingController();
  final FocusNode passWordFocus = FocusNode();
  final showOld = false.obs;
  toggleShowPassword(RxBool show) {
    show.value = !show.value;
  }
}
