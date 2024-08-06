///
///Responsive is a flutter package that helps you
///to make your app responsive for all devices.
///It provides a set of tools to help you build
///responsive UIs for different screen sizes and
///orientations.
///
///This package is inspired by the Sizer package,
///published by TechnoUrmish, Urmish Patel on pub.dev.
///
///Sizer package (GitHub): https://github.com/TechnoUrmish/Sizer
///Sizer package (pub.dev): https://pub.dev/packages/sizer
///
///This package is also inspired by the auto_size_text package,
///published by simc.dev on pub.dev.
///
///auto_size_text package (GitHub): https://github.com/simc
///auto_size_text package (pub.dev): https://pub.dev/packages/auto_size_text
///
///@author IFD
///@since 2024/07/12
///
library responsiveplus;

import 'dart:async';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'src/responsive_util.dart';

part 'src/responsive_extenisions.dart';

part 'src/responsive_builder.dart';

part 'src/responsive_exception.dart';

part 'widgets/responsive_child.dart';

part 'widgets/responsive_children.dart';

part 'widgets/row_column.dart';

part 'widgets/wrap_column.dart';

part 'widgets/text_widgets/rext.dart';

part 'widgets/text_widgets/rext_group.dart';

part 'widgets/text_widgets/text_overflow_widget.dart';
