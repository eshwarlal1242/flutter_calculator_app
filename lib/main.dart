import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(


        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final TextEditingController num1 = TextEditingController();
  final TextEditingController num2 = TextEditingController();
  String result = '';


  void showResult(String operation) {

    setState(() {
      if(num1.text.isNotEmpty || num2.text.isNotEmpty) {
        try {
          double number1 = double.parse(num1.text);
          double number2 = double.parse(num2.text);

          // switch case for
    switch(operation){

      case '+':
        setState(() {
          result = '${number1 + number2}';
        });
        break;
      case '+':
      setState(() {
      result = '${number1 + number2}';
      });
      break;
      case '-':
      setState(() {
      result = '${number1 - number2}';
      });
      break;
      case '*':
      setState(() {
      result = '${number1 * number2}';
      });
      break;
      case '/':
      setState(() {
      result = '${number1 / number2}';
      });
      break;

    }

        }
        catch(e){


        }
      }
    });

  }
  void _clearResult() {
    setState(() {
      num1.clear();
      num2.clear();
      result = '';
    });
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Arithmatic Calculator'),

        backgroundColor: Colors.blueGrey,

      ),
      body: Container(
        decoration: const BoxDecoration(
         color: Colors.white70
        ),
        child: Padding(

          padding: const EdgeInsets.all(8.0),


            child: Column(
              children:<Widget> [

                TextField(

                  controller: num1,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),

                    labelText: 'Number 1',
                    hintText: 'Enter first Number',


                  ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                ],
                ),
                const SizedBox(height: 20,),
                TextField(
                  controller: num2,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Number 2',
                    hintText: 'Enter second Number',


                  ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                    ],
    ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white70,

                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,

                        ),
                      ),
                      onPressed: () => showResult('+'),
                      child: const Text('+'),
                    ),
                    const SizedBox(width: 12),


                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlue,

                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,

                          ),
                        ),
                        onPressed:() => showResult('-'),
                        child: Text('-')),
                    const SizedBox(width: 12),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white54,

                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,

                          ),
                        ),
                        onPressed:() => showResult('*'),
                        child: Text('*')),
                    const SizedBox(width: 12),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lime,

                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,

                          ),
                        ),
                        onPressed:() => showResult('/'),
                        child: Text('/')),




                  ],
                ),
                const SizedBox(height: 56),
                Text(
                  result.isEmpty? 'Result' : 'Result $result',
                  style: TextStyle(fontSize: 24),


                ),
                const SizedBox(height: 25,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white24,

                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,

                      ),
                    ),
                    onPressed: _clearResult,
                    child: Text('clear '))
              ],

            ),



        ),
      ),
    );
  }
}
