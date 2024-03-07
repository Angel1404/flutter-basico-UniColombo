import 'package:flutter/material.dart';

loadingDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => const SimpleDialog(
      children: [CircularProgressIndicator.adaptive()],
    ),
  );
}
