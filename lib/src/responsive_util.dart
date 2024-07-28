part of '../responsive.dart';

/// Enum to define the device type
///
enum DeviceType { android, ios, macos, windows, linux, fuchsia, web }

/// Enum to define the screen type
///
enum ScreenType { mobile, tablet, desktop }

/// ResponseiveUtil class is a utility class that provides
/// methods to initialize the responsive package and update
/// the screen size and orientation when the screen size changes.
///
/// It also provides some static variables to store the screen size,
/// orientation, device type, and supported platforms.
///
/// The init method is called when the app is launched to initialize
/// the responsive package. The updateScreenSize method is called
/// when the screen size changes to update the screen size and orientation.
///
/// @author IFD
/// @since 2024/07/12
///
class ResponsiveUtil {
  /// A variable to store the mobile breakpoint
  ///
  static late double _mobileBreakpoint;

  /// A variable to store the tablet breakpoint
  ///
  static late double _tabletBreakpoint;

  /// A variable to store the box constraints
  ///
  static late BoxConstraints boxConstraints;

  /// A variable to store the orientation
  ///
  static late Orientation orientation;

  /// A variable to store the device type
  ///
  static late DeviceType deviceType;

  /// A variable to store the screen type
  ///
  static late ScreenType screenType;

  /// A double to store the screen width
  ///
  static late double width;

  /// A double to store the screen height
  ///
  static late double height;

  /// A bool to check weather the device is allowed to change orientation
  ///
  static bool allowOrientationChange = false;

