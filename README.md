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

<h4>🗚 Rext Widget</h4>

- Rext widget: A Text widget that will automatically adjust its size based on screen size.

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

  - Example

  ```dart
    Text('This is some font at size: ', style: TextStyle(fontSize: ResponsiveUtil.isMobile() ? 12 : 16))
  ```

- ResponsiveUtil.isTablet() - Returns weather the current screen size is tablet (bool).

  - Example

  ```dart
    Text('This is some font at size: ', style: TextStyle(fontSize: ResponsiveUtil.isTablet() ? 14 : 16))
  ```

- ResponsiveUtil.isDesktop() - Retruns weather the current screen size is desktop (bool).

  - Example

  ```dart
    Text('This is some font at size: ', style: TextStyle(fontSize: ResponsiveUtil.isDesktop() ? 18 : 14))
  ```

- ResponsiveUtil.isIos() - Returns weather the current device is an IOS device (bool).

  - Example

  ```dart
    Text(ResponsiveUtil.isIos() ? 'This is an IOS device!' : 'This is NOT an IOS device!')
  ```

- ResponsiveUtil.isAndroid() - Returns weather the current device is an IOS device (bool).

  - Example

  ```dart
    Text(ResponsiveUtil.isAndroid() ? 'This is an Android device!' : 'This is NOT an Android device!')
  ```

- ResponsiveUtil.isMacOs() - Returns weather the current device is a macOS device (bool).

  - Example

  ```dart
    Text(ResponsiveUtil.isAndroid() ? 'This is a MacOS device!' : 'This is NOT a MacOS device!')
  ```

- ResponsiveUtil.isWindows() - Returns weather the current device is a Windows device (bool).

  - Example

  ```dart
    Text(ResponsiveUtil.isWindows() ? 'This is a Windows device!' : 'This is NOT a Windows device!')
  ```

- ResponsiveUtil.isLinux() - Returns weather the current device is a Linux device (bool).

  - Example

  ```dart
    Text(ResponsiveUtil.isLinux() ? 'This is a Linux device!' : 'This is NOT a Linux device!')
  ```

- ResponsiveUtil.isFuchsia() - Returns weather the current device is a Fuchsia device (bool).

  - Example

  ```dart
    Text(ResponsiveUtil.isFuchsia() ? 'This is a Fuchsia device!' : 'This is NOT a Fuchsia device!')
  ```

- ResponsiveUtil.isWeb() - Returns weather the current device is a Web platform (bool).

  - Example

  ```dart
    Text(ResponsiveUtil.isWeb() ? 'This is a Web platform!' : 'This is NOT a Web platform!')
  ```

- ResponsiveUtil.getDeviceType() - Returns the current device type (DeviceType - ios, android, macos, windows, linux, fuchsia, web)

  - Example

  ```dart
    void deviceGetter() {
      DeviceType currentDevice = ResponsiveUtil.getDeviceType();

      switch (currentDevice) {
        case DeviceType.android:
          print('im android');

        ///Other device types cases...
        ///
        default:
          print('im another device');
      }
    }
  ```

- ResponsiveUtil.getScreenType() - Returns the current screen type (ScreenType - mobile, tablet, desktop)

  - Example

  ```dart
    void screenGetter() {
      ScreenType currentScreen = ResponsiveUtil.getScreenType();

      switch (currentScreen) {
        case ScreenType.mobile:
          print('im mobile');

        ///Other screen types cases...
        ///
        default:
          print('im another screen type');
      }
    }
  ```

- ResponsiveUtil.getOrientation() - Returns the current screen type (Orientation)

  - Example

  ```dart
    void orientationGetter() {
      Orientation currentOrientation = ResponsiveUtil.getOrientation();

      switch (currentOrientation) {
        case Orientation.landscape:
          print('im landscape');

        ///Other screen types cases...
        ///
        default:
          print('im another orientation');
      }
    }
  ```

- ResponsiveUtil.getBoxConstraints() - Returns the current BoxConstraints of the whole screen (BoxConstraints)

  - Example

  ```dart
    void boxConstraintsGetter() {
      BoxConstraints currentConstraints = ResponsiveUtil.getBoxConstraints();

      if(currentConstraints.maxWidth > 750) {
        print('constraint width smaller than 750px!');
      }
    }
  ```

- ResponsiveUtil.getWidth() - Returns the current screen width (double)

  - Example

  ```dart
    void widthGetter() {
      double currentWidth = ResponsiveUtil.getWidth();

        print('screen width is $currentWidth');

    }
  ```

- ResponsiveUtil.getHeight() - Returns the current screen height (double)

  - Example

  ```dart
    void heightGetter() {
      double currentHeight = ResponsiveUtil.getHeight();

        print('screen height is $currentHeight');

    }
  ```

- ResponsiveUtil.getDisplayWidth() - Returns the current display width (double)

  - Example

  ```dart
    void displayWidthGetter() {
      double displayWidth = ResponsiveUtil.getDisplayWidth();

        print('display width is $displayWidth');

    }
  ```

- ResponsiveUtil.getDisplayHeight() - Returns the current display height (double)

  - Example

  ```dart
    void displayHeightGetter() {
      double displayHeight = ResponsiveUtil.getDisplayHeight();

        print('display height is $displayHeight');

    }
  ```

