import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:food_flutter/constants/utils/error_util.dart';
import 'package:food_flutter/data/apiClient/api_client.dart';
import 'package:food_flutter/data/database_local/app_prefs.dart';
import 'package:food_flutter/data/models/user/user_model.dart';
import 'package:food_flutter/routes/app_pages.dart';
import 'package:food_flutter/widget/dialog/dialog_util.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final ApiClient client;
  RegisterController({required this.client});
  final TextEditingController phoneController = TextEditingController();
  final FocusNode phoneFocus = FocusNode();
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
  final email = "".obs;
  final showConfirm = false.obs;
  toggleShowPassword(RxBool show) {
    show.value = !show.value;
  }

  @override
  onInit() {
    super.onInit();
    if (Get.arguments != null) {
      email.value = Get.arguments['email'] as String;
    }
  }

  onRegister() async {
    if (keyValidate.currentState!.validate()) {
      final data = {
        "email": email.value,
        "phone": phoneController.text,
        "fullName": nameController.text,
        "password": passwordConfirmController.text
      };
      EasyLoading.show(status: 'loading'.tr);
      await client.register(data).then((response) async {
        UserModel userData = UserModel.fromJson(response.data['data']['user']);
        print('${userData}userData');
        String accessToken = response.data['data']['access_token'];
        AppPrefs.accessToken = accessToken;
        AppPrefs.userData = userData;
        print("TOKEN $accessToken , userData $userData ");
        userData.save();
        EasyLoading.dismiss();
        DialogUtil.showSuccessMessage('Đăng nhập thành công');
        Get.offNamed(AppRoutes.dashboard);
      }).catchError((error, trace) {
        EasyLoading.dismiss();
        ErrorUtil.catchError(error, trace);
      });
    }
  }
}
