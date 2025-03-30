import 'package:fluent_ui/fluent_ui.dart';

class FolderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    const radius = 20.0;
    const tabWidth = 50.0;
    const tabHeight = 20.0;

    path.moveTo(radius, 0);
    path.lineTo(size.width - tabWidth - radius, 0);
    path.quadraticBezierTo(
      size.width - tabWidth,
      0,
      size.width - tabWidth,
      radius,
    );
    path.lineTo(size.width - tabWidth, tabHeight);
    path.quadraticBezierTo(
      size.width - tabWidth,
      tabHeight + radius,
      size.width - tabWidth + radius,
      tabHeight + radius,
    );
    path.lineTo(size.width - radius, tabHeight + radius);
    path.quadraticBezierTo(
      size.width,
      tabHeight + radius,
      size.width,
      tabHeight + radius + radius,
    );
    path.lineTo(size.width, size.height - radius);
    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width - radius,
      size.height,
    );
    path.lineTo(radius, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - radius);
    path.lineTo(0, radius);
    path.arcToPoint(
      const Offset(radius, 0),
      radius: const Radius.circular(radius * 2),
      clockwise: true,
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
