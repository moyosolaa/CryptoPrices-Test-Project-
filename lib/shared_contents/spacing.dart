import 'package:flutter/material.dart';

class Spacing extends StatelessWidget {
  final double height;
  final double width;

  const Spacing.height(this.height, {Key? key})
      : width = 0,
        super(key: key);

  const Spacing.width(this.width, {Key? key})
      : height = 0,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height, width: width);
  }
}
