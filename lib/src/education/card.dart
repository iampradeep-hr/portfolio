import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../custom/custom_text.dart';
import '../theme/config.dart';

class EducationDesktop extends StatefulWidget {
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
  _EducationDesktopState createState() => _EducationDesktopState();
}

class _EducationDesktopState extends State<EducationDesktop>
    with SingleTickerProviderStateMixin {
  bool isHover = false;
  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _colorAnimation = TweenSequence<Color?>(
      [
        TweenSequenceItem(
          weight: 1.0,
          tween: ColorTween(
            begin: Colors.deepPurple,
            end: Colors.purple,
          ),
        ),
        TweenSequenceItem(
          weight: 1.0,
          tween: ColorTween(
            begin: Colors.purple,
            end: Colors.deepPurple,
          ),
        ),
      ],
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return CustomPaint(
      painter: MetaversePainter(
        isHover: isHover,
        colorAnimation: _colorAnimation,
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.only(
          top: isHover ? height * 0.005 : height * 0.01,
          bottom: !isHover ? height * 0.005 : height * 0.01,
        ),
        child: InkWell(
          onHover: (bool value) {
            setState(() {
              isHover = value;
            });
          },
          onTap: () {},
          child: Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(
              top: height * 0.04,
              left: width * 0.015,
              right: width * 0.015,
              bottom: height * 0.04,
            ),
            width: width / 1.15,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: isHover ? Colors.black12 : Colors.black45,
                  blurRadius: 10.0,
                  offset: const Offset(8, 12),
                ),
              ],
              color: currentTheme.currentTheme == ThemeMode.dark
                  ? Theme.of(context).cardColor
                  : Theme.of(context).primaryColor,
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
                        image:
                            AssetImage('assets/education/${widget.image}'),
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
                            image:
                                AssetImage('assets/education/${widget.image}'),
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
                              text: widget.instiution,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: CustomText(
                                text: widget.location,
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
                                text: widget.years != ''
                                    ? 'Years of study: ${widget.years}'
                                    : '',
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          FittedBox(
                            fit: BoxFit.cover,
                            child: CustomText(
                              text: widget.desc,
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                          FittedBox(
                            fit: BoxFit.cover,
                            child: CustomText(
                              text: widget.grades != ''
                                  ? 'Grades Achieved: ${widget.grades}'
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
      ),
    );
  }
}

class MetaversePainter extends CustomPainter {
  final bool isHover;
  final Animation<Color?> colorAnimation;

  MetaversePainter({required this.isHover, required this.colorAnimation})
      : super(repaint: colorAnimation);

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & size;

    final Paint bgPaint = Paint()..color = Colors.black;

    final Path bgPath = createBackgroundPath(rect);

    canvas.drawPath(bgPath, bgPaint);

    if (isHover) {
      final List<Offset> halogenPositions = calculateHalogenPositions(rect);

      for (final Offset position in halogenPositions) {
        final double radius = size.shortestSide * 0.03;

        final Paint lightPaint = Paint()
          ..color = colorAnimation.value!
          ..style = PaintingStyle.fill;

        canvas.drawCircle(position, radius, lightPaint);
      }
    }
  }

  Path createBackgroundPath(Rect rect) {
    final double controlPointDistance = rect.height * 0.15;

    final Path path = Path()
      ..moveTo(rect.left, rect.top + controlPointDistance)
      ..cubicTo(rect.left, rect.top, rect.left, rect.top,
          rect.left + controlPointDistance, rect.top)
      ..lineTo(rect.right - controlPointDistance, rect.top)
      ..cubicTo(rect.right, rect.top, rect.right, rect.top,
          rect.right, rect.top + controlPointDistance)
      ..lineTo(rect.right, rect.bottom - controlPointDistance)
      ..cubicTo(rect.right, rect.bottom, rect.right, rect.bottom,
          rect.right - controlPointDistance, rect.bottom)
      ..lineTo(rect.left + controlPointDistance, rect.bottom)
      ..cubicTo(rect.left, rect.bottom, rect.left, rect.bottom,
          rect.left, rect.bottom - controlPointDistance)
      ..close();

    return path;
  }

  List<Offset> calculateHalogenPositions(Rect rect) {
    const int numHalogenLights = 6;
    final List<Offset> positions = [];

    final double centerX = rect.width / 2;
    final double centerY = rect.height / 2;

    final double angleIncrement = (2 * math.pi) / numHalogenLights;

    for (int i = 0; i < numHalogenLights; i++) {
      final double angle = i * angleIncrement;
      final double radius = rect.shortestSide * 0.45;

      final double x = centerX + math.cos(angle) * radius;
      final double y = centerY + math.sin(angle) * radius;

      positions.add(Offset(x, y));
    }

    return positions;
  }

  @override
  bool shouldRepaint(MetaversePainter oldDelegate) =>
      isHover != oldDelegate.isHover;
}
