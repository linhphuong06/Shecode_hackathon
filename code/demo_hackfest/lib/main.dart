import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter FastAPI Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _textInputController = TextEditingController();
  String _prediction = "";

  @override
  void initState() {
    super.initState();
    _textInputController.addListener(_getPredictionAutomatically);
  }

  void _getPredictionAutomatically() {
    String inputData = _textInputController.text;
    // Thực hiện gửi yêu cầu HTTP ở đây với inputData
    // Sử dụng http.post hoặc phương thức gửi yêu cầu HTTP phù hợp

    // Sau khi nhận kết quả từ máy chủ, cập nhật _prediction
    // Ví dụ:
    // setState(() {
    //   _prediction = "Kết quả từ máy chủ: $data";
    // });
  }

  void _submitPrediction() {
    // Gọi hàm _getPredictionAutomatically khi người dùng nhấn Enter
    _getPredictionAutomatically();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FastAPI Prediction App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _textInputController,
              onChanged: (text) {
                // Gọi hàm _getPredictionAutomatically mỗi khi dữ liệu thay đổi
                _getPredictionAutomatically();
              },
              onSubmitted: (text) {
                // Gọi hàm _submitPrediction khi người dùng nhấn Enter
                _submitPrediction();
              },
              decoration: InputDecoration(
                labelText: 'Input Data',
                labelStyle: TextStyle(fontSize: 16),
                contentPadding: EdgeInsets.all(10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(width: 1, color: Colors.grey),
                ),
              ),
              style: TextStyle(fontSize: 14),
            ),
            Text('Prediction: $_prediction'),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textInputController.dispose();
    super.dispose();
  }
}
