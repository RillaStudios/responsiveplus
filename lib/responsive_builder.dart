part of 'responsive.dart';

typedef ResponsiveBuilder = Widget Function(
  BuildContext context,
  Orientation orientation,
  ScreenType screenType,
);

class Responsive extends StatelessWidget {
  const Responsive({super.key, required this.builder});

  final ResponsiveBuilder builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            ResponsiveUtil.updateScreenSize(constraints, orientation);
            return builder(
              context,
              ResponsiveUtil.orientation,
              ResponsiveUtil.screenType,
            );
          },
        );
      },
    );
  }
}
