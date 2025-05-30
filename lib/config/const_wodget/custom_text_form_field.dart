import 'package:fiber/config/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart' as intl;

import '../validator/validator.dart';
import '../validator/validator_rule.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField(
      {super.key,
      this.controller,
      this.label,
      this.hint,
      this.keyboardType,
      required this.validators,
      this.prefixIcon,
      this.suffixIcon,
      this.suffixText,
      this.obscureText = false,
      this.showLabelStar = false,
      this.topSpace = 2,
      this.bottomSpace = 0,
      this.maxLines = 1,
      this.focusNode,
      this.isLabelVisible = true,
      this.onChanged,
      this.inputFormatters,
      this.textDirection,
      this.isRtl,
      this.textAlign,
      this.readOnly,
      this.onEditComplete,
      this.hasBorder = false});

  final TextEditingController? controller;
  final bool? readOnly;
  final TextAlign? textAlign;
  final String? label, hint, suffixText;
  final TextInputType? keyboardType;
  final List<ValidatorRule>? validators;
  final Widget? suffixIcon, prefixIcon;
  final bool obscureText, isLabelVisible;
  final double topSpace, bottomSpace;
  // ignore: prefer_typing_uninitialized_variables
  final showLabelStar;
  final int maxLines;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final Function()? onEditComplete;
  final List<TextInputFormatter>? inputFormatters;
  final TextDirection? textDirection;
  final bool? isRtl;
  final bool? hasBorder;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isRTL(String text) {
    return intl.Bidi.detectRtlDirectionality(text);
  }

  String? text = '';

  @override
  Widget build(BuildContext context) {
    String localCode = Get.locale!.languageCode;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.isLabelVisible)
          widget.showLabelStar
              ? RichText(
                  text: TextSpan(
                      text: widget.label!.tr,
                      style: Theme.of(context).textTheme.titleMedium,
                      children: const [
                      TextSpan(text: " *", style: TextStyle(color: Colors.red))
                    ]))
              : Text(
                  widget.label!.tr,
                  // getTranslated(context, label!),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
        if (widget.isLabelVisible)
          SizedBox(
            height: Insets.small,
          ),
        TextFormField(
          autocorrect: false,
          textInputAction: TextInputAction.done,
          onEditingComplete: widget.onEditComplete,
          readOnly: widget.readOnly ?? false,
          textAlign: widget.textAlign ?? TextAlign.start,
          onChanged: widget.onChanged ??
              (value) {
                setState(() {
                  text = value;
                });
              },
          textAlignVertical: TextAlignVertical.center,
          controller: widget.controller,
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          textDirection: isRTL(text ?? "") || widget.isRtl == true
              ? TextDirection.rtl
              : TextDirection.ltr,
          validator: (value) => widget.validators != null
              ? Validator.validate(value, widget.validators!)
              : null,
          maxLines: widget.maxLines,
          focusNode: widget.focusNode,
          inputFormatters: widget.inputFormatters,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            errorMaxLines: 2,
            hintText: widget.hint!.tr,
            hintStyle: context.theme.textTheme.titleMedium!
                .copyWith(color: context.theme.colorScheme.outline),
            suffixText: widget.suffixText,
            suffixStyle: const TextStyle(
              fontSize: 12,
              color: Colors.red,
            ),
            filled: true,
            fillColor: Get.isDarkMode
                ? context.theme.colorScheme.secondary.withOpacity(0.1)
                : Colors.white,
            focusColor: context.theme.colorScheme.error,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                width: 1,
                color: Colors.black,
                style: widget.hasBorder == true
                    ? BorderStyle.solid
                    : BorderStyle.none,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                width: 1,
                color: const Color(0xFFEBEBEB),
                style: widget.hasBorder == true
                    ? BorderStyle.solid
                    : BorderStyle.none,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                width: 0,
                color: Colors.black,
                style: widget.hasBorder == true
                    ? BorderStyle.solid
                    : BorderStyle.none,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                width: 0,
                color: Colors.red.shade200,
                style: widget.hasBorder == true
                    ? BorderStyle.solid
                    : BorderStyle.none,
              ),
            ),
            suffixIcon: widget.suffixIcon,
            prefixIcon: widget.prefixIcon != null
                ? Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: Insets.small, horizontal: Insets.exSmall),
                    child: Container(
                      margin: EdgeInsets.only(
                          right: Insets.small, left: Insets.small),
                      decoration: const BoxDecoration(),
                      child: Padding(
                        padding: localCode == "ar"
                            ? EdgeInsets.only(left: Insets.small)
                            : EdgeInsets.only(right: Insets.small),
                        child: widget.prefixIcon,
                      ),
                    ),
                  )
                : null,
          ),
        ),
        Gap(widget.bottomSpace),
      ],
    );
  }
}
