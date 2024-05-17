import 'package:fiber/config/const_wodget/custom_text_form_field.dart';
import 'package:fiber/config/constant.dart';
import 'package:fiber/view/plans/components/custom_back_button.dart';
import 'package:flutter/material.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({super.key});

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 70,
        leadingWidth: 65,
        leading: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(Insets.margin),
            const CustomBackButton(),
          ],
        ),
        title: Text(
          "مراسلة الدعم".tr,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Insets.small),
          child: Column(
            children: [
              Form(
                child: Column(
                  children: [
                    CustomTextFormField(
                      validators: const [],
                      isLabelVisible: true,
                      label: 'عنوان المشكلة'.tr,
                      hint: 'ضعف عام بلانترنيت',
                      bottomSpace: Insets.medium,
                    ),
                    CustomTextFormField(
                      validators: const [],
                      isLabelVisible: true,
                      label: 'وصف المشكلة'.tr,
                      hint: 'ضعف عام بلانترنيت',
                      maxLines: 10,
                      bottomSpace: Insets.medium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: Insets.small),
        child: FloatingActionButton.extended(
          onPressed: () {},
          label: Text(
            'إرسال'.tr,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.white),
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
