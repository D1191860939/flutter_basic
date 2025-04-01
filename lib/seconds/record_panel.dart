import 'package:flutter/material.dart';
import 'package:hello_flutter/seconds/time_record.dart';

class RecordPanel extends StatelessWidget {
  final List<TimeRecord> records;

  const RecordPanel({super.key, required this.records});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: DefaultTextStyle(
            style:
                const TextStyle(fontFamily: "IBMPlexMono", color: Colors.black),
            child: ListView.builder(
                itemCount: records.length, itemBuilder: _buildItem)));
  }

  Widget _buildItem(BuildContext context, int index) {
    const EdgeInsets itemPadding =
        EdgeInsets.symmetric(horizontal: 20, vertical: 4);
    int reverseIndex = (records.length - 1) - index;
    bool lightIndex = reverseIndex == records.length - 1;
    Color indexColor = lightIndex ? Colors.green : Colors.black;
    TimeRecord record = records[reverseIndex];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: itemPadding,
          child: Text("$reverseIndex".padLeft(2, "0"), style: TextStyle(color: indexColor),),
        ),
        Text(_durationToString(record.record)),
        const Spacer(),
        Padding(
          padding: itemPadding,
          child: Text("+${_durationToString(record.addition)}"),
        )
      ],
    );
  }

  String _durationToString(Duration duration) {
    int minus = duration.inMinutes % 60;
    int second = duration.inSeconds % 60;
    int milliseconds = duration.inMilliseconds % 1000;
    String commonStr =
        '${minus.toString().padLeft(2, "0")}:${second.toString().padLeft(2, "0")}';
    String highlightStr = ".${(milliseconds ~/ 10).toString().padLeft(2, "0")}";
    return '$commonStr$highlightStr';
  }
}
