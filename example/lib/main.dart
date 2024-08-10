import 'package:flutter/material.dart';
import 'package:responsiveplus/responsive.dart';

void main() {
  /// Ensure that the WidgetsBinding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize the ResponsiveUtil
  ResponsiveUtil.init(
    enableOrientationChange: false,
  );

  /// Run the app
  runApp(const ExampleApp());
}

/// Example App
/// This is an example app that shows how to use the Responsive package
class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, constraints, orientation, screenType) {
        return MaterialApp(
          home: Scaffold(
            ///Note that this containts is not wrapped in a ResponsiveBuilder or ResponsiveChild widget
            ///so it will not be responsive to screen size changes.
            body: Container(
              width: 75.w, // 75% of the screen width
              height: 50.h, // 50% of the screen height
              color: Colors.green,
              child: Center(
                child: Rext(
                  'This is a Rext widget inside a Container',
                  maxLines: 1,
                  fontSize: 2.cw(constraints),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
