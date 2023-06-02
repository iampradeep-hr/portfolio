import 'package:flutter/material.dart';

import '../custom/custom_text.dart';
import '../html_open_link.dart';
import 'data.dart';

class Resume extends StatelessWidget {
  Resume({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: width * 0.019),
        child: FilledButton(
            onPressed: () => htmlOpenLink(
                "https://docs.google.com/document/d/1t9o8oOG6_pYX7FwFKyXfQ-k3LJuOpEdaCL7bXxl5anY/edit?usp=sharing/export?format=pdf"),
            child: CustomText(
                text: 'MY RESUME',
                fontSize: 20,
                color: Theme.of(context).secondaryHeaderColor)));
  }
}
