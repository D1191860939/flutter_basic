import 'package:flutter/material.dart';

enum StopWatchType {
  none,
  stopped,
  running,
}

class ButtonTools extends StatelessWidget {
  final StopWatchType state;
  final VoidCallback? onReset;
  final VoidCallback? onRecord;
  final VoidCallback? toggle;

  const ButtonTools(
      {super.key,
      required this.state,
      this.onReset,
      this.onRecord,
      this.toggle});

  @override
  Widget build(BuildContext context) {
    bool running = state == StopWatchType.running;
    bool stopped = state == StopWatchType.stopped;
    Color activeColor = const Color(0xff3A3A3A);
    Color inactiveColor = const Color(0xffDDDDDD);
    Color resetColor = stopped ? activeColor : inactiveColor;
    Color flagColor = running ? activeColor : inactiveColor;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 50,
        children: [
          if (state != StopWatchType.none)
            GestureDetector(
              onTap: stopped ? onReset : null,
              child: Icon(
                Icons.refresh,
                size: 28,
                color: resetColor,
              ),
            ),
          FloatingActionButton(
              shape: const CircleBorder(),
              onPressed: toggle,
              backgroundColor: Colors.green,
              child: running
                  ? const Icon(
                      Icons.stop,
                      color: Colors.white,
                    )
                  : const Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    )),
          if (state != StopWatchType.none)
            GestureDetector(
              onTap: running ? onRecord : null,
              child: Icon(Icons.flag_outlined, size: 28, color: flagColor),
            )
        ],
      ),
    );
  }
}
