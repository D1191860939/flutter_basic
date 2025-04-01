import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hello_flutter/seconds/button_tools.dart';
import 'package:hello_flutter/seconds/record_panel.dart';
import 'package:hello_flutter/seconds/stop_watch_widget.dart';
import 'package:hello_flutter/seconds/time_record.dart';

class SecondsTabPage extends StatefulWidget {
  const SecondsTabPage({super.key});

  @override
  State createState() {
    return _SecondsTabPageState();
  }
}

class _SecondsTabPageState extends State<SecondsTabPage> {
  StopWatchType _type = StopWatchType.none;
  Duration _duration = Duration(seconds: 0);
  late Ticker _ticker;

  Duration dt = Duration.zero;
  Duration lastDuration = Duration.zero;

  List<TimeRecord> _records = [];

  @override
  void initState() {
    super.initState();
    _ticker = Ticker(_onTick);
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("电子秒表"),
        actions: _buildActions(),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildStopWatchPanel(context),
            _buildRecordPanel(context),
            _buildTools(),
          ],
        ),
      ),
    );
  }

  void _onTick(Duration elapsed) {
    setState(() {
      dt = elapsed - lastDuration;
      _duration += dt;
      lastDuration = elapsed;
    });
  }

  Widget _buildStopWatchPanel(BuildContext context) {
    double radius = MediaQuery.of(context).size.shortestSide / 2 * 0.75;
    return StopWatchWidget(
      duration: _duration,
      radius: radius,
      themeColor: Colors.green,
    );
  }

  Widget _buildRecordPanel(BuildContext context) {
    return Expanded(child: RecordPanel(records: _records));
  }

  Widget _buildTools() {
    return ButtonTools(
      state: _type,
      onRecord: _onRecode,
      onReset: _onReset,
      toggle: _toggle,
    );
  }

  void _onReset() {
    lastDuration = Duration.zero;
    setState(() {
      _type = StopWatchType.none;
      _duration = Duration.zero;
      _records.clear();
    });
  }

  void _onRecode() {
    setState(() {
      Duration current = _duration;
      Duration addition = _duration;

      if (_records.isNotEmpty) {
        addition = current - _records.last.record;
      }

      _records.add(TimeRecord(record: _duration, addition: addition));
    });
  }

  void _toggle() {
    bool running = _type == StopWatchType.running;
    if (running) {
      _ticker.stop();
      lastDuration = Duration.zero;
    } else {
      _ticker.start();
    }
    setState(() {
      _type = running ? StopWatchType.stopped : StopWatchType.running;
    });
  }

  List<Widget> _buildActions() {
    return [
      PopupMenuButton(
        itemBuilder: _buildItem,
        onSelected: _onSelectItem,
        icon: const Icon(Icons.more_vert_outlined),
        color: const Color(0xff262626),
        position: PopupMenuPosition.under,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      )
    ];
  }

  List<PopupMenuEntry<String>> _buildItem(BuildContext context) {
    return [
      const PopupMenuItem(
          value: "设置",
          child: Center(
            child: Text(
              "设置",
              style: TextStyle(color: Colors.white),
            ),
          ))
    ];
  }

  void _onSelectItem(String value) {}
}
