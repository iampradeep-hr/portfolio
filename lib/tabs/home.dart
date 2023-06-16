import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_next/constants/enums.dart';
import 'package:flutter_next/extensions/animation_extension.dart';
import '../src/home/about.dart';
import '../src/home/designation.dart';
import '../src/home/introduction.dart';
import '../src/home/my_name.dart';
import '../src/home/resume.dart';
import '../src/home/social_media_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.microtask(() {
        SystemChrome.setApplicationSwitcherDescription(
            ApplicationSwitcherDescription(
          label: 'Meet Pradeep',
          primaryColor: Colors.black.value,
        ));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Padding(
        padding: EdgeInsets.only(bottom: height * 0.1),
        child: SizedBox(
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth < 1000) {
              return Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.024),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: height * 0.03),
                        child: const Introduction(
                            word: "Hi, नमस्ते(Namaste), I'm",
                            textScaleFactor: 2.5),
                      ),
                      MyName(
                        isMobile: true,
                        context: context,
                      ),
                      // neon text

                      Designation(isMobile: true, context: context),
                      SocialMediaBar(
                        height: height,
                      ),
                      const About(fontSize: 20),
                      Padding(
                        padding: EdgeInsets.only(bottom: height * 0.029),
                        child: OverflowBar(
                          children: const [
                            Resume(
                              width: 0,
                            ),
                          ],
                        ),
                      ).zoom(
                          loop: true,
                          duration: const Duration(milliseconds: 800)),
                    ],
                  ).fadeIn(
                      variant: NextFadeInVariant.fadeInRight,
                      loop: true,
                      duration: const Duration(milliseconds: 800)));
            } else {
              return Padding(
                padding:
                    EdgeInsets.only(top: height * 0.03, bottom: height * 0.07),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.032),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Introduction(
                              word: "Hi, नमस्ते(Namaste), I'm",
                              textScaleFactor: 3.5),
                          FittedBox(
                              fit: BoxFit.cover,
                              child: MyName(
                                isMobile: false,
                                context: context,
                              )),
                          Designation(isMobile: false, context: context),
                          SocialMediaBar(
                            height: height,
                          ),
                          const About(fontSize: 25),
                          Padding(
                            padding: EdgeInsets.only(bottom: height * 0.026),
                            child: Row(
                              children: [
                                Resume(
                                  width: width,
                                ).zoom(
                                    loop: true,
                                    duration:
                                        const Duration(milliseconds: 800)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ).fadeIn(
                    variant: NextFadeInVariant.fadeInRight,
                    loop: true,
                    duration: const Duration(milliseconds: 800)),
              );
            }
          }),
        ));
  }
}
