import 'package:flutter/material.dart';
import 'package:responsive/responsive.dart';
import 'package:responsive_example/responsive_example.dart';

void main() {
  ResponsiveUtil.init(
    enableOrientationChange: true,
    devicePlatforms: [
      DeviceType.android,
      DeviceType.ios,
      DeviceType.windows,
      DeviceType.linux,
      DeviceType.macos,
      DeviceType.fuchsia,
      DeviceType.web,
    ],
  );

  runApp(const ResponsiveApp());
}

class ResponsiveApp extends StatelessWidget {
  const ResponsiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ResponsiveExample(),
    );
  }
}
