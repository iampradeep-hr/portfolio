import 'package:flutter/material.dart';

class MyName extends StatelessWidget {
  MyName({
    Key? key,
    required this.isMobile,
    required this.context,
  }) : super(key: key);

  final bool isMobile;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: isMobile
            ? SizedBox(
                width: width - width * 0.4,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Text(
                    "Pradeep HR",
                    textScaleFactor: 4.5,
                    style: TextStyle(
                      fontFamily: 'FjallaOne',
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              )
            : Text("Pradeep HR",
                textScaleFactor: 7,
                style: TextStyle(
                  fontFamily: 'FjallaOne',
                  letterSpacing: 18,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w500,
                )));
  }
}
