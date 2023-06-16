import 'package:flutter/material.dart';
import 'package:flutter_next/constants/enums.dart';
import 'package:flutter_next/extensions/animation_extension.dart';
import '../src/custom/custom_text.dart';
import '../src/nav_bar/title_bar.dart';
import '../src/neon.dart';
import '../src/whatIDo/progress.dart';

class WhatIdo extends StatelessWidget {
  WhatIdo({Key? key}) : super(key: key);

  final List<List<String>> data = [
    [
      'Android--80',
      'Flutter--50',
      'Spring Boot--75',
      'Java/Kotlin--75',
      'Databases--80',
      'GNU/Linux--30',
      'Git--80'
    ],
    [
      'android.png',
      'flutter.png',
      'springboot.png',
      'kotlin.png',
      'java.png',
      'firebase.png',
      'git.png',
      'linux.png',
      'android_studio.png',
      'intellij.png',
      'mysql.png',
      'mongodb.png'
    ]
  ];
  static final whatIDoKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        TitleBar(height: height, width: width, title: 'WHAT I DO'),
        Padding(
          padding: EdgeInsets.only(bottom: height * 0.1),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth < 1000) {
                int storage = -1;
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 20),
                      child: CustomText(
                        text: '⚡ I have a good proficiency in:',
                        fontSize: 15,
                        color: Theme.of(context).primaryColorLight,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(children: [
                            NeonPoint(
                              lightBlurRadius: 150,
                              lightSpreadRadius: 150,
                              pointColor: Colors.blue,
                              spreadColor: Colors.blueAccent.shade200,
                            ),
                            Image.asset(
                              'assets/what_i_do/constants/ar_vr.png',
                              width: 300,
                              height: 400,
                            )
                          ]).fadeIn(
                            duration: const Duration(milliseconds: 800),
                          ),
                          Column(
                            children: List.generate(
                              data[0].length,
                              (int index) => Progress(
                                width: width / 1.55,
                                widthSecondContainer:
                                    double.parse(data[0][index].split('--')[1]),
                                title: data[0][index].split('--')[0],
                                sizeProficiencyName: 12,
                                sizePercentage: 10,
                              ).fadeIn(
                                variant: NextFadeInVariant.fadeInRight,
                                duration: const Duration(milliseconds: 800),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 15, 20),
                      child: CustomText(
                        text: '⚡ Some languages & tools I use:',
                        fontSize: 15,
                        color: Theme.of(context).primaryColorLight,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
                      child: Column(
                        children: List.generate(
                          data[1].length % 4 == 0
                              ? data[1].length ~/ 4
                              : data[1].length ~/ 4 + 1,
                          (int i) => Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: List.generate(
                                (data[1].length - storage - 1) >= 4
                                    ? 4
                                    : data[1].length - storage - 1,
                                (int index) {
                                  storage = index + i * 4;
                                  return Image.asset(
                                    'assets/what_i_do/${data[1][index + i * 4]}',
                                    width: 32,
                                    height: 32,
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ).fadeIn(
                        variant: NextFadeInVariant.fadeInTop,
                        duration: const Duration(milliseconds: 800),
                      ),
                    ),
                  ],
                );
              } else {
                int storage = -1;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(70, 10, 70, 20),
                      child: CustomText(
                        text: '⚡ I have a good proficiency in:',
                        fontSize: 35,
                        color: Theme.of(context).primaryColorLight,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: List.generate(
                              data[0].length,
                              (int index) => Progress(
                                width: width / 2,
                                widthSecondContainer:
                                    double.parse(data[0][index].split('--')[1]),
                                title: data[0][index].split('--')[0],
                                sizeProficiencyName: 22,
                                sizePercentage: 15,
                              ),
                            ),
                          ).fadeIn(
                            variant: NextFadeInVariant.fadeInRight,
                            duration: const Duration(milliseconds: 800),
                          ),
                          Stack(children: [
                            NeonPoint(
                              lightBlurRadius: 150,
                              lightSpreadRadius: 100,
                              pointColor: Colors.blue,
                              spreadColor: Colors.blueAccent.shade200,
                            ),
                            Image.asset(
                              'assets/what_i_do/constants/ar_vr.png',
                              width: 300,
                              height: 400,
                            )
                          ]).fadeIn(
                            duration: const Duration(milliseconds: 800),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(70, 30, 70, 20),
                      child: CustomText(
                        text: '⚡ Some languages & tools I use:',
                        fontSize: 35,
                        color: Theme.of(context).primaryColorLight,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0, bottom: 20.0),
                      child: Column(
                        children: List.generate(
                          data[1].length % 8 == 0
                              ? data[1].length ~/ 8
                              : data[1].length ~/ 8 + 1,
                          (int i) => Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List.generate(
                                (data[1].length - storage - 1) >= 8
                                    ? 8
                                    : data[1].length - storage - 1,
                                (int index) {
                                  storage = index + i * 8;
                                  return Image.asset(
                                    'assets/what_i_do/${data[1][index + i * 8]}',
                                    width: 70,
                                    height: 70,
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ).fadeIn(
                        variant: NextFadeInVariant.fadeInTop,
                        duration: const Duration(milliseconds: 800),
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
