import 'package:augmented_reality_plugin/augmented_reality_plugin.dart';
import 'package:flutter/material.dart';

class ArVirtualView extends StatefulWidget {
  ArVirtualView({super.key, this.clickedImage});

  String? clickedImage = "";

  @override
  State<ArVirtualView> createState() => _ArVirtualViewState();
}

class _ArVirtualViewState extends State<ArVirtualView> {
  @override
  Widget build(BuildContext context) {
    return AugmentedRealityPlugin(widget.clickedImage!.toString());
  }
}
