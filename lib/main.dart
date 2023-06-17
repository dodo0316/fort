import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '운세 앱',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _dateController = TextEditingController();
  String _fortuneResult = '';
  String _fortuneImage = 'assets/fortune_cookie.gif';

  List<String> _fortuneList = [
    '산다는것 그것은 치열한 전투이다',
    '하루에 3시간을 걸으면 7년후에 지구를 한바퀴 돌 수 있다',
    '언제나 현재에 집중할 수 있다면 행복할 것이다',
    '삶이 있는 한 희망은 있다',
    '아니면 행복이 무엇인지 절대 모를 것이다',
    '신은 용기있는 자를 결코 버리지 않는다',
    '피할 수 없으면 즐겨라',
    '행복한 삶을 살기 위해 필요한 것은 거의 없다',
    // 추가적인 운세 문구를 원하는 만큼 추가할 수 있습니다.
  ];

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  void _showFortune() {
    String inputDate = _dateController.text;

    // 생년월일을 이용하여 운세를 계산하는 로직을 작성합니다.
    // 여기에서는 운세 문구를 랜덤으로 선택합니다.
    Random random = Random();
    int index = random.nextInt(_fortuneList.length);
    String fortune = _fortuneList[index];

    setState(() {
      _fortuneResult = fortune;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('운세 앱'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '생년월일을 입력하세요:',
              style: TextStyle(fontSize: 18.0),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0),
              child: TextField(
                controller: _dateController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'YYYYMMDD',
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _showFortune,
              child: Text('운세 보기'),
            ),
            SizedBox(height: 20.0),
            if (_fortuneResult.isNotEmpty)
              Column(
                children: [
                  Image.asset(
                    _fortuneImage,
                    width: 200.0,
                    height: 200.0,
                  ),
                  Text(
                    '운세 결과: $_fortuneResult',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),

          ],
        ),
      ),
    );
  }
}