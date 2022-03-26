import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String ts_txt = "";

  TextStyle maxstyle = TextStyle();

  TextStyle red_style =
      TextStyle(color: Colors.red, fontSize: 50, fontWeight: FontWeight.bold);

  TextStyle green_style =
      TextStyle(color: Colors.green, fontSize: 50, fontWeight: FontWeight.bold);

  TextEditingController input_text = TextEditingController();

  TextStyle yellow_style = TextStyle(
      color: Colors.yellow.shade700, fontSize: 50, fontWeight: FontWeight.bold);

  void _incrementCounter() {
    setState(() {
      _counter += 10;
      ts_txt = "";
    });
  }

  void tsBTN() {
    setState(() {
      // _counter = 0;
      ts_txt = input_text.text;
      setState(() {
        input_text.clear();
        try {
          int temp = int.parse(input_text.text);
          print(temp);
          _counter = temp;
        } on Exception catch (_) {
          _counter = 0;
        } finally {
          maxstyle = yellow_style;
        }
      });
    });
  }

  void lp() {
    print("MAXMAXMAX");
    setState(() {
      ts_txt = "LONGGGGGGGGGGGGGGGGGGGGGGG";
    });
  }

  int map_number(int number) {
    if (number > 10 || number < 0) {
      number = 0;
    }
    return number;
  }

  void upcount() {
    setState(() {
      _counter++;
      _counter = map_number(_counter);
      if (_counter >= 10) {
        maxstyle = green_style;
      } else {
        maxstyle = red_style;
      }
    });
  }

  void downcount() {
    setState(() {
      _counter--;
      _counter = map_number(_counter);
      if (_counter >= 10) {
        maxstyle = green_style;
      } else {
        maxstyle = red_style;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(179, 124, 255, 168),
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                  controller: input_text,
                  // keyboardType: TextInputType.number,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.red, onPrimary: Colors.yellow),
                onPressed: () {
                  downcount();
                },
                child: const Text("ลบออก"),
              ),
              Text(
                '$_counter',
                // style: Theme.of(context).textTheme.headline4,
                style: maxstyle,
              ),
              OutlinedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                      StadiumBorder()),
                  side: MaterialStateProperty.resolveWith<BorderSide>(
                      (Set<MaterialState> states) {
                    final Color color = states.contains(MaterialState.pressed)
                        ? const Color.fromARGB(255, 22, 116, 192)
                        : const Color.fromARGB(255, 91, 127, 247);
                    return BorderSide(color: color, width: 2);
                  }),
                ),
                onPressed: () {
                  tsBTN();
                },
                child: const Text('TS BTN'),
              ),
              ElevatedButton(
                  onPressed: () {
                    upcount();
                  },
                  child: const Text("เพิ่มจำนวน")),
              Text("$ts_txt"),
              TextButton(
                onLongPress: () {
                  lp();
                },
                onPressed: () {},
                child: const Text('FlatButton'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      downcount();
                    },
                    child: const Text("-"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      upcount();
                    },
                    child: const Text("+"),
                  )
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _counter = _counter;
                    });
                  },
                  child: const Text("RESETTTTT22222")),
              ElevatedButton(onPressed: () {}, child: const Text("NEXT"))
            ],
          ),
        ),
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     _incrementCounter();
      //   },
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
