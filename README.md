# Customizable Inputs

Customizable Inputs is a versatile Flutter library that provides customizable input fields to fit a variety of use cases. Designed with flexibility and ease of use in mind, it enables developers to create input forms tailored to their application's unique requirements.

## Features

- Feature 1: Floating Text Field.
- Feature 2: Floating Password Input Field

## Getting Started

To use this package, add it to your `pubspec.yaml` file:

```yaml
dependencies:
  customizable_inputs: ^1.0.2
```
## Example Usage

Here's an example of how to use the `FloatingPasswordTextField` widget:

```dart
import 'package:flutter/material.dart';
import 'package:customizable_inputs/customizable_inputs.dart';

class ExampleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Example Usage')),
      body: Center(
        child: FloatingPasswordTextField(
          isEnabled: true,
          labelText: "Password",
          height: 40,
          width: 300,
          backGroundColor: Colors.amber,
          focusedBorderColor: Colors.cyan,
          onChanged: (value) {
            print("Password input: $value");
          },
          iconColor: Colors.green,
        ),
      ),
    );
  }
}
```
## FloatingPasswordTextField Properties
- isEnabled: Enable or disable the input field (bool).

- labelText: Set the floating label text (String).

- height: Set the height of the input field (double).

- width: Set the width of the input field (double).

- backGroundColor: Set the background color of the input field (Color).

- focusedBorderColor: Set the border color when focused (Color).

- onChanged: Callback that receives the current input value (Function(String)).

- iconColor: Set the color of the visibility toggle icon (Color).