///
///Responsive is a flutter package that helps you
///to make your app responsive for all devices.
///It provides a set of tools to help you build
///responsive UIs for different screen sizes and
///orientations.
///
///This package is inspired by the Sizer package,
///published by TechnoUrmish, Urmish Patel on pub.dev.
///A few of the methods and classes are lifted from the
///Sizer package and modified to suit the needs of this
///package. All methods with '@urmishtech' are lifted or
///modified from the Sizer package.
///
///Sizer package (GitHub): https://github.com/TechnoUrmish/Sizer
///Sizer package (pub.dev): https://pub.dev/packages/sizer
///
///@author IFD
///@since 2024/07/12
///
library responsive;

import 'package:flutter/foundation.dart';
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
