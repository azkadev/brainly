# Brainly Library

## Install

```bash
flutter pub add brainly
```

```bash
dart pub add brainly
```
## Quickstart

- Server Side

```dart
import 'dart:convert';
import 'package:brainly/brainly.dart';
void main(List<String> arguments) async {
  BrainlyResult brainly = await Brainly().search("pengertian nkri", count_result: 1);
  print(brainly.getJsonResult);
}
```