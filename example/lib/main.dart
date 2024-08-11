import 'package:flutter/material.dart';
import 'package:responsiveplus/responsive.dart';

void main() {
  /// Ensure that the WidgetsBinding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize the ResponsiveUtil
  /// This is required to make the package work
  ///
  /// All parameters are optional
  ResponsiveUtil.init(
    enableOrientationChange: false,
    appConstraints:
        const BoxConstraints(maxWidth: 1600, minWidth: 550, minHeight: 500),
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
    return MaterialApp(
      home: ResponsiveBuilder(
        builder: (context, constraints, orientation, screenType) {
          return Scaffold(
            body: Center(
              child: Container(
                width: 75.w, // 75% of the screen width
                height: 50.h, // 50% of the screen height
                color: Colors.green,
                child: Center(
                  ///A Rext widget for auto sizing text
                  child: Rext(
                    'I am auto sizing myself to stay on 2 lines! The container is always 75% of the screen width and 50% of its height!',
                    maxLines: 2,
                    fontSize: 2.cw(
                        constraints), //2% of nearest provided constraints width
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
