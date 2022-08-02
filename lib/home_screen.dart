import 'package:flutter/material.dart';
import 'method_channel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final SizedBox space = const SizedBox(height: 10);

  late String _summationResult;

  late FlutterMethodChannel _methodChannel;

  @override
  void initState() {
    _summationResult = '0';
    _methodChannel = FlutterMethodChannel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextFieldWidget(controller: _controller1, hint: 'Number 1'),
            space,
            TextFieldWidget(controller: _controller2, hint: 'Number 2'),
            space,
            TextFieldWidget(
                controller: _controller3, hint: 'Summation', readOnly: true),
            space,
            space,
            ElevatedButton(
              child: const Text('Calculate'),
              onPressed: () async {
                _summationResult = await _methodChannel.getSummation(
                    num1: int.tryParse(_controller1.text)!,
                    num2: int.tryParse(_controller2.text)!);
                setState(() {
                  _controller3.value = TextEditingValue(text: _summationResult);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {Key? key,
      required this.controller,
      required this.hint,
      this.readOnly = false})
      : super(key: key);
  final TextEditingController controller;
  final String hint;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: readOnly,
      decoration: InputDecoration(
        hintText: hint,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
