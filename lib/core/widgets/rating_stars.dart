import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final double rating;
  final double size;
  const RatingStars({super.key, required this.rating, this.size = 18});

  @override
  Widget build(BuildContext context) {
    List<Widget> starsList = [];

    int realNumber = rating.floor();
    int partNumber = ((rating - realNumber) * 10).ceil();

    for (int i = 0; i < 5; i++) {
      if (i < realNumber) {
        starsList.add(
          Icon(
            Icons.star,
            color: Colors.yellow,
            size: size,
          ),
        );
      } else if (i == realNumber) {
        starsList.add(
          SizedBox(
            height: size,
            width: size,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: size,
                ),
                ClipRect(
                  clipper: _Clipper(part: partNumber),
                  child: Icon(
                    Icons.star,
                    color: Colors.grey,
                    size: size,
                  ),
                ),
              ],
            ),
          ),
        );
      } else {
        starsList.add(
          Icon(
            Icons.star,
            color: Colors.grey,
            size: size,
          ),
        );
      }
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: starsList,
    );
  }
}

class _Clipper extends CustomClipper<Rect> {
  final int part;
  _Clipper({required this.part});

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(
      (size.width / 10) * part,
      0.0,
      size.width,
      size.height,
    );
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) => true;
}
