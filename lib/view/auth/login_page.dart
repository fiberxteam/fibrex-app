import 'package:fiber/config/const_wodget/custom_fill_button.dart';
import 'package:fiber/config/const_wodget/custom_text_form_field.dart';
import 'package:fiber/config/constant.dart';
import 'package:fiber/config/validator/validators.dart';
import 'package:fiber/controller/auth/auth_controller.dart';
import 'package:fiber/controller/set_data_controller.dart';
import 'package:fiber/view/auth/components/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(),
            Gap(Insets.exLarge * 2),
            Text(
              'Sign In'.tr,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: context.theme.colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.bold),
            ),
            Gap(Insets.medium),
            GetX(
              init: authController,
              builder: (data) => Form(
                child: Column(
                  children: [
                    CustomTextFormField(
                      validators: [
                        IsRequiredRule(),
                      ],
                      hint: 'aliJassib@gmail.com'.tr,
                      controller: data.emailController,
                      prefixIcon: SvgPicture.asset(
                        Assets.assetsIconsPhone,
                      ),
                      isLabelVisible: false,
                      bottomSpace: Insets.small,
                    ),
                    CustomTextFormField(
                      validators: [
                        IsRequiredRule(),
                      ],
                      hint: '123@root'.tr,
                      controller: data.passwordController,
                      isLabelVisible: false,
                      obscureText: !data.isShow.value,
                      prefixIcon: InkMe(
                        onTap: () {
                          data.isShow.value = !data.isShow.value;
                        },
                        child: SvgPicture.asset(
                          !data.isShow.value
                              ? Assets.assetsIconsEyes
                              : Assets.assetsIconsCloseEye,
                          color: context.theme.colorScheme.outline,
                        ),
                      ),
                      bottomSpace: Insets.small,
                    ),
                    Gap(Insets.medium),
                    CustomFillButton(
                      title: 'Confirm'.tr,
                      loading: data.isLoading.value
                          ? CircularProgressIndicator(
                              color: context.theme.colorScheme.surface,
                            )
                          : null,
                      onTap: () {
                        data.login(
                            email: data.emailController.text,
                            password: data.passwordController.text);
                      },
                      backgroundColor:
                          context.theme.colorScheme.onPrimaryContainer,
                    ),
                  ],
                ),
              ),
            ),
          ].animate(interval: 50.ms).fade(duration: 400.ms),
        ),
      ),
    );
  }

  AuthController authController = Get.find();
  SetDataController controller = Get.find();
}
