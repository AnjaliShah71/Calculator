import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Cal();
}

class Cal extends State<Calculator> {
  TextEditingController numcontroller1 = TextEditingController();
  TextEditingController numcontroller2 = TextEditingController();
  TextEditingController resultcontroller = TextEditingController();

  var selectOpcontroller;
  var result;

  // Dark mode variable
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          isDarkMode ? const Color(0xff121212) : Colors.white,

      // AppBar
      appBar: AppBar(
        title: const Text(
          "Calculator",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor:
            isDarkMode ? const Color(0xff1E1E1E) : const Color(0xff356AA0),
        foregroundColor: Colors.white,

        actions: [
          // Sun / Moon Icon
          Icon(
            isDarkMode ? Icons.dark_mode : Icons.light_mode,
          ),

          // Switch
          Switch(
            value: isDarkMode,
            onChanged: (value) {
              setState(() {
                isDarkMode = value;
              });
            },
            activeColor: Colors.white,
          ),

          const SizedBox(width: 10),
        ],
      ),

      body: Center(
        child: Container(
          height: 550,
          width: 500,

          decoration: BoxDecoration(
            border: Border.all(
              color: isDarkMode ? Colors.white54 : Colors.black,
              width: 2,
            ),

            borderRadius: BorderRadius.circular(30),

            gradient: LinearGradient(
              colors: isDarkMode
                  ? [
                      const Color(0xff303030),
                      const Color(0xff171717),
                    ]
                  : [
                      const Color(0xff5FB1C8),
                      const Color(0xff356AA0),
                      const Color(0xff356AA0),
                    ],

              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),

          child: Column(
            children: [

              // Number 1
              Padding(
                padding: const EdgeInsets.all(30),
                child: TextField(
                  controller: numcontroller1,

                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),

                  keyboardType: TextInputType.number,

                  decoration: InputDecoration(
                    hintText: "Enter a number 1",

                    hintStyle: TextStyle(
                      color: isDarkMode
                          ? Colors.white70
                          : Colors.white,
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),

              // Number 2
              Padding(
                padding: const EdgeInsets.all(30),
                child: TextField(
                  controller: numcontroller2,

                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),

                  keyboardType: TextInputType.number,

                  decoration: InputDecoration(
                    hintText: "Enter a number 2",

                    hintStyle: TextStyle(
                      color: isDarkMode
                          ? Colors.white70
                          : Colors.white,
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),

              // Operators
              Padding(
                padding: const EdgeInsets.all(30),

                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,

                  children: [

                    // +
                    operatorButton("+", 1),

                    // -
                    operatorButton("-", 2),

                    // *
                    operatorButton("*", 3),

                    // /
                    operatorButton("/", 4),

                    // %
                    operatorButton("%", 5),
                  ],
                ),
              ),

              // Equal button
              Padding(
                padding: const EdgeInsets.all(10),

                child: SizedBox(
                  width: 80,
                  height: 50,

                  child: ElevatedButton(
                    onPressed: () {
                      sum();
                    },

                    child: const Text(
                      "=",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              // Result
              Padding(
                padding: const EdgeInsets.all(30),

                child: TextField(
                  controller: resultcontroller,

                  readOnly: true,

                  style: TextStyle(
                    color: isDarkMode
                        ? Colors.white
                        : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),

                  decoration: InputDecoration(
                    hintText: "Calculation is:",

                    hintStyle: TextStyle(
                      color: isDarkMode
                          ? Colors.white70
                          : Colors.white,
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
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

  // Operator button
  Widget operatorButton(String text, int operation) {
    return SizedBox(
      height: 60,
      width: 60,

      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectOpcontroller = operation;
          });
        },

        child: Text(
          text,
          style: const TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // Calculation
  void sum() {
    int num1 = int.parse(numcontroller1.text);
    int num2 = int.parse(numcontroller2.text);

    if (selectOpcontroller == 1) {
      result = num1 + num2;
    }

    else if (selectOpcontroller == 2) {
      result = num1 - num2;
    }

    else if (selectOpcontroller == 3) {
      result = num1 * num2;
    }

    else if (selectOpcontroller == 4) {
      result = num1 / num2;
    }

    else if (selectOpcontroller == 5) {
      result = num1 % num2;
    }

    resultcontroller.text = result.toString();

    setState(() {});

    print("Result is: $result");
  }

  @override
  void dispose() {
    numcontroller1.dispose();
    numcontroller2.dispose();
    resultcontroller.dispose();

    super.dispose();
  }
}
