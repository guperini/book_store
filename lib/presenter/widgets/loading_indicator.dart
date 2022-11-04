import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingIndicator extends StatelessWidget {
  final Color color;
  final double size;
  const LoadingIndicator({super.key, this.color = Colors.blue, this.size = 30});
  @override
  Widget build(BuildContext context) => Center(
        child: SpinKitThreeBounce(
          color: color,
          size: size,
        ),
      );
}
