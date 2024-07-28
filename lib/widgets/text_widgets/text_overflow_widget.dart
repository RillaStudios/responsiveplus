part of 'package:responsive/responsive.dart';

class TextOverflowWidget extends StatelessWidget {
  const TextOverflowWidget({super.key});

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
