import 'package:flutter/material.dart';
import 'package:functions/controllers/ConversorController.dart';
import 'package:functions/enums/enums.dart';
import 'package:functions/models/ConversorModels.dart';
import 'package:live_currency_rate/live_currency_rate.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController firstCurrency = TextEditingController(text: "USD");
  TextEditingController secondCurrency = TextEditingController(text: "USD");
  TextEditingController firstInput = TextEditingController();

  double convertedValue = 0.0;

  Widget pageWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 150,
          child: TextField(
            controller: firstInput,
            textAlign: TextAlign.center,
            //enabled: ,
            onEditingComplete: () async {
              print(firstCurrency.text+" - "+secondCurrency.text);
              print(convertedValue);
              CurrencyRate converted = await LiveCurrencyRate.convertCurrency(firstCurrency.text, secondCurrency.text,double.parse(firstInput.text) );
              setState(() {
                convertedValue = converted.result;
                print(converted.result);
                FocusScope.of(context).unfocus();
              });

            },
            onChanged: (newValue){
              convertedValue = double.parse(newValue);
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(

            ),
          ),
        ),
        Container(
          height: 30,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            currencyInput(
                valueController: firstCurrency,
                addictionalFunction: () {
                    print(firstCurrency.text);
                }
            ),
            Container(
              width: 15,
            ),
            Text(
              "To",
              style: TextStyle(fontSize: 25),
            ),
            Container(
              width: 15,
            ),
            currencyInput(
                valueController: secondCurrency,
                addictionalFunction: (){
                  setState(() async{
                    CurrencyRate converted = await LiveCurrencyRate.convertCurrency(firstCurrency.text, secondCurrency.text,double.parse(firstInput.text) );
                    setState(() {
                      convertedValue = converted.result;
                      print(converted.result);
                    });
                  });
                }
            ),
          ],
        ),
        Container(height: 10,),
        invertButton(
          onTap: (){
            setState(() {
              String storeFirst = firstCurrency.text;
              firstCurrency.text = secondCurrency.text;
              secondCurrency.text = storeFirst;
              print(firstCurrency.text+" - "+secondCurrency.text);
            });
          },
        ),
        Container(
          height: 30,
        ),
        Container(
          width: double.infinity,
          height: 50,
          color: Colors.grey.withOpacity(0.15),
          child: Center(
            child: Text(
                "The converted currency is equal to: "+convertedValue.toStringAsFixed(2)
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: Stack(
        children: [
          pageWidget(),

        ],
      ),
    );
  }
}
