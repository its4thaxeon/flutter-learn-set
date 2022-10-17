import "package:flutter/material.dart";

class IndicatorLearn extends StatelessWidget {
  const IndicatorLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [CenterCircularRedProgress()],
      ),
      body: const LinearProgressIndicator(color: Colors.blue),
    );
  }
}

class CenterCircularRedProgress extends StatelessWidget {
  const CenterCircularRedProgress({
    Key? key,
  }) : super(key: key);
  final redColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      color: redColor,
      strokeWidth: 8,
      backgroundColor: Colors.white,
    ));
  }
}
