<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

ResponsivePlus is a powerful and versatile package designed to simplify and enhance responsive design in Flutter applications. It offers a comprehensive set of tools, methods, and custom widgets that enable developers to create highly adaptable and customizable user interfaces. Whether you are building for mobile, tablet, or desktop, ResponsivePlus ensures your app looks great on any screen size or orientation.

## Features

This package provides many widgets and methods to add repsonsivness to your Flutter app.

List of features:

<b><u>Widgets:</u></b>

- RowColumn widget: Adds ability to display a Row or Column widget based off current screen size.
- WrapColumn widget: Adds ability to display a Wrap or Column widget based off current screen size.
- ResponsiveChild widget: A wrap around a singlular child which will make the child responsive and react to screen size changes.
- ResponsiveChilren widget: A wrap around multiple chilred which will make all the children responsive and react to screen size changes.
- Rext widget: A Text widget that will automatically adjust its size based on screen size.

<b><u>Methods (ResponsiveUtil class):</u></b>

- ResponsiveUtil.init(): Used to initialize the current screen type, device type, breakpoints, and more. Basically ensures all ResponsivePlus variables will be initialized. Should be called in main method.
- ResponsiveUtil.isMobile(): Returns weather the current screen size is mobile (bool).
- ResponsiveUtil.isTablet(): Returns weather the current screen size is tablet (bool).
- ResponsiveUtil.isDesktop(): Retruns weather the current screen size is desktop (bool).
- ResponsiveUtil.isIos(): Returns weather the current device is an IOS device (bool).
- ResponsiveUtil.isAndroid(): Returns weather the current device is an IOS device (bool).
- ResponsiveUtil.isMacOs(): Returns weather the current device is a macOS device (bool).
- ResponsiveUtil.isWindows(): Returns weather the current device is a Windows device (bool).
- ResponsiveUtil.isLinux(): Returns weather the current device is a Linux device (bool).
- ResponsiveUtil.isFuchsia(): Returns weather the current device is a Fuchsia device (bool).
- ResponsiveUtil.isWeb(): Returns weather the current device is a Web platform (bool).
- ResponsiveUtil.getDeviceType(): Returns the current device type (DeviceType - ios, android, macos, windows, linux, fuchsia, web)
- ResponsiveUtil.getScreenType(): Returns the current screen type (ScreenType - mobile, tablet, desktop)
- ResponsiveUtil.getOrientation(): Returns the current screen type (Orientation)
- ResponsiveUtil.getBoxConstraints(): Returns the current BoxConstraints of the whole screen (BoxConstraints)
- ResponsiveUtil.getWidth(): Returns the current screen width (double)
- ResponsiveUtil.getHeight(): Returns the current screen height (double)
- ResponsiveUtil.getDouble(): Will return a double based on current ScreenType (double)
- ResponsiveUtil.getInt(): Will return an int based on current ScreenType (int)

<u><b>Extensions (double):</b></u>

- w: Converts a number to a responsive width value (example: 10.w - 10% of screen width)
- h: Converts a number to a responsive height value (example: 10.h - 10% of screen height)
- sp: Converts a number to a scaleable pixel value (example: 3.sp)
- cw(constraints): Converts the number to a responsive width value based on the constraint width of the parent widget
- ch(constraints): Converts the number to a responsive heigth value based on the constraint height of the parent widget

## Getting started

## Usage

To use this package, add ResponsivePlus as a dependency in your pubspec.yaml file.

```dart
/// Example App
/// This is an example app that shows some of the features of the ResponsivePlus package.
class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: 75.w, // 75% of the screen width
          height: 50.h, // 50% of the screen height
          color: Colors.green,
          child: ResponsiveChild(
            onScreenSizeChanged: (constraints) {
              /// This function will be called whenever the screen size changes
              print('Screen size changed to: ${constraints.maxWidth}x${constraints.maxHeight}');
            },
            child: (context, constraints) {
              /// Child will get size of the parent container
              /// and can use it to calculate the size of its children,
              /// in this case it is a Rext widget.
              return Center(
                child: Rext(
                  'This is a Rext widget inside a Container',
                  maxLines: 1,
                  fontSize: 50.cw(constraints),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
