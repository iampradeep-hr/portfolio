import 'package:flutter/material.dart';

import '../src/nav_bar/title_bar.dart';
import '../src/projects/card.dart';

class Projects extends StatelessWidget {
  Projects({Key? key}) : super(key: key);

  final List<List<String>> data = [
    [
      'Facts & LifeHacks',
      'Kotlin,MVVM Architecture,\nLiveData,ViewModel,\nRetrofit,Room Database,\nKotlin Coroutines',
      'Daily Facts is a captivating Android app that provides users with a daily dose of interesting and informative facts. Built with Kotlin, Retrofit, and following the MVVM architecture, the app ensures a smooth and responsive user interface. On the backend, the app relies on Spring Boot, which is deployed on Azure, to handle the data and deliver a seamless experience. Expand your knowledge with Daily Facts!',
      'https://play.google.com/store/apps/details?id=com.pradeep.dailyfacts&hl=en-IN'
    ],
    [
      'FeedPool',
      'Kotlin,MVVM Architecture,\nLiveData,ViewModel,\nRetrofit,Room Database,\nKotlin Coroutines',
      'In my Android project, I have utilized the News API to fetch and display the latest news. Built with Kotlin and following the MVVM architecture, the app incorporates LiveData and ViewModel for seamless data updates, Retrofit for networking operations, Room Database for local data storage, and Kotlin Coroutines for managing asynchronous tasks. Stay informed with ease using this sleek News app!',
      'https://github.com/iampradeep-hr/feedpool'
    ],
    [
      'Readow',
      'MVC Architecture',
      'Readow is a fast and clean RSS Reader application that lets you enjoy your favorite news without any distractions. With no ads, login requirements, or data collection, it offers a seamless reading experience. Swipe options allow easy deletion and full article access. Choose between light or dark themes, reduce eye strain, and save articles for later. Share news effortlessly with a simple tap. Enjoy reading in full-screen mode.',
      'https://github.com/iampradeep-hr/Readow'
    ],
  ];

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Column(children: [
      TitleBar(height: height, width: width, title: 'PROJECTS'),
      Padding(
        padding: EdgeInsets.only(bottom: height * 0.1),
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 1000) {
            return Column(
              children: List.generate(data.length, (int i) {
                return Container(
                  padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, height * 0.05),
                  child: ProjectsCard(
                    title: data[i][0],
                    techStack: data[i][1],
                    desc: data[i][2],
                    link: data[i][3],
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
                      return ProjectsCard(
                        title: data[index + i * 3][0],
                        techStack: data[index + i * 3][1],
                        desc: data[index + i * 3][2],
                        link: data[index + i * 3][3],
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
