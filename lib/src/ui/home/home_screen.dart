import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rcalculate/src/utils/algorithm.dart';
import 'package:rcalculate/src/widgets/main_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> key = GlobalKey();
  List<List<String>> answer = [[]];

  bool _isChanged = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: AppBar(
        elevation: 0,
        backgroundColor:
            _isChanged == false ? Colors.redAccent : Colors.deepPurpleAccent,
        leading: Row(
          children: [
            const SizedBox(width: 28),
            GestureDetector(
              onTap: () => key.currentState!.openDrawer(),
              child: const Icon(
                Icons.menu,
                color: Colors.white,
                size: 28,
              ),
            ),
          ],
        ),
      ),
      drawerEnableOpenDragGesture: false,
      drawer: Drawer(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width * 0.7,
          color: _isChanged == false ? Colors.red : Colors.deepPurpleAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 64),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 24),
                  const Expanded(
                    child: Text(
                      'Dark Theme',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    _isChanged == false?'off':'on',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  Switch(
                    autofocus: false,
                    activeColor: Colors.black87,
                    value: _isChanged,
                    onChanged: (value) {
                      setState(() {
                        _isChanged = value;
                      });
                    },
                  ),
                  const SizedBox(width: 24),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              _isChanged == false ? Colors.pink : Colors.deepPurpleAccent,
              _isChanged == false ? Colors.amber : Colors.black87
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.zero,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  color: Colors.white,
                ),
                height: 225,
                width: 390,
                child: ListView.builder(
                  itemCount: answer.length,
                  reverse: true,
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 20,
                  ),
                  itemBuilder: (context, i) {
                    return SizedBox(
                      height: 36,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ListView.builder(
                            itemCount: answer[i].length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Text(
                                answer[i][index],
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: i == 0
                                      ? Colors.red
                                      : i == 1
                                          ? Colors.blue
                                          : i == 2
                                              ? Colors.amber
                                              : Colors.grey,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        answer = [[]];
                      });
                    },
                    child: MainButton(
                      title: 'AC',
                      onChanged: _isChanged,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        answer.first.removeLast();
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        border: Border.all(
                          color: _isChanged == false
                              ? Colors.amber
                              : Colors.deepPurpleAccent,
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            _isChanged == false
                                ? Colors.pink
                                : Colors.deepPurpleAccent,
                            _isChanged == false ? Colors.amber : Colors.black87
                          ],
                        ),
                      ),
                      height: 60,
                      width: (MediaQuery.of(context).size.width - 88) / 3,
                      child: const Center(
                        child: Icon(
                          Icons.backspace_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        answer.first.add('I');
                      });
                    },
                    child: MainButton(
                      title: 'I',
                      onChanged: _isChanged,
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        answer.first.add('V');
                      });
                    },
                    child: MainButton(
                      title: 'V',
                      onChanged: _isChanged,
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        answer.first.add('-');
                      });
                    },
                    child: MainButton(
                      title: '-',
                      onChanged: _isChanged,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        answer.first.add('X');
                      });
                    },
                    child: MainButton(
                      title: 'X',
                      onChanged: _isChanged,
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        answer.first.add('C');
                      });
                    },
                    child: MainButton(
                      title: 'C',
                      onChanged: _isChanged,
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        answer.first.add('/');
                      });
                    },
                    child: MainButton(
                      title: '/',
                      onChanged: _isChanged,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        answer.first.add('D');
                      });
                    },
                    child: MainButton(
                      title: 'D',
                      onChanged: _isChanged,
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        answer.first.add('M');
                      });
                    },
                    child: MainButton(
                      title: 'M',
                      onChanged: _isChanged,
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      answer.first.add('*');
                    },
                    child: MainButton(
                      title: "*",
                      onChanged: _isChanged,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        answer.first.add('L');
                      });
                    },
                    child: MainButton(
                      title: 'L',
                      onChanged: _isChanged,
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        answer.first.add('+');
                      });
                    },
                    child: MainButton(
                      title: '+',
                      onChanged: _isChanged,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              GestureDetector(
                onTap: () {
                  setState(() {
                    answer.insert(0, [calculatorAlgo(answer.first.join())]);
                    answer.insert(0, []);
                  });
                },
                child: Container(
                  height: 56,
                  width: 224,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        _isChanged == false
                            ? Colors.pink
                            : Colors.deepPurpleAccent,
                        _isChanged == false ? Colors.amber : Colors.black87
                      ],
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'ANSWER',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
