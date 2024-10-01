# OverlayAdaptiveProgressHub

A Flutter package that provides an adaptive modal progress HUD (Heads-Up Display) overlay, enabling developers to easily indicate loading states within their applications. The package offers extensive customization options for opacity, color, progress indicators, offsets, and background blur effects, making it a flexible solution for Flutter apps.

## Features

- **Customizable Overlay:** Adjust the opacity, color, and blur intensity of the modal overlay.
- **Adaptive Progress Indicators:** Use various progress indicators, including the default Android spinner or custom widgets.
- **Position Control:** Set an offset to position the progress indicator anywhere on the screen.
- **Dismissible Overlay:** Optionally allow users to dismiss the overlay by tapping on it.
- **Responsive Design:** The overlay adjusts automatically to different screen sizes and orientations.
  
## Installation

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  overlay_adaptive_progress_hub: ^0.0.2
```

Next, import the package

```
import 'package:modal_progress_hud/modal_progress_hud.dart';
```

```
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Overlay Adaptive Progress Hub Example',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoading = false;

  void _toggleLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return OverlayAdaptiveProgressHub(
      inAsyncCall: _isLoading,
      opacity: 0.5,
      color: Colors.black,
      progressIndicator: CircularProgressIndicator(),
      dismissible: true,
      child: Scaffold(
        appBar: AppBar(title: Text('Overlay Adaptive Progress Hub Example')),
        body: Center(
          child: ElevatedButton(
            onPressed: _toggleLoading,
            child: Text(_isLoading ? 'Stop Loading' : 'Start Loading'),
          ),
        ),
      ),
    );
  }
}
```