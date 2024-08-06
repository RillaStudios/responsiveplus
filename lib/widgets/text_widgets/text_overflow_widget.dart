part of 'package:responsiveplus/responsive.dart';

/// TextOverflowWidget is a widget that displays an icon when the text overflows
/// the screen size.
class TextOverflowWidget extends StatelessWidget {
  ///TextOverflowWidget is a widget that displays an icon when the text overflows
  ///the screen size. This avoids the text from overflowing the screen.
  const TextOverflowWidget({super.key});

  ///The main build method of the TextOverflowWidget widget.
  @override
  Widget build(BuildContext context) {
    return ResponsiveChild(
      child: (context, constraints) {
        return Icon(
          Icons.error,
          size: constraints.maxWidth * 0.1,
        );
      },
    );
  }
}
