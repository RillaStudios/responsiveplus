import 'package:flutter/material.dart';
import 'package:responsive/responsive.dart';

class ResponsiveExample extends StatelessWidget {
  const ResponsiveExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        builder: (context, orientation, screenType) {
          return Center(
            child: Container(
              color: Colors.blue,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Device Type: ${ResponsiveUtil.deviceType}'),
                  Text('Screen Type: ${ResponsiveUtil.screenType}'),
                  Text('Width: ${ResponsiveUtil.width}'),
                  Text('Height: ${ResponsiveUtil.height}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
