part of 'package:responsiveplus/responsive.dart';

/// Enum to define the device type
///
enum DeviceType { android, ios, macos, windows, linux, fuchsia, web }

/// Enum to define the screen type
///
enum ScreenType { mobile, tablet, desktop }

/// Enum to define the size error
/// when the app screen size is not supported
///
enum SizeError { tooBig, tooSmall }

/// ResponseiveUtil class is the main utility class that provides
/// methods to initialize the responsive package and update
/// the screen size and orientation when the screen size changes.
///
/// It also provides static variables to store the screen size,
/// orientation, device type, and supported platforms along with other
/// variable within the package.
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
  static late BoxConstraints _boxConstraints;

  /// A variable to store the orientation
  ///
  static late Orientation _orientation;

  /// A variable to store the device type
  ///
  static late DeviceType _deviceType;

  /// A variable to store the screen type
  ///
  static late ScreenType _screenType;

  /// A double to store the screen width
  ///
  static late double _width;

  /// A double to store the screen height
  ///
  static late double _height;

  /// A double to store the physical screen width
  ///
  static late double _displayWidth;

  /// A double to store the physical screen height
  ///
  static late double _displayHeight;

  /// A bool to check weather the device is allowed to change orientation
  ///
  static bool _allowOrientationChange = false;

  /// A Widget to store the [Rext] overflow widget
  /// to be used when the [Rext] overflows
  ///
  /// Default is [TextOverflowWidget]
  ///
  static Widget? _rextOverflowWidget;

  /// A double to store the minimum app size
  /// to be used when the app is resized or
  /// launched
  ///
  /// Default is null
  ///
  static BoxConstraints? _appConstraints;

  /// A Function to store the events to perform
  /// when the app size is not supported
  ///
  /// Default is null
  ///
  static Function(SizeError? error)? _onSizeError;

  /// A [SizeError] to store if the app size has an error
  /// and the type of error
  ///
  static SizeError? _appSizeError;

  /// A bool to store if the app size error dialog
  /// should be shown when the app size is not supported
  ///
  /// Default is true
  ///
  static bool? _showDialogOnSizeError;

  /// A dialog to store the custom app size error dialog
  /// to be used when the app size is not supported
  ///
  /// Default is null
  ///
  static Dialog? _customAppSizeErrorDialog;

  /// A bool to store if the dialog barrier should be dismissible
  /// when the app size is not supported
  ///
  /// Default is false
  ///
  static bool? _dialogBarrierDismissible;

  /// A color to store the dialog barrier color
  /// to be used when the app size is not supported
  /// and the dialog is shown
  ///
  /// Default is Colors.grey.shade800.withOpacity(0.85)
  ///
  static Color? _dialogBarrierColor;

  ///
  /// A method to initialize the responsive package
  /// and set the screen size, orientation, device type,
  /// and supported platforms.
  ///
  /// ### All parameters are optional
  ///
  /// The method takes the following parameters:
  ///
  ///
  /// ### Orientation Parameters
  ///
  /// [enableOrientationChange] - A bool to enable or disable orientation change
  /// - (default is true)
  ///
  /// [allowedOrientations] - A list of DeviceOrientation to set the allowed orientations
  /// - (default is all orientations)
  /// - First orientation in list is the default orientation
  ///
  /// - If the allowedOrientations is not set then all orientations are allowed and enabled
  ///
  /// ### iOS - Orientation Notes
  ///
  /// This setting will only be respected on iPad if multitasking is disabled.
  ///
  /// You can decide to opt out of multitasking on iPad, then
  /// setPreferredOrientations will work but your app will not
  /// support Slide Over and Split View multitasking anymore.
  ///
  /// Should you decide to opt out of multitasking you can do this by
  /// setting "Requires full screen" to true in the Xcode Deployment Info.
  ///
  /// ### Breakpoint Parameters
  ///
  /// [mobileBreakpoint] - A double to set the mobile breakpoint
  /// - (default is 600)
  ///
  /// [tabletBreakpoint] - A double to set the tablet breakpoint
  /// - (default is 1024)
  ///
  /// ### Rext Overflow Widget
  ///
  /// [textOverflowWidget] - A Widget to set the [Rext] widget to be used when the text overflows
  /// - (default is [TextOverflowWidget])
  ///
  /// ### App Constraint Parameters
  ///
  /// [appConstraints] - A BoxConstraints to set the min and max app size
  /// - (default is null)
  ///
  /// [onSizeError] - A function to set the events to perform when the app size is not supported
  /// - (default is null)
  ///
  /// [showDialogOnSizeError] - A bool to set if the app size error dialog should be shown when the app size is not supported
  /// - (default is true)
  /// - only applies when appConstraints is set
  ///
  /// [customAppSizeErrorDialog] - a Dialog to set the custom app size error dialog to be used when the app size is not supported
  /// - (default is null)
  /// - only applies when appConstraints is set
  ///
  /// [dialogBarrierDismissible] - a bool to set if the dialog barrier should be dismissible when the app size is not supported
  /// - (default is false)
  /// - only applies when appConstraints is set
  ///
  /// [dialogBarrierColor] - a color to set the dialog barrier color to be used when the app size is not supported and the dialog is shown
  /// - (default is Colors.grey.shade800.withOpacity(0.85))
  /// - only applies when appConstraints is set
  ///
  /// @since 2024/07/12
  /// @author IFD
  static void init(
      {bool? enableOrientationChange,
      List<DeviceOrientation>? allowedOrientations,
      double? mobileBreakpoint,
      double? tabletBreakpoint,
      BoxConstraints? appConstraints,
      Widget? textOverflowWidget,
      Function(SizeError? error)? onSizeError,
      bool? showDialogOnSizeError,
      Dialog? customAppSizeErrorDialog,
      bool? dialogBarrierDismissible,
      Color? dialogBarrierColor}) {
    ///
    /// Set the static variable allowOrientationChange based on params
    _allowOrientationChange = enableOrientationChange == false ? false : true;

    ///Set the breakpoints based on the parameters
    ///or use the default breakpoints
    ///
    _mobileBreakpoint = mobileBreakpoint ?? 600;
    _tabletBreakpoint = tabletBreakpoint ?? 1024;

    ///Set the min and max app size based on the parameters,
    ///default is null
    _appConstraints = appConstraints;

    //Set the onSizeError function based on the parameters,
    //default is null
    _onSizeError = onSizeError;

    ///Set the showDialogOnSizeError based on the parameters,
    ///default is true
    _showDialogOnSizeError = showDialogOnSizeError ?? true;

    ///Set the customAppSizeErrorWidget based on the parameters,
    ///default is null
    _customAppSizeErrorDialog = customAppSizeErrorDialog;

    ///Set the dialogBarrierDismissible based on the parameters,
    ///default is false
    ///
    _dialogBarrierDismissible = dialogBarrierDismissible ?? false;

    ///Set the dialogBarrierColor based on the parameters,
    ///default is Colors.grey.shade800.withOpacity(0.85)
    ///
    _dialogBarrierColor = dialogBarrierColor ?? Colors.grey.shade800.withOpacity(0.85);

    /// If the allowOrientationChange is false and the platform is not web
    /// then set the preferred orientation to portraitUp.
    ///
    /// This will prevent the app from changing orientation.
    if (!_allowOrientationChange && !kIsWeb) {
      SystemChrome.setPreferredOrientations(
        [allowedOrientations != null && allowedOrientations.isNotEmpty ? allowedOrientations.first : DeviceOrientation.portraitUp],
      );
    } else {
      /// If the allowedOrientations is not null then set the preferred orientations
      /// to the allowed orientations.
      if (allowedOrientations != null) {
        SystemChrome.setPreferredOrientations(allowedOrientations);
      }
    }

    if (kIsWeb) {
      _deviceType = DeviceType.web;
    } else {
      switch (defaultTargetPlatform) {
        case TargetPlatform.android:
          _deviceType = DeviceType.android;
        case TargetPlatform.iOS:
          _deviceType = DeviceType.ios;
        case TargetPlatform.macOS:
          _deviceType = DeviceType.macos;
        case TargetPlatform.windows:
          _deviceType = DeviceType.windows;
        case TargetPlatform.linux:
          _deviceType = DeviceType.linux;
        case TargetPlatform.fuchsia:
          _deviceType = DeviceType.fuchsia;
        default:
          throw ResponsiveException('Unsupported Platform: $defaultTargetPlatform is not supported. Not setting device type.');
      }
    }

    ///Sets the device pixel ratio based on the device
    final double devicePixelRatio = WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;

    ///Sets the screen width based on the screen width
    final double physicalWidth = WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.width;
    _width = physicalWidth / devicePixelRatio;

    _displayWidth = WidgetsBinding.instance.platformDispatcher.views.first.display.size.width;

    ///Sets the screen height based on the screen height
    final double physicalHeight = WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.height;
    _height = physicalHeight / devicePixelRatio;

    _displayHeight = WidgetsBinding.instance.platformDispatcher.views.first.display.size.height;

    ///Sets the screenType based on the screen width
    if (_width >= 1024) {
      _screenType = ScreenType.desktop;
    } else if (_width >= 600) {
      _screenType = ScreenType.tablet;
    } else {
      _screenType = ScreenType.mobile;
    }

    if (textOverflowWidget == null) {
      _rextOverflowWidget = const TextOverflowWidget();
    } else {
      _rextOverflowWidget = textOverflowWidget;
    }
  }

  ///
  /// A method to update the screen size and orientation
  /// when the screen size changes
  ///
  /// @author IFD
  /// @since 2024/07/12
  ///
  static void _updateScreenSize(BuildContext context, BoxConstraints constraints, Orientation currentOrientation) {
    _boxConstraints = constraints;

    _orientation = currentOrientation;

    _width = _boxConstraints.maxWidth;
    _height = _boxConstraints.maxHeight;

    if (_height == double.infinity) {
      _height = MediaQuery.of(context).size.height;
    }

    if (_width >= _tabletBreakpoint) {
      _screenType = ScreenType.desktop;
    } else if (_width >= _mobileBreakpoint) {
      _screenType = ScreenType.tablet;
    } else {
      _screenType = ScreenType.mobile;
    }

    ///Check if the minAppSize is set (not null)
    if (_appConstraints != null) {
      _checkAppSize(context);
    }
  }

  /// A method to check if the app size is supported
  /// based on the min and max app size
  /// and the current screen size
  ///
  /// @author IFD
  /// @since 2024/08/10
  static void _checkAppSize(BuildContext context) {
    ///Check if current screen width is less than the minAppSize
    if (_width < _appConstraints!.minWidth || _height < _appConstraints!.minHeight || _width > _appConstraints!.maxWidth || _height > _appConstraints!.maxHeight) {
      ///Check to make sure _appSizeError is not already in an error state
      if (_appSizeError == null) {
        ///If it is then set the appSizeError to tooSmall
        if (_width > _appConstraints!.maxWidth || _height > _appConstraints!.maxHeight) {
          _appSizeError = SizeError.tooBig;
        } else {
          _appSizeError = SizeError.tooSmall;
        }

        ///If not then show the AppSizeErrorWidget
        WidgetsBinding.instance.addPostFrameCallback(
          (timeStamp) {
            if (_showDialogOnSizeError == true) {
              showDialog(
                barrierDismissible: _dialogBarrierDismissible ?? false,
                barrierColor: _dialogBarrierColor ?? Colors.grey.shade800.withOpacity(0.85),
                context: context,
                builder: (context) {
                  return _customAppSizeErrorDialog ?? AppSizeErrorWidget(error: _appSizeError!);
                },
              );
            }

            if (_onSizeError != null) {
              _onSizeError?.call(_appSizeError);
            }
          },
        );
      }
    } else {
      ///If the screen size is within the min and max size
      ///then set the appSizeError to null
      if (_appSizeError != null) {
        WidgetsBinding.instance.addPostFrameCallback(
          (timeStamp) {
            Navigator.of(context).pop();
          },
        );
        _appSizeError = null;
      }
    }
  }

  /// A bool to check weather the device is mobile
  ///
  /// @return bool
  /// @since 2024/07/17
  /// @author IFD
  static bool isMobile() {
    return _screenType == ScreenType.mobile;
  }

  /// A bool to check weather the device is tablet
  ///
  /// @return bool
  /// @since 2024/07/17
  /// @author IFD
  static bool isTablet() {
    return _screenType == ScreenType.tablet;
  }

  /// A bool to check weather the device is desktop
  ///
  /// @return bool
  /// @since 2024/07/17
  /// @author IFD
  static bool isDesktop() {
    return _screenType == ScreenType.desktop;
  }

  /// A bool to check weather the device is iOS
  ///
  /// @return bool
  /// @since 2024/07/17
  /// @author IFD
  static bool isIos() {
    return _deviceType == DeviceType.ios;
  }

  /// A bool to check weather the device is Android
  ///
  /// @return bool
  /// @since 2024/07/17
  /// @author IFD
  static bool isAndroid() {
    return _deviceType == DeviceType.android;
  }

  /// A bool to check weather the device is macOS
  ///
  /// @return bool
  /// @since 2024/07/17
  /// @author IFD
  static bool isMacOs() {
    return _deviceType == DeviceType.macos;
  }

  /// A bool to check weather the device is Windows
  ///
  /// @return bool
  /// @since 2024/07/17
  /// @author IFD
  static bool isWindows() {
    return _deviceType == DeviceType.windows;
  }

  /// A bool to check weather the device is Linux
  ///
  /// @return bool
  /// @since 2024/07/17
  /// @author IFD
  static bool isLinux() {
    return _deviceType == DeviceType.linux;
  }

  /// A bool to check weather the device is Fuchsia
  ///
  /// @return bool
  /// @since 2024/07/17
  /// @author IFD
  static bool isFuchsia() {
    return _deviceType == DeviceType.fuchsia;
  }

  /// A bool to check weather the device is Web
  ///
  /// @return bool
  /// @since 2024/07/17
  /// @author IFD
  static bool isWeb() {
    return _deviceType == DeviceType.web;
  }

  /// A method to get the current device type
  ///
  /// @return DeviceType
  /// @since 2024/07/15
  /// @author IFD
  static DeviceType getDeviceType() {
    return _deviceType;
  }

  /// A method to get the current screen type
  ///
  /// @return ScreenType
  /// @since 2024/07/15
  /// @author IFD
  static ScreenType getScreenType() {
    return _screenType;
  }

  /// A method to get the current orientation
  ///
  /// @return Orientation
  /// @since 2024/07/15
  /// @author IFD
  static Orientation getOrientation() {
    return _orientation;
  }

  /// A method to get the current box constraints
  ///
  /// @return BoxConstraints
  /// @since 2024/07/15
  /// @author IFD
  static BoxConstraints getBoxConstraints() {
    return _boxConstraints;
  }

  /// A method to get the current screen width
  ///
  /// @return double
  /// @since 2024/07/15
  /// @author IFD
  static double getWidth() {
    return _width;
  }

  /// A method to get the current screen height
  ///
  /// @return double
  /// @since 2024/07/15
  /// @author IFD
  static double getHeight() {
    return _height;
  }

  /// A method to get the current physical screen width
  ///
  /// @return double
  /// @since 2024/08/10
  /// @author IFD
  static double getDisplayWidth() {
    return _displayWidth;
  }

  /// A method to get the current physical screen height
  ///
  /// @return double
  /// @since 2024/08/10
  /// @since IFD
  static double getDisplayHeight() {
    return _displayHeight;
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
