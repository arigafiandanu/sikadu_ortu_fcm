import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sikadu_ortu/app/controllers/auth_controller.dart';

import '../../../routes/app_pages.dart';
import '../../../style/textStyle.dart';
import '../../../widget/buttonW.dart';
import '../../../widget/textfieldW.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final authC = Get.put(AuthController());

  LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: Get.height * 0.4,
            width: Get.width,
            child: Lottie.asset("assets/lottie/login_admin.json"),
          ),
          Column(
            children: [
              CustomFormField(
                headingText: "Email",
                hintText: "Masukan Email",
                obsecureText: false,
                suffixIcon: const SizedBox(),
                controller: authC.emailC,
                maxLines: 1,
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 16,
              ),
              Obx(
                () => CustomFormField(
                  headingText: "Password",
                  maxLines: 1,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.text,
                  hintText: "Masukan Password",
                  obsecureText: authC.hidepass.value,
                  suffixIcon: IconButton(
                    icon: authC.hidepass.value
                        ? const Icon(
                            Icons.visibility_off,
                            color: Colors.blue,
                          )
                        : const Icon(
                            Icons.visibility,
                            color: Colors.blue,
                          ),
                    onPressed: () {
                      authC.hidepass.value = !authC.hidepass.value;
                    },
                  ),
                  controller: authC.passwordC,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 24),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.LUPA_PASS);
                      },
                      child: Text(
                        "Lupa Password?",
                        style: TextStyle(
                            color: AppColors.blue.withOpacity(0.7),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          ButtonW(
            onTap: () {
              authC.login(authC.emailC.text, authC.passwordC.text);
            },
            text: "Login",
          ),
        ],
      ),
    );
  }
}
