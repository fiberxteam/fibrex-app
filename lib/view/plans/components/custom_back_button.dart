import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fiber/config/constant.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: Color(0xFFEBEBEB)),
          color: Colors.white,
        ),
        child: Icon(
          CupertinoIcons.back,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
