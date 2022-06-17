import 'package:demo_task/controller/game_state.dart';
import 'package:demo_task/model/image_model.dart';
import 'package:demo_task/views/custom_helper/responsive.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<GameScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<GameScreen> {
  List<ImageModel> images = [
    ImageModel(
        imageUrl: "assets/flutter.png", imageName: "flutter", specificCoins: 0),
    ImageModel(
        imageUrl: "assets/dummy1.png", imageName: "random1", specificCoins: 0),
    ImageModel(
        imageUrl: "assets/dummy2.png", imageName: "random2", specificCoins: 0)
  ];

  GameState gamState = GameState();

  // void _incrementCounter() {
  //   setState(() {
  //     gamState.counter++;
  //   });
  // }

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
                      if (gamState.showKey) {
                        // images.shuffle();
                        gamState.showKey = false;
                        for (int i = 0; i < images.length; i++) {
                          if (images[i].imageName == "flutter") {
                            gamState.flutterInWhichIndex = i;
                          }
                        }
                      } else {
                        gamState.showKey = true;
                      }
                    });
                  },
                  child:
                      gamState.showKey ? Text("Show Key") : Text("Hide Key")),
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
              !gamState.showKey
                  ? Container(
                      color: Colors.black,
                      child: Text(
                        'SECRET:(The Flutter is at card :) ${gamState.flutterInWhichIndex}',
                        style:
                            const TextStyle(fontSize: 20, color: Colors.amber),
                      ),
                    )
                  : Container(),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Balance :${gamState.counter} coins(Debts : ${gamState.deptCount} coins)',
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
                                    image: gamState.isPlayButton
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
                                        if (gamState.isPlayButton) {
                                          if (images[index].specificCoins !=
                                              0) {
                                            if (images[index].imageName ==
                                                "flutter") {
                                              setState(() {
                                                if (gamState.counter > 0) {
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
                                                    gamState.flutterCoins =
                                                        images[index]
                                                            .specificCoins;
                                                    gamState.counter++;
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
                                                if (gamState.counter > 0) {
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
                                                    gamState.random1Coins =
                                                        images[index]
                                                            .specificCoins;
                                                    gamState.counter++;
                                                  }
                                                }
                                              });
                                            } else {
                                              setState(() {
                                                if (gamState.counter > 0) {
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
                                                    gamState.random2Coins =
                                                        images[index]
                                                            .specificCoins;
                                                    gamState.counter++;
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
                                                  gamState.isPlayButton ==
                                                      false ||
                                                  gamState.counter == 0
                                              ? Colors.white
                                              : Colors.black)),
                                  Text(
                                    '${images[index].specificCoins}',
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        if (gamState.isPlayButton) {
                                          if (images[index].imageName ==
                                              "flutter") {
                                            setState(() {
                                              if (gamState.counter > 0) {
                                                if (images[index]
                                                        .specificCoins <
                                                    3) {
                                                  //here will be 4 later
                                                  images[index].specificCoins =
                                                      images[index]
                                                              .specificCoins +
                                                          1;
                                                  gamState.flutterCoins =
                                                      images[index]
                                                          .specificCoins;
                                                  print("hello");
                                                  gamState
                                                      .counter--; //= _counter * 3;
                                                }

                                                // totalCoins = totalCoins;

                                              }
                                            });
                                          } else if (images[index].imageName ==
                                              "random1") {
                                            setState(() {
                                              if (gamState.counter > 0) {
                                                if (images[index]
                                                        .specificCoins <
                                                    3) {
                                                  images[index].specificCoins =
                                                      images[index]
                                                              .specificCoins +
                                                          1;
                                                  gamState.random1Coins =
                                                      images[index]
                                                          .specificCoins;
                                                  gamState.counter--;
                                                }
                                              }
                                            });
                                          } else {
                                            setState(() {
                                              if (gamState.counter > 0) {
                                                if (images[index]
                                                        .specificCoins <
                                                    3) {
                                                  images[index].specificCoins =
                                                      images[index]
                                                              .specificCoins +
                                                          1;
                                                  gamState.random2Coins =
                                                      images[index]
                                                          .specificCoins;
                                                  gamState.counter--;
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
                                                      gamState.isPlayButton ==
                                                          false ||
                                                      gamState.counter ==
                                                          0 //here will be 4 later
                                                  ? Colors.white
                                                  : Colors.black
                                              : images[index].specificCoins ==
                                                          3 ||
                                                      gamState.isPlayButton ==
                                                          false ||
                                                      gamState.counter == 0
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
              gamState.isPlayButton
                  ? GestureDetector(
                      onTap: () {
                        if (gamState.flutterCoins != 0 ||
                            (gamState.random1Coins != 0 ||
                                gamState.random2Coins != 0)) {
                          setState(() {
                            print("hello");
                            gamState.result = gamState.flutterCoins * 3;
                            gamState.counter =
                                gamState.counter + gamState.result;
                            gamState.isPlayButton = false;
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
                          color: gamState.flutterCoins != 0 ||
                                  (gamState.random1Coins != 0 ||
                                      gamState.random2Coins != 0)
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
                          gamState.showKey = true;
                          images.shuffle();
                          for (int i = 0; i < images.length; i++) {
                            images[i].specificCoins = 0;
                          }
                          gamState.flutterCoins = 0;
                          gamState.random1Coins = 0;
                          gamState.random2Coins = 0;
                          gamState.isPlayButton = true;
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
              gamState.isPlayButton
                  ? Container()
                  : Text(
                      " You won : ${gamState.flutterCoins} (bet) x 3 = ${gamState.result} coin(s)",
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
              const SizedBox(
                height: 5,
              ),
              gamState.isPlayButton
                  ? Container()
                  : gamState.counter == 0
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
              gamState.isPlayButton
                  ? Container()
                  : gamState.counter == 0
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              gamState.counter = gamState.counter + 8;
                              gamState.deptCount = gamState.deptCount + 8;
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
