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
    return MaterialApp(
      home: Scaffold(
        ///Note that this containts is not wrapped in a ResponsiveBuilder or ResponsiveChild widget
        ///so it will not be responsive to screen size changes.
        body: Container(
          width: 75.w, // 75% of the screen width
          height: 50.h, // 50% of the screen height
          color: Colors.green,
          child: ResponsiveChild(
            onScreenSizeChanged: (constraints) {
              /// This function will be called whenever the screen size changes (this is an optional parameter)
              print('Screen size changed to: ${constraints.maxWidth}x${constraints.maxHeight}');
            },
            child: (context, constraints, orientation, screenType) {
              /// Child will set its constraints based on the
              /// size of the parent container and can use it
              ///to calculate the size of its children, in this
              ///case it is a Rext widget.
              ///
              ///Explanation:
              ///
              ///Lets pretend the users screen size is 1000px
              ///
              ///The Container is 75% of the screen height (which would be 750px)
              ///The Rext widgets initial font size is 2% of that 750px, which would
              ///equal 15px.
              ///
              return Center(
                child: Rext(
                  'This is a Rext widget inside a Container',
                  maxLines: 1,
                  fontSize: 2.cw(constraints),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
