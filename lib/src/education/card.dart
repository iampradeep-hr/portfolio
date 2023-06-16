import 'package:flutter/material.dart';

import '../custom/custom_text.dart';

class EducationDesktop extends StatelessWidget {
  const EducationDesktop({
    Key? key,
    required this.instiution,
    required this.location,
    required this.desc,
    required this.grades,
    required this.years,
    required this.image,
  }) : super(key: key);

  final String instiution, location, years, grades, desc, image;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: height * 0.01,
      ),
      child: InkWell(
        onTap: () {},
        child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.symmetric(
            vertical: height * 0.04,
            horizontal: width * 0.015,
          ),
          width: width / 1.15,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.deepPurple, // Border color
              width: 2.0, // Border width
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Column(
            children: [
              Visibility(
                visible: width < 1000,
                child: Container(
                  width: 50,
                  height: 50,
                  margin: const EdgeInsets.only(bottom: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    image: DecorationImage(
                      image: AssetImage('assets/education/$image'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Visibility(
                    visible: width >= 1000,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        image: DecorationImage(
                          image: AssetImage('assets/education/$image'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: <Widget>[
                        FittedBox(
                          fit: BoxFit.cover,
                          child: CustomText(
                            text: instiution,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: CustomText(
                              text: location,
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        FittedBox(
                          fit: BoxFit.cover,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 11.0),
                            child: CustomText(
                              text: years != '' ? 'Years of study: $years' : '',
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        FittedBox(
                          fit: BoxFit.cover,
                          child: CustomText(
                            text: desc,
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                        FittedBox(
                          fit: BoxFit.cover,
                          child: CustomText(
                            text: grades != ''
                                ? 'Grades Achieved: $grades'
                                : '',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
