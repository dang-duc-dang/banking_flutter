import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final FocusNode emailFocus = FocusNode();
  final TextEditingController passwordConfirmController =
      TextEditingController();
  final FocusNode passwordFocus = FocusNode();
  final TextEditingController passWordController = TextEditingController();
  final FocusNode passWordFocus = FocusNode();
  final TextEditingController nameController = TextEditingController();
  final FocusNode nameFocus = FocusNode();
  GlobalKey<FormState> keyValidate = GlobalKey();
  final showOld = false.obs;
  final checkBox = false.obs;
  final showConfirm = false.obs;
  toggleShowPassword(RxBool show) {
    show.value = !show.value;
  }
}
