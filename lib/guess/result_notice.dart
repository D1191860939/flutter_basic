import 'package:flutter/material.dart';

class ResultNotice extends StatefulWidget {
  final Color color;
  final String info;

  const ResultNotice({super.key, required this.color, required this.info});

  @override
  State createState() => _ResultNoticeState();
}

class _ResultNoticeState extends State<ResultNotice>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(microseconds: 1000));
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ResultNotice oldWidget) {
    animationController.forward(from: 0);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      alignment: Alignment.center,
      color: widget.color,
      child: AnimatedBuilder(
        animation: animationController,
        builder: (_, child) => Text(
          widget.info,
          style: TextStyle(
              fontSize: 54 * (animationController.value),
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
    ));
  }
}
