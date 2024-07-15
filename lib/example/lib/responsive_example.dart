import 'package:flutter/material.dart';
import 'package:responsive/responsive.dart';

class ResponsiveExample extends StatelessWidget {
  const ResponsiveExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Device Type: ${ResponsiveUtil.deviceType}'),
        Text('Screen Type: ${ResponsiveUtil.screenType}'),
        Text('Width: ${ResponsiveUtil.width}'),
        Text('Height: ${ResponsiveUtil.height}'),
      ],
    );
  }
}
