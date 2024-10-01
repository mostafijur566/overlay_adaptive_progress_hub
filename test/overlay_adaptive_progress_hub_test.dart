import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:overlay_adaptive_progress_hub/overlay_adaptive_progress_hub.dart';

void main() {
  testWidgets('OverlayAdaptiveProgressHub shows progress indicator when inAsyncCall is true', (WidgetTester tester) async {
    // Build the widget with inAsyncCall set to true
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: OverlayAdaptiveProgressHub(
            inAsyncCall: true,
            child: Text('Test Child Widget'),
          ),
        ),
      ),
    );

    // Verify that the child widget is displayed
    expect(find.text('Test Child Widget'), findsOneWidget);

    // Verify that the progress indicator is displayed
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Verify that the modal barrier is displayed (the overlay)
    expect(find.byType(ModalBarrier), findsOneWidget);
  });

  testWidgets('OverlayAdaptiveProgressHub hides progress indicator when inAsyncCall is false', (WidgetTester tester) async {
    // Build the widget with inAsyncCall set to false
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: OverlayAdaptiveProgressHub(
            inAsyncCall: false,
            child: Text('Test Child Widget'),
          ),
        ),
      ),
    );

    // Verify that the child widget is displayed
    expect(find.text('Test Child Widget'), findsOneWidget);

    // Verify that the progress indicator is not displayed
    expect(find.byType(CircularProgressIndicator), findsNothing);

    // Verify that the modal barrier is not displayed
    expect(find.byType(ModalBarrier), findsNothing);
  });
}
