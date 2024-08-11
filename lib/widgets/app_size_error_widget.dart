part of 'package:responsiveplus/responsive.dart';

/// AppSizeErrorWidget is a widget that displays an error message when the app
/// size is not supported.
///
/// This widget is a prebuilt widget in the ResponsivePlus package
/// and can be overridden to customize the error message and dialog
/// that is displayed when the app size is not supported.
///
class AppSizeErrorWidget extends StatelessWidget {
  const AppSizeErrorWidget({super.key, required this.error});

  /// A boolean value that indicates if the app size is too big.
  /// If app size exceeds the maximum size, this value will be true.
  /// If the app size is below the minimum size, this value will be false.
  final SizeError error;

  /// The build method of the AppSizeErrorWidget.
  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.priority_high_rounded,
                  fill: 1,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              error == SizeError.tooBig
                  ? 'Screen size is too big.'
                  : 'Screen size is too small.',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              error == SizeError.tooBig
                  ? 'Max Size: ${ResponsiveUtil._appConstraints!.maxWidth}x${ResponsiveUtil._appConstraints!.maxHeight}.'
                  : 'Min Size ${ResponsiveUtil._appConstraints!.minWidth}x${ResponsiveUtil._appConstraints!.minHeight}.',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            ResponsiveBuilder(
              builder: (context, constraints, orientation, screenType) => Text(
                'Current Size ${ResponsiveUtil._width}x${ResponsiveUtil._height}.',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
