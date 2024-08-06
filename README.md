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

<img src="https://github.com/RillaStudios/Public-Images/blob/f5821bf25f799e6ae3fb3fec0c9ddd94c8f33fdd/responsive_img.png" alt="Responsive Design Image" style="width: 50%;">

ResponsivePlus attempts to make life a little easier and your projects dependency list smaller. The ResponsivePlus package aims to provide you with a package that can handle all aspects of making your apps responsive from custom responsive widgets to auto resizing widgets and text!

## 📌 Features

This package provides many widgets and methods to add repsonsivness to your Flutter app.

List of features:

<h3>🫧 Widgets:</h3>

- RowColumn widget: Adds ability to display a Row or Column widget based off current screen size.
- WrapColumn widget: Adds ability to display a Wrap or Column widget based off current screen size.
- ResponsiveChild widget: A wrap around a singlular child which will make the child responsive and react to screen size changes.
- ResponsiveChilren widget: A wrap around multiple chilred which will make all the children responsive and react to screen size changes.

<h4>🗚 Rext Widget</h4>

- Rext widget: A Text widget that will automatically adjust its size based on screen size.
- Rext Group: A RextGroup can be added to any and multiple Rext widgets. When assigning a RextGroup to a Rext widget this will ensure all the Rexts in that group have the same font size.

<h5>Types of Rext Widgets</h5>

- Rext -
  This is the basic Rext widget and will return a basic Text widget as its child. This will require a String as its data.

- Rext.rich -
  This is will return a RichText widget and will require a TextSpan as its data. <b>Note:</b> This does not support a WidgetSpan, the TextSpans children must only contain other TextSpans. Consider using a Wrap widget if you'd like to include Widgets in the text.

- Rext.selectable -
  This will return a SelectableText widget and will require a String as its data. This Text can be selected by the user and copied/pasted or you can add custom methods.

- Rext.selectableRich -
  This will return a SelectableText.rich widget and will require a TextSpan as its data. <b>Note:</b> This does not support a WidgetSpan, the TextSpans children must only contain other TextSpans. Consider using a Wrap widget if you'd like to include Widgets in the text.

<h3>💡 Methods (ResponsiveUtil class):</h3>

The ResponsivePlus package comes with many easily callable methods, which can help you develop UI and logic components based on the users device, screen size, orientation, etc.

- ResponsiveUtil.init() - Used to initialize the current screen type, device type, breakpoints, and more. Basically ensures all ResponsivePlus variables will be initialized. Should be called in main method.
- ResponsiveUtil.isMobile() - Returns weather the current screen size is mobile (bool).
- ResponsiveUtil.isTablet() - Returns weather the current screen size is tablet (bool).
- ResponsiveUtil.isDesktop() - Retruns weather the current screen size is desktop (bool).
- ResponsiveUtil.isIos() - Returns weather the current device is an IOS device (bool).
- ResponsiveUtil.isAndroid() - Returns weather the current device is an IOS device (bool).
- ResponsiveUtil.isMacOs() - Returns weather the current device is a macOS device (bool).
- ResponsiveUtil.isWindows() - Returns weather the current device is a Windows device (bool).
- ResponsiveUtil.isLinux() - Returns weather the current device is a Linux device (bool).
- ResponsiveUtil.isFuchsia() - Returns weather the current device is a Fuchsia device (bool).
- ResponsiveUtil.isWeb() - Returns weather the current device is a Web platform (bool).
- ResponsiveUtil.getDeviceType() - Returns the current device type (DeviceType - ios, android, macos, windows, linux, fuchsia, web)
- ResponsiveUtil.getScreenType() - Returns the current screen type (ScreenType - mobile, tablet, desktop)
- ResponsiveUtil.getOrientation() - Returns the current screen type (Orientation)
- ResponsiveUtil.getBoxConstraints() - Returns the current BoxConstraints of the whole screen (BoxConstraints)
- ResponsiveUtil.getWidth() - Returns the current screen width (double)
- ResponsiveUtil.getHeight() - Returns the current screen height (double)
- ResponsiveUtil.getDouble() - Will return a double based on current ScreenType (double)
- ResponsiveUtil.getInt() - Will return an int based on current ScreenType (int)

<h3>🔗 Extensions:</h3>

The ResponsivePlus package comes with built in extensions to help easily set the size of UI components based off screen or constraint sizes.

- w - Converts a number to a responsive width value (example: 10.w - 10% of screen width)
- h - Converts a number to a responsive height value (example: 10.h - 10% of screen height)
- sp - Converts a number to a scaleable pixel value (example: 3.sp)
- cw(constraints) - Converts the number to a responsive width value based on the constraint width of the parent widget
- ch(constraints) - Converts the number to a responsive heigth value based on the constraint height of the parent widget

## 📋 Getting started

## 🧪 Usage

To use this package, add ResponsivePlus as a dependency in your pubspec.yaml file.

```dart
import 'package:responsive/responsive.dart';

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
              /// This function will be called whenever the screen size changes (this is an optional parameter)
              print('Screen size changed to: ${constraints.maxWidth}x${constraints.maxHeight}');
            },
            child: (context, constraints) {
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

```

## ℹ️ Additional information

<h3>🪄 Feature request?</h3>

Have an idea to make this package even better? Tell us on the <a>ResponsivePlus discussion page (GitHub)</a>

<h3>🪲 Found a bug?</h3>

Please report all bugs or issues on the <a href="https://github.com/RillaStudios/responsiveplus/issues">ResponsivePlus issues page (GitHub)</a>

We encourage you to report anything package related to the GitHub repository pages as any and all input will help make this package even better in future versions!

## 🚀 Support

Enjoying this package? Consider supporting my work. Your contributions will allow me to keep creating and sharing valuable content and innovative projects.

<a href="https://www.buymeacoffee.com/izaakford" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>

## 🌟 Inspiration

This package is heavily inspired by many other responsive packages out there. Special mention to <a href="https://pub.dev/packages/auto_size_text" target="_blank">auto_size_text</a> and <a href="https://pub.dev/packages/auto_size_text" target="_blank">sizer</a> as their projects are heavily responsible for the inspiration to create this package.
