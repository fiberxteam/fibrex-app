import 'package:erp/config/const_wodget/custom_fill_button.dart';
import 'package:erp/config/const_wodget/custom_text_form_field.dart';
import 'package:erp/config/constant.dart';
import 'package:erp/config/validator/validators.dart';
import 'package:erp/controller/auth/auth_controller.dart';
import 'package:erp/controller/set_data_controller.dart';
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
            SizedBox(
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                    child: Image.asset(Assets.assetsImagesBackgroundLogin),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(Insets.exLarge * 1.5),
                      Image.asset(
                        Assets.assetsImagesLogo2,
                        width: Insets.exLarge * 4,
                      ),
                      Gap(Insets.small),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Insets.medium),
                        child: Text(
                          'الشريك الرسمي لوزارة الاتصالات العراقية والمزود الأكبر للإنترنت الضوئي في واسط ',
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: context.theme.colorScheme.surface,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
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
