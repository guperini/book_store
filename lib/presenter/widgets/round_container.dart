import 'package:flutter/material.dart';

class RoundContainer extends StatelessWidget {
  final Color? borderColor;
  final Color backgroundColor;
  final double radius;
  final Widget? child;
  final double? height;
  final double? width;
  final double horizontalPadding;
  final double verticalPadding;
  final bool shadow;
  final double borderThickness;
  final Color shadowColor;
  final Function? onTap;

  const RoundContainer(
      {Key? key,
      this.radius = 3,
      this.child,
      this.height,
      this.width,
      this.borderColor,
      this.horizontalPadding = 0,
      this.verticalPadding = 0,
      this.shadow = true,
      this.borderThickness = 1.0,
      this.onTap,
      this.shadowColor = Colors.grey,
      this.backgroundColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap == null ? {} : onTap!(),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor ?? Colors.transparent, width: borderThickness),
          color: backgroundColor,
          boxShadow: !shadow
              ? null
              : [
                  BoxShadow(
                    color: shadowColor,
                    offset: const Offset(0.0, 1.0), //(x,y)
                    blurRadius: 10.0,
                  )
                ],
          borderRadius: BorderRadius.circular(radius),
        ),
        child: child ?? const SizedBox(),
      ),
    );
  }
}
