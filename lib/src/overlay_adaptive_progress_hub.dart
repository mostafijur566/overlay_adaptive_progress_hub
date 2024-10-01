import 'dart:ui';
import 'package:flutter/material.dart';

class OverlayAdaptiveProgressHub extends StatelessWidget {
  const OverlayAdaptiveProgressHub(
      {super.key,
      required this.inAsyncCall,
      this.opacity = 0.3,
      this.color = Colors.grey,
      this.progressIndicator = const CircularProgressIndicator.adaptive(),
      this.offset,
      this.dismissible = false,
      required this.child,
      this.blur = 0.0});

  /// A required [bool] to toggle the modal overlay.
  final bool inAsyncCall;

  /// Specifies the opacity of the modal overlay. Defaults to 0.3.
  final double opacity;

  /// The color of the loading barrier. Defaults to grey.
  final Color color;

  /// The widget displayed at the center of the modal overlay.
  /// Defaults to the standard Android spinner animation.
  final Widget progressIndicator;

  /// Applies an offset to the [progressIndicator] if specified.
  final Offset? offset;

  /// Controls whether the modal overlay is dismissible when interacted with.
  final bool dismissible;

  /// The widget over which the modal overlay will be shown.
  final Widget child;

  /// Specifies the background blur intensity when the progress HUD is active.
  final double blur;

  @override
  Widget build(BuildContext context) {
    Widget layOutProgressIndicator;

    if (offset == null) {
      layOutProgressIndicator = Center(child: progressIndicator);
    } else {
      layOutProgressIndicator = Positioned(
        left: offset!.dx,
        top: offset!.dy,
        child: progressIndicator,
      );
    }

    return Stack(
      children: [
        child,
        if (inAsyncCall) ...[
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
            child: Opacity(
              opacity: opacity,
              child: ModalBarrier(dismissible: dismissible, color: color),
            ),
          ),
          layOutProgressIndicator,
        ]
      ],
    );
  }
}
