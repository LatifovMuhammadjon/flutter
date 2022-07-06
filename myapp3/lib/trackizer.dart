import 'package:flutter/material.dart';

TextStyle kTextStyle(
    {Color? color,
    double size = 14,
    FontWeight fontWeight = FontWeight.w500,
    double? letterSpacing,
    double? height}) {
  return TextStyle(
      color: color ?? Colors.white,
      fontSize: size,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      height: height);
}

class LineDash extends StatelessWidget {
  final double height;
  final Color color;

  LineDash({this.height = 1, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 8.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.addOval(
        Rect.fromCircle(center: Offset(0.0, size.height / 2.2), radius: 13.5));
    path.addOval(Rect.fromCircle(
        center: Offset(size.width, size.height / 2.2), radius: 13.5));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class UnicornOutlineButton extends StatelessWidget {
  final _GradientPainter _painter;
  final Widget _child;
  final VoidCallback _callback;
  final double _radius;
  final double strokeWidth;
  final Color? bgColor;

  UnicornOutlineButton({
    Key? key,
    required this.strokeWidth,
    required double radius,
    required Gradient gradient,
    required Widget child,
    required VoidCallback onPressed,
    this.bgColor,
  })  : _painter = _GradientPainter(
            strokeWidth: strokeWidth, radius: radius, gradient: gradient),
        _child = child,
        _callback = onPressed,
        _radius = radius,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _painter,
      child: InkWell(
        borderRadius: BorderRadius.circular(_radius),
        onTap: _callback,
        child: Container(
          constraints: const BoxConstraints(minWidth: 88, minHeight: 48),
          margin: EdgeInsets.all(strokeWidth),
          decoration: BoxDecoration(
              color: bgColor, borderRadius: BorderRadius.circular(_radius)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _child,
            ],
          ),
        ),
      ),
    );
  }
}

class _GradientPainter extends CustomPainter {
  final Paint _paint = Paint();
  final double radius;
  final double strokeWidth;
  final Gradient gradient;

  _GradientPainter({
    required this.strokeWidth,
    required this.radius,
    required this.gradient,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // create outer rectangle equals size
    Rect outerRect = Offset.zero & size;
    var outerRRect =
        RRect.fromRectAndRadius(outerRect, Radius.circular(radius));

    // create inner rectangle smaller by strokeWidth
    Rect innerRect = Rect.fromLTWH(strokeWidth, strokeWidth,
        size.width - strokeWidth * 2, size.height - strokeWidth * 2);
    var innerRRect = RRect.fromRectAndRadius(
        innerRect, Radius.circular(radius - strokeWidth));

    // apply gradient shader
    _paint.shader = gradient.createShader(outerRect);

    // create difference between outer and inner paths and draw it
    Path path1 = Path()..addRRect(outerRRect);
    Path path2 = Path()..addRRect(innerRRect);
    var path = Path.combine(PathOperation.difference, path1, path2);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}

class SubscriptInfoPage extends StatelessWidget {
  const SubscriptInfoPage({Key? key}) : super(key: key);

  final Color textColor1 = const Color(0xffA2A2B5);
  final LinearGradient _gradient = const LinearGradient(
      colors: [Colors.white24, Colors.transparent],
      transform: GradientRotation(45));

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var vh = size.height;
    var vw = size.width;
    return Scaffold(
      backgroundColor: const Color(0xff0E0E12),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
          child: ClipPath(
            clipper: TicketClipper(),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color(0xff353542),
                  borderRadius: BorderRadius.circular(24)),
              child: LayoutBuilder(
                builder: ((context, constraints) => Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      splashRadius: 20,
                                      icon: Image.asset(
                                        'assets/ic_arrow_down.png',
                                        height: 24,
                                        width: 24,
                                      )),
                                  Text(
                                    'Subscription info',
                                    style:
                                        kTextStyle(color: textColor1, size: 16),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Image.asset(
                                        'assets/ic_trash.png',
                                        height: 24,
                                        width: 24,
                                      )),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 25),
                                child: Image.asset(
                                  'assets/spotify_logo.png',
                                  height: 106,
                                  width: 106,
                                ),
                              ),
                              Text(
                                'Spotify',
                                style: kTextStyle(
                                    color: Colors.white,
                                    size: 32,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                '\$5.99',
                                style: kTextStyle(
                                    size: 20,
                                    color: textColor1,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: constraints.maxHeight / 2.2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              LineDash(
                                color: const Color(0xff0E0E12),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                  left: 20,
                                  top: 36,
                                  right: 20,
                                ),
                                padding: EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                  gradient: _gradient,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(13),
                                    color: Color(0xff30303c),
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      customButton("Name", "Spotify"),
                                      customButton("Description", "Music app"),
                                      customButton("Category", "Entertainment"),
                                      customButton(
                                          "First Payment", "08.01.2022"),
                                      customButton("Reminder", "Never"),
                                      customButton("Currency", "USD (\$)"),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                margin: const EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                  top: 24,
                                ),
                                child: UnicornOutlineButton(
                                  gradient: _gradient,
                                  strokeWidth: 1,
                                  radius: 999,
                                  onPressed: () {},
                                  bgColor: const Color(0xff30303d),
                                  child: Text(
                                    "Save",
                                    style: kTextStyle(
                                        size: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget customButton(String key, String value) {
  return InkWell(
    onTap: () {},
    child: ListTile(
      leading: Text(
        key,
        style: kTextStyle(
          color: Colors.white,
          size: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      title: Text(
        value,
        textAlign: TextAlign.end,
        style: kTextStyle(
          color: Color(0xffa2a2b5),
          size: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Image.asset(
        "assets/ic_arrow_right.png",
        height: 12,
        fit: BoxFit.contain,
      ),
    ),
  );
}
