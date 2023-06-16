import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({
    Key? key,
    required this.fontSize,
  }) : super(key: key);

  final double fontSize;
  final String gotAbout =
      '💻 I am a professional Android and Flutter Application Developer📱with expertise in Kotlin, Java, and Flutter framework. With a strong background in mobile app development and a drive for creating exceptional user experiences,🚀 I specialize in developing robust and innovative applications for various platforms.';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12.0, 5.0, 12.0, 30.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              gotAbout,
              softWrap: true,
              style: TextStyle(
                  fontFamily: 'SourceCodePro',
                  color: Theme.of(context).primaryColorLight,
                  fontSize: fontSize),
            ),
          ),
        ],
      ),
    );
  }
}
