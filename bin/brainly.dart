import 'dart:convert';

import 'package:brainly/brainly.dart';

void main(List<String> arguments) async {
  BrainlyResult brainly = await Brainly().search("pengertian", count_result: 1);

  print(json.encode(brainly.getJsonResult));
}
