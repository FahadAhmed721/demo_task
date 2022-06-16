import 'package:demo_task/image_model.dart';
import 'package:demo_task/responsive.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application. 03405373733
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Where is the Flutter?'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 8;
  int deptCount = 0;
  int totalCoins = 10;
  int result = 0;
  int flutterCoins = 0;
  int flutterInWhichIndex = 0;
  int random1Coins = 0;
  int random2Coins = 0;
  bool showKey = true;
  bool isPlayButton = true;
  List<ImageModel> images = [
    ImageModel(
        imageUrl: "assets/flutter.png", imageName: "flutter", specificCoins: 0),
    ImageModel(
        imageUrl: "assets/dummy1.png", imageName: "random1", specificCoins: 0),
    ImageModel(
        imageUrl: "assets/dummy2.png", imageName: "random2", specificCoins: 0)
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {
                    setState(() {
                      if (showKey) {
                        // images.shuffle();
                        showKey = false;
                        for (int i = 0; i < images.length; i++) {
                          if (images[i].imageName == "flutter") {
                            flutterInWhichIndex = i;
                          }
                        }
                      } else {
                        showKey = true;
                      }
                    });
                  },
                  child: showKey ? Text("Show Key") : Text("Hide Key")),
            ],
          ),
          SizedBox(
            width: 20,
          ),
        ],
        centerTitle: false,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              !showKey
                  ? Container(
                      color: Colors.black,
                      child: Text(
                        'SECRET:(The Flutter is at card :) $flutterInWhichIndex',
                        style:
                            const TextStyle(fontSize: 20, color: Colors.amber),
                      ),
                    )
                  : Container(),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Balance :$_counter coins(Debts : $deptCount coins)',
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                // color: Colors.amber,
                height: ResponsiveWidget.isLargeScreen(context)
                    ? MediaQuery.of(context).size.height * 0.2
                    : MediaQuery.of(context).size.height * 0.33,
                width: ResponsiveWidget.isLargeScreen(context)
                    ? MediaQuery.of(context).size.width * 0.3
                    : MediaQuery.of(context).size.width - 20,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: 40),
                    itemCount: images.length,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Image.asset(
                            //   images[index].imageUrl,
                            //   // height: 150,
                            //   // width: 100,
                            //   scale: 6,
                            // ),
                            Container(
                              height: ResponsiveWidget.isLargeScreen(context)
                                  ? MediaQuery.of(context).size.height * 0.15
                                  : MediaQuery.of(context).size.height *
                                      0.2, // 150,
                              width: 90,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: isPlayButton
                                        ? Image.asset(
                                            "assets/cover.png",
                                            // fit: BoxFit.fill,
                                          ).image
                                        : Image.asset(
                                            images[index].imageUrl,
                                            // fit: BoxFit.fill,
                                          ).image,
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              height: 50,
                              width: 100,
                              color: Color.fromARGB(255, 103, 198, 242),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        if (isPlayButton) {
                                          if (images[index].specificCoins !=
                                              0) {
                                            if (images[index].imageName ==
                                                "flutter") {
                                              setState(() {
                                                if (_counter > 0) {
                                                  if (images[index]
                                                              .specificCoins <=
                                                          3 && //here will be 4 later
                                                      images[index]
                                                              .specificCoins >
                                                          0) {
                                                    images[index]
                                                            .specificCoins =
                                                        images[index]
                                                                .specificCoins -
                                                            1;
                                                    flutterCoins = images[index]
                                                        .specificCoins;
                                                    _counter++;
                                                    print("hello");
                                                    // _counter = _counter * 3;
                                                  }
                                                }

                                                // totalCoins = totalCoins;
                                              });
                                            } else if (images[index]
                                                    .imageName ==
                                                "random1") {
                                              setState(() {
                                                if (_counter > 0) {
                                                  if (images[index]
                                                              .specificCoins <=
                                                          3 &&
                                                      images[index]
                                                              .specificCoins >
                                                          0) {
                                                    images[index]
                                                            .specificCoins =
                                                        images[index]
                                                                .specificCoins -
                                                            1;
                                                    random1Coins = images[index]
                                                        .specificCoins;
                                                    _counter++;
                                                  }
                                                }
                                              });
                                            } else {
                                              setState(() {
                                                if (_counter > 0) {
                                                  if (images[index]
                                                              .specificCoins <=
                                                          3 &&
                                                      images[index]
                                                              .specificCoins >
                                                          0) {
                                                    images[index]
                                                            .specificCoins =
                                                        images[index]
                                                                .specificCoins -
                                                            1;
                                                    random2Coins = images[index]
                                                        .specificCoins;
                                                    _counter++;
                                                  }
                                                }
                                              });
                                            }
                                          }
                                        }
                                      },
                                      child: Icon(Icons.remove,
                                          color: images[index].specificCoins ==
                                                      0 ||
                                                  isPlayButton == false ||
                                                  _counter == 0
                                              ? Colors.white
                                              : Colors.black)),
                                  Text(
                                    '${images[index].specificCoins}',
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        if (isPlayButton) {
                                          if (images[index].imageName ==
                                              "flutter") {
                                            setState(() {
                                              if (_counter > 0) {
                                                if (images[index]
                                                        .specificCoins <
                                                    3) {
                                                  //here will be 4 later
                                                  images[index].specificCoins =
                                                      images[index]
                                                              .specificCoins +
                                                          1;
                                                  flutterCoins = images[index]
                                                      .specificCoins;
                                                  print("hello");
                                                  _counter--; //= _counter * 3;
                                                }

                                                // totalCoins = totalCoins;

                                              }
                                            });
                                          } else if (images[index].imageName ==
                                              "random1") {
                                            setState(() {
                                              if (_counter > 0) {
                                                if (images[index]
                                                        .specificCoins <
                                                    3) {
                                                  images[index].specificCoins =
                                                      images[index]
                                                              .specificCoins +
                                                          1;
                                                  random1Coins = images[index]
                                                      .specificCoins;
                                                  _counter--;
                                                }
                                              }
                                            });
                                          } else {
                                            setState(() {
                                              if (_counter > 0) {
                                                if (images[index]
                                                        .specificCoins <
                                                    3) {
                                                  images[index].specificCoins =
                                                      images[index]
                                                              .specificCoins +
                                                          1;
                                                  random2Coins = images[index]
                                                      .specificCoins;
                                                  _counter--;
                                                }
                                              }
                                            });
                                          }
                                        }
                                      },
                                      child: Icon(Icons.add,
                                          color: images[index].imageName ==
                                                  "flutter"
                                              ? images[index].specificCoins ==
                                                          3 ||
                                                      isPlayButton == false ||
                                                      _counter ==
                                                          0 //here will be 4 later
                                                  ? Colors.white
                                                  : Colors.black
                                              : images[index].specificCoins ==
                                                          3 ||
                                                      isPlayButton == false ||
                                                      _counter == 0
                                                  ? Colors.white
                                                  : Colors.black)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    })),
              ),
              isPlayButton
                  ? GestureDetector(
                      onTap: () {
                        if (flutterCoins != 0 ||
                            (random1Coins != 0 || random2Coins != 0)) {
                          setState(() {
                            print("hello");
                            result = flutterCoins * 3;
                            _counter = _counter + result;
                            isPlayButton = false;
                          });
                        } else {
                          setState(() {
                            //isDisablePlay = true;
                          });
                        }
                      },
                      child: Container(
                        height: 50,
                        width: 70,
                        decoration: BoxDecoration(
                          color: flutterCoins != 0 ||
                                  (random1Coins != 0 || random2Coins != 0)
                              ? Colors.blue
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Center(
                          child: Text(
                            "Play",
                            style:
                                TextStyle(fontSize: 20, color: Colors.yellow),
                          ),
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          showKey = true;
                          images.shuffle();
                          for (int i = 0; i < images.length; i++) {
                            images[i].specificCoins = 0;
                          }
                          flutterCoins = 0;
                          random1Coins = 0;
                          random2Coins = 0;
                          isPlayButton = true;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        // height: 50,
                        // width: 70,
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Text(
                          "New Game",
                          style: TextStyle(fontSize: 20, color: Colors.yellow),
                        ),
                      ),
                    ),
              const SizedBox(
                height: 30,
              ),
              isPlayButton
                  ? Container()
                  : Text(
                      " You won : $flutterCoins (bet) x 3 = $result coin(s)",
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
              const SizedBox(
                height: 5,
              ),
              isPlayButton
                  ? Container()
                  : _counter == 0
                      ? const Text(
                          "No balance. Loan to play",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        )
                      : Container(),
              const SizedBox(
                height: 5,
              ),
              isPlayButton
                  ? Container()
                  : _counter == 0
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              _counter = _counter + 8;
                              deptCount = deptCount + 8;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            // height: 50,
                            // width: 70,
                            constraints: BoxConstraints(
                                maxWidth: MediaQuery.of(context).size.width),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Text(
                              "Borrow 8 coins",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.yellow),
                            ),
                          ),
                        )
                      : Container()
            ],
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