- ResponsiveUtil.getDouble() - Will return a double based on current ScreenType (double)

  - Example

  ```dart
   Text('This is some font at size: ', style: TextStyle(fontSize: ResponsiveUtil.getDouble(mobile: 14, tablet: 16, desktop: 18)))
  ```

- ResponsiveUtil.getInt() - Will return an int based on current ScreenType (int)

  - Example

  ```dart
   void example() {
    int startingInt = ResponsiveUtil.getInt(mobile: 5, tablet: 10, desktop: 30);

    print(startingInt);
   }
  ```

<h3>🔗 Extensions:</h3>

The ResponsivePlus package comes with built in extensions to help easily set the size of UI components based off screen or constraint sizes.

- w - Converts a number to a responsive width value (example: 10.w - 10% of screen width)

  - Example

  ```dart
  Container(width: 50.w, color: Colors.blue, child: Text('50% of screen width!'))
  ```

- h - Converts a number to a responsive height value (example: 10.h - 10% of screen height)

  - Example

  ```dart
  Container(width: 25.h, color: Colors.blue, child: Text('25% of screen height!'))
  ```

- sp - Converts a number to a scaleable pixel value (example: 3.sp)

  - Example

  ```dart
   Text('This is some font at size: ', style: TextStyle(fontSize: 5.sp))
  ```

- cw(constraints) - Converts the number to a responsive width value based on the constraint width of the parent widget

  - Example

  ```dart
  Container(
    width: 100,
    height: 100,
    color: Colors.red,
    child: LayoutBuilder(
      builder: (context, constraints) {
        Center(
          child: Container(
              width: 50.cw(constraints), //50% of 100 - 50px
              height: 20,
              color: Colors.blue),
        );
      },
    ),
  );
  ```

- ch(constraints) - Converts the number to a responsive heigth value based on the constraint height of the parent widget

  - Example

  ```dart
  Container(
    width: 100,
    height: 100,
    color: Colors.red,
    child: LayoutBuilder(
      builder: (context, constraints) {
        Center(
          child: Container(
              width: 50,
              height: 20.ch(constraints), //20% of 100 - 20px
              color: Colors.blue),
        );
      },
    ),
  );
  ```

- dw - Converts a number to a responsive width value based on the users physical screen width (example: 10.dw - 10% of display width)

  - Example

  Lets pretend the user is using a 1920x1080 monitor display.

  ```dart
  Container(width: 10.w, color: Colors.blue, child: Text('10% of screen display width! (198)'))
  ```

- dh - Converts a number to a responsive width value based on the users physical screen height (example: 10.dh - 10% of display height)

  - Example

  Lets pretend the user is using a 1920x1080 monitor display.

  ```dart
  Container(width: 20.h, color: Colors.blue, child: Text('10% of screen display height! (216)'))
  ```

<h3> 📦 Additonal Features</h3>

- Set app constraints, if a user resizes the app to an unsupported size optionally show them a dialog and optionally perform a custom function.
- Create a custom Rext overflow widget when a Rext widget can no longer fit the text to your desired parameters.
- Create a RextGroup and add the group name to multiple Rext widgets in the "group" parameter to ensure they will always be the same size.
- Configure if a user can change the orientation on a device.
- Configure supported orientations.

<!--

Im going to try and make a YouTube video for this package, or if someone whose
better at making videos wants to show it off I would be more than happy to link it.

## 📽️ Video Tutorial

Watch this tutorial for a better undestanding of all the projects features.

[![](https://markdown-videos-api.jorgenkh.no/youtube/VID_ID_HERE)](https://youtu.be/VID_ID_HERE)

-->

## 📋 Getting started

To use this package, add ResponsivePlus as a dependency in your pubspec.yaml file.

```yaml
dependencies:
  responsiveplus: ^1.0.0
```

Import the package

```dart
import 'package:responsive/responsive.dart';
```

## 🧪 Example

```dart
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
    appConstraints: const BoxConstraints(maxWidth: 1600, minWidth: 550, minHeight: 500),
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
                    maxLines: 2, fontSize: 2.cw(constraints), //2% of nearest provided constraints width
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
```

## ℹ️ Additional information

<h3>🪄 Feature request?</h3>

Have an idea to make this package even better? Tell us on the <a href="https://github.com/RillaStudios/responsiveplus/discussions">ResponsivePlus discussion page (GitHub)</a>

<h3>🪲 Found a bug?</h3>

Please report all bugs or issues on the <a href="https://github.com/RillaStudios/responsiveplus/issues">ResponsivePlus issues page (GitHub)</a>

We encourage you to report anything package related to the GitHub repository pages as any and all input will help make this package even better in future versions!

## 🚀 Support

Enjoying this package? Consider supporting my work. Your contributions will allow me to keep creating and sharing valuable content and innovative projects.

<a href="https://www.buymeacoffee.com/izaakford" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>

## 🌟 Inspiration

This package is heavily inspired by many other responsive packages out there. Special mention to <a href="https://pub.dev/packages/auto_size_text" target="_blank">auto_size_text</a> and <a href="https://pub.dev/packages/auto_size_text" target="_blank">sizer</a> as their projects are heavily responsible for the inspiration to create this package.
