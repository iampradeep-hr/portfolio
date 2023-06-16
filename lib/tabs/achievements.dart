import 'package:flutter/material.dart';

import '../src/achievements/card.dart';
import '../src/nav_bar/title_bar.dart';

class Achievements extends StatelessWidget {
  Achievements({Key? key}) : super(key: key);

  final List<List<String>> data = [
    [
      '1st place winner at\n"The Engineer Hackathon-2022"\nheld at NITK Surathkal. Showcased exceptional skills, creativity,\nand problem-solving abilities, solidifying our position as leaders in engineering innovation.',
      'https://drive.google.com/file/d/18k1YIjtQ6QfdyHVBLfMCc-NWXJQJ5X7i/view?usp=sharing'
    ],
    [
      'Won the CompeteNCompose Hackathon! Collaborated with talented developers from 50+ GDSCs in India, leveraging Kotlin and Compose framework to create innovative Android applications. Grateful for the opportunity and excited for future endeavors! #HackathonChampion #KotlinCompose',
      'https://drive.google.com/file/d/1wO-QXXlKW-rGLVBR9pc6y6Dl8wf-X0CM/view?usp=drive_link'
    ]
  ];

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Column(children: [
      TitleBar(height: height, width: width, title: 'ACHIEVEMENTS'),
      Padding(
        padding: EdgeInsets.only(bottom: height * 0.1),
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 1000) {
            return Column(
              children: List.generate(data.length, (int i) {
                return Container(
                  padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, height * 0.05),
                  child: AchievementsCard(
                    desc: data[i][0],
                    link: data[i][1],
                    isMobile: true,
                  ),
                );
              }),
            );
          } else {
            int storage = -1;
            return Column(
              children: List.generate(
                data.length % 3 == 0 ? data.length ~/ 3 : data.length ~/ 3 + 1,
                (int i) => Padding(
                  padding: EdgeInsets.only(bottom: width * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                        (data.length - storage - 1) >= 3
                            ? 3
                            : data.length - storage - 1, (int index) {
                      storage = index + i * 3;
                      return AchievementsCard(
                        desc: data[index + i * 3][0],
                        link: data[index + i * 3][1],
                        isMobile: false,
                      );
                    }),
                  ),
                ),
              ),
            );
          }
        }),
      )
    ]);
  }
}
