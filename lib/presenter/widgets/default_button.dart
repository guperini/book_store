import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app/app_controller.dart';
import 'loading_indicator.dart';

class DefaultButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final int durationInMilliseconds;
  final bool enable;
  final bool isLoading;
  final double horizontalPadding;
  final double verticalPadding;
  final double elevation;
  final Color backgroundColor;
  final double textSize;
  final Color textColor;

  const DefaultButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.textColor = Colors.white,
      this.durationInMilliseconds = 300,
      this.enable = true,
      this.isLoading = false,
      this.horizontalPadding = 0,
      this.elevation = 10,
      this.textSize = 14,
      this.backgroundColor = const Color(0xFF0659E9),
      this.verticalPadding = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
      child: SizedBox(
        height: 48,
        width: double.infinity,
        child: AnimatedOpacity(
          opacity: enable ? 1 : 0.5,
          duration: Duration(milliseconds: durationInMilliseconds),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              elevation: elevation,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: enable
                ? () {
                    final appController = Get.find<AppController>();
                    if (appController.isConnected.value) {
                      onPressed();
                    } else {
                      appController.internetConnectionListener.showNoInternetSnackbar();
                    }
                  }
                : null,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: isLoading
                  ? const Center(
                      child: LoadingIndicator(),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          text.toUpperCase(),
                          style: TextStyle(fontSize: textSize, color: textColor),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
