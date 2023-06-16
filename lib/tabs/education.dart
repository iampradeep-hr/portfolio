import 'package:flutter/material.dart';

import '../src/education/card.dart';
import '../src/nav_bar/title_bar.dart';

class Education extends StatelessWidget {
  Education({Key? key}) : super(key: key);

  final List<List<String>> data = [
    [
      'MS Ramaiah University\nof Applied Sciences',
      'Bangalore',
      '2020 - 2024',
      'B.Tech in CSE',
      '9.12 CGPA',
      'ruas.jpg'
    ],
    [
      'Yashaswi PU\nCollege, India',
      'Gauribidanur',
      '2018 - 2020',
      'Physics, Chemistry, Mathematics, Biology',
      '86.2%',
      'yashaswi.jpg'
    ],
    [
      'Adarsha Vidyalaya\nRMSA, India',
      'Gauribidanur',
      '2018',
      'Secondary Education',
      '91.2%',
      'adarsha.jpg'
    ],
  ];

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Column(children: [
      TitleBar(height: height, width: width, title: 'EDUCATION'),
      Padding(
        padding: EdgeInsets.only(bottom: height * 0.1),
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 1000) {
            return Column(
              children: List.generate(
                data.length,
                (int i) => Padding(
                  padding: EdgeInsets.only(
                      left: 30.0, right: 30.0, bottom: height * 0.05),
                  child: EducationDesktop(
                    instiution: data[i][0],
                    location: data[i][1],
                    desc: data[i][3],
                    grades: data[i][4],
                    years: data[i][2],
                    image: data[i][5],
                  ),
                ),
              ),
            );
          } else {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: width * 0.8,
                  child: Column(
                    children: List.generate(
                      data.length,
                      (int i) => Padding(
                        padding: EdgeInsets.only(bottom: height * 0.025),
                        child: EducationDesktop(
                          instiution: data[i][0],
                          location: data[i][1],
                          desc: data[i][3],
                          grades: data[i][4],
                          years: data[i][2],
                          image: data[i][5],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        }),
      )
    ]);
  }
}
