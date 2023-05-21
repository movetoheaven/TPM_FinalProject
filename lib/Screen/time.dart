import 'dart:async';

import 'package:flutter/material.dart';

class TimeConverter extends StatefulWidget {
  const TimeConverter({Key? key}) : super(key: key);

  @override
  _TimeConverterState createState() => _TimeConverterState();
}

class _TimeConverterState extends State<TimeConverter> {
  late String _input = 'WIB';
  late String _output = 'WIB';
  DateTime _result = DateTime.now();
  Timer _timer = Timer.periodic(const Duration(seconds: 1), (timer) {});

  @override
  void initState() {
    super.initState();
    _input = 'WIB';
    _output = 'WIB';
    _result = DateTime.now();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _getTime();
    });
  }

  void _getTime() {
    DateTime result = DateTime.now().toUtc();
    DateTime localTime = result.add(_getDuration());
    
    setState(() {
      _result = localTime;
    });
  }

  Duration _getDuration() {
    if(_output == 'WIB'){
      return Duration(hours: 7);
    }

    if(_output == 'WITA'){
      return Duration(hours: 8);
    }

    if(_output == 'WIT'){
      return Duration(hours: 9);
    }

    if(_output == 'KST'){
      return Duration(hours: 10);
    }

    return Duration(hours: 0);
  }

  void _onInputChanged(String? value) {
    setState(() {
      _input = value ?? 'WIB';
    });
  }

  void _onOutputChanged(String? value) {
    setState(() {
      _output = value ?? 'WIB';
    });
  }

  void _convert() {
    setState(() {
      _output = _output;
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget _buildInput() {
    return Center(
      child: Column(
        children: [Text('WIB')],
      ),
    );
  }

  Widget _buildOutput() {
    return DropdownButtonFormField<String>(
      value: _output,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Convert to',
      ),
      onChanged: _onOutputChanged,
      items: const [
        DropdownMenuItem(
          value: 'WIB',
          child: Text('WIB'),
        ),
        DropdownMenuItem(
          value: 'WITA',
          child: Text('WITA'),
        ),
        DropdownMenuItem(
          value: 'WIT',
          child: Text('WIT'),
        ),
        DropdownMenuItem(
          value: 'UTC',
          child: Text('UTC'),
        ),
        DropdownMenuItem(
          value: 'KST',
          child: Text('KST'),
        )
      ],
    );
  }

  Widget _buildResult() {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(seconds: 1), (i) => i),
      initialData: _result,
      builder: (context, snapshot) {
        return Text(
          '${_result.hour}:${_result.minute}:${_result.second}',
          style: const TextStyle(fontSize: 30),
        );
      },
    );
  }

  // Widget _buildConvertButton() {
  //   return ElevatedButton(
  //     onPressed: _convert,
  //     child: const Text('Convert'),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Time Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildInput(),
            const SizedBox(
              height: 20,
            ),
            _buildOutput(),
            const SizedBox(
              height: 20,
            ),
            // _buildConvertButton(),
            const SizedBox(
              height: 20,
            ),
            _buildResult(),
          ],
        ),
      ),
    );
  }
}