  /// A method to initialize the responsive package
  /// and set the screen size, orientation, device type,
  /// and supported platforms.
  ///
  /// @param enableOrientationChange bool
  /// @param devicePlatforms List<DeviceType>
  /// @since 2024/07/12
  /// @author IFD
  static void init({bool? enableOrientationChange, double? mobileBreakpoint, double? tabletBreakpoint}) {
    ///
    /// Set the static variable allowOrientationChange based on params
    allowOrientationChange = enableOrientationChange == false ? false : true;

    ///Set the breakpoints based on the parameters
    ///or use the default breakpoints
    ///
    _mobileBreakpoint = mobileBreakpoint ?? 600;
    _tabletBreakpoint = tabletBreakpoint ?? 1024;

    /// If the allowOrientationChange is false and the platform is not web
    /// then set the preferred orientation to portraitUp.
    ///
    /// This will prevent the app from changing orientation.
    if (!allowOrientationChange && !kIsWeb) {
      SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp],
      );
    }

    if (kIsWeb) {
      deviceType = DeviceType.web;
    } else {
      switch (defaultTargetPlatform) {
        case TargetPlatform.android:
          deviceType = DeviceType.android;
        case TargetPlatform.iOS:
          deviceType = DeviceType.ios;
        case TargetPlatform.macOS:
          deviceType = DeviceType.macos;
        case TargetPlatform.windows:
          deviceType = DeviceType.windows;
        case TargetPlatform.linux:
          deviceType = DeviceType.linux;
        case TargetPlatform.fuchsia:
          deviceType = DeviceType.fuchsia;
        default:
          throw ResponsiveException('Unsupported Platform: $defaultTargetPlatform is not supported. Not setting device type.');
      }
    }

    ///Sets the device pixel ratio based on the device
    final double devicePixelRatio = WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;

    ///Sets the screen width based on the screen width
    final double physicalWidth = WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.width;
    width = physicalWidth / devicePixelRatio;

    ///Sets the screen height based on the screen height
    final double physicalHeight = WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.height;
    height = physicalHeight / devicePixelRatio;

    ///Sets the screenType based on the screen width
    if (width >= 1024) {
      screenType = ScreenType.desktop;
    } else if (width >= 600) {
      screenType = ScreenType.tablet;
    } else {
      screenType = ScreenType.mobile;
    }
  }

  /* 
  A method to update the screen size and orientation
  when the screen size changes

  @urmishtech TechnoUrmish, Urmish Patel
  @author IFD
  @since 2024/07/12
  */
  static void updateScreenSize(BoxConstraints constraints, Orientation currentOrientation) {
    boxConstraints = constraints;

    orientation = currentOrientation;

    width = boxConstraints.maxWidth;
    height = boxConstraints.maxHeight;

    if (width >= _tabletBreakpoint) {
      screenType = ScreenType.desktop;
    } else if (width >= _mobileBreakpoint) {
      screenType = ScreenType.tablet;
    } else {
      screenType = ScreenType.mobile;
    }
  }

  /// A bool to check weather the device is mobile
  ///
  /// @return bool
  /// @since 2024/07/17
  /// @author IFD
  static bool isMobile() {
    return screenType == ScreenType.mobile;
  }

  /// A bool to check weather the device is tablet
  ///
  /// @return bool
  /// @since 2024/07/17
  /// @author IFD
  static bool isTablet() {
    return screenType == ScreenType.tablet;
  }

  /// A bool to check weather the device is desktop
  ///
  /// @return bool
  /// @since 2024/07/17
  /// @author IFD
  static bool isDesktop() {
    return screenType == ScreenType.desktop;
  }

  /// A bool to check weather the device is iOS
  ///
  /// @return bool
  /// @since 2024/07/17
  /// @author IFD
  static bool isIos() {
    return deviceType == DeviceType.ios;
  }

  /// A bool to check weather the device is Android
  ///
  /// @return bool
  /// @since 2024/07/17
  /// @author IFD
  static bool isAndroid() {
    return deviceType == DeviceType.android;
  }

  /// A bool to check weather the device is macOS
  ///
  /// @return bool
  /// @since 2024/07/17
  /// @author IFD
  static bool isMacOs() {
    return deviceType == DeviceType.macos;
  }

  /// A bool to check weather the device is Windows
  ///
  /// @return bool
  /// @since 2024/07/17
  /// @author IFD
  static bool isWindows() {
    return deviceType == DeviceType.windows;
  }

  /// A bool to check weather the device is Linux
  ///
  /// @return bool
  /// @since 2024/07/17
  /// @author IFD
  static bool isLinux() {
    return deviceType == DeviceType.linux;
  }

  /// A bool to check weather the device is Fuchsia
  ///
  /// @return bool
  /// @since 2024/07/17
  /// @author IFD
  static bool isFuchsia() {
    return deviceType == DeviceType.fuchsia;
  }

  /// A bool to check weather the device is Web
  ///
  /// @return bool
  /// @since 2024/07/17
  /// @author IFD
  static bool isWeb() {
    return deviceType == DeviceType.web;
  }

  /// A method to get the current device type
  ///
  /// @return DeviceType
  /// @since 2024/07/15
  /// @author IFD
  static DeviceType getDeviceType() {
    return deviceType;
  }

  /// A method to get the current screen type
  ///
  /// @return ScreenType
  /// @since 2024/07/15
  /// @author IFD
  static ScreenType getScreenType() {
    return screenType;
  }

  /// A method to get the current orientation
  ///
  /// @return Orientation
  /// @since 2024/07/15
  /// @author IFD
  static Orientation getOrientation() {
    return orientation;
  }

  /// A method to get the current box constraints
  ///
  /// @return BoxConstraints
  /// @since 2024/07/15
  /// @author IFD
  static BoxConstraints getBoxConstraints() {
    return boxConstraints;
  }

  /// A method to get the current screen width
  ///
  /// @return double
  /// @since 2024/07/15
  /// @author IFD
  static double getWidth() {
    return width;
  }

  /// A method to get the current screen height
  ///
  /// @return double
  /// @since 2024/07/15
  /// @author IFD
  static double getHeight() {
    return height;
  }

  /// A method to return a double based on the screen type
  ///
  /// @param mobile double
  /// @param tablet double
  /// @param desktop double
  /// @return double
  /// @since 2024/07/15
  /// @author IFD
  static double getDouble({required double mobile, double? tablet, required double desktop}) {
    if (isMobile()) {
      return mobile;
    } else if (isTablet()) {
      return tablet ?? mobile;
    } else {
      return desktop;
    }
  }

  /// A method to return a int based on the screen type
  ///
  /// @param mobile int
  /// @param tablet int
  /// @param desktop int
  /// @return int
  /// @since 2024/07/15
  static int getInt({required int mobile, int? tablet, required int desktop}) {
    if (isMobile()) {
      return mobile;
    } else if (isTablet()) {
      return tablet ?? mobile;
    } else {
      return desktop;
    }
  }
}
