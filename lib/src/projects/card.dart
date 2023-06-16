import 'package:flutter/material.dart';
import '../custom/custom_text.dart';
import '../html_open_link.dart';
import '../theme/config.dart';

class ProjectsCard extends StatefulWidget {
  const ProjectsCard({
    Key? key,
    required this.title,
    required this.techStack,
    required this.desc,
    required this.link,
    required this.isMobile,
  }) : super(key: key);

  final String title, techStack, desc, link;
  final bool isMobile;

  @override
  _ProjectsCardState createState() => _ProjectsCardState();
}

class _ProjectsCardState extends State<ProjectsCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 10.0,
            offset: Offset(8, 12),
          )
        ],
        border: Border.all(
          color: Colors.blueAccent,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: InkWell(
        onTap: () => htmlOpenLink(widget.link),
        onHover: (value) {
          setState(() {
            isHovered = value;
          });
        },
        child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(
            top: height * 0.02,
            left: width * 0.015,
            right: width * 0.015,
            bottom: height * 0.02,
          ),
          width: !widget.isMobile ? width * 0.28 : width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            gradient: isHovered
                ? LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.blueAccent, Colors.purpleAccent],
                  )
                : null,
          ),
          child: Column(
            children: [
              Column(
                children: <Widget>[
                  FittedBox(
                    fit: BoxFit.cover,
                    child: CustomText(
                      text: widget.title,
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 16.0),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: CustomText(
                        text: widget.techStack,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  CustomText(
                    text: widget.desc,
                    fontSize: 15,
                    color: Colors.white,
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
