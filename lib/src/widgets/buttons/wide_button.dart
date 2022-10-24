import 'package:flutter/material.dart';

/// A styled button that takes up all of the available horizontal space.
class WideButton extends StatelessWidget {
  final Key? buttonKey;
  final Widget child;
  final Color? background;
  final Color? shadowColor;
  final bool enabled;
  final VoidCallback? onPressed;

  /// Use the padding tweak to allow negative adjustments to padding.
  final EdgeInsets paddingTweak;

  const WideButton({
    required this.child,
     this.onPressed,
     this.background,
     this.buttonKey,
     this.shadowColor,
    this.paddingTweak = const EdgeInsets.all(0),
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: double.infinity),
      decoration: shadowColor != null
          ? BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: shadowColor!,
                    offset: const Offset(0, 10),
                    blurRadius: 10),
              ],
            )
          : null,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: background,
          fixedSize: const Size.fromWidth(100),
          padding: EdgeInsets.only(
            left: 20 + paddingTweak.left,
            right: 20 + paddingTweak.right,
            top: 11 + paddingTweak.top,
            bottom: 11 + paddingTweak.bottom,
          ),
        ),
        key: buttonKey,
        onPressed: enabled ? onPressed : null,
        child: child,
      ),
    );
  }
}
