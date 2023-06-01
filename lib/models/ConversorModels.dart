import 'package:flutter/material.dart';
import 'package:functions/enums/enums.dart';

class currencyInput extends StatefulWidget {
  final TextEditingController valueController;
  final Function()? addictionalFunction;
   currencyInput(
      {Key? key, required this.valueController, this.addictionalFunction, })
      : super(key: key);

  @override
  State<currencyInput> createState() => _currencyInputState();
}

class _currencyInputState extends State<currencyInput> {
  @override
  List<String> currencyOptions = <String>["USD","BRL","EUR","YEN"];
  String dropdownValue= "USD";
  Widget build(BuildContext context) {

    return SizedBox(
      child: Row(
        children: [
          Container(width: 15,),
          DropdownButton(

              value: dropdownValue,
              items:
                  currencyOptions.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) async{
                dropdownValue = newValue!;
                widget.valueController.text = newValue!;
                widget.addictionalFunction;

                setState(() {


                });
              }),
        ],
      ),
    );
  }
}

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(),
      color: Colors.black.withOpacity(0.6),
    );
  }
}


class invertButton extends StatefulWidget {
  final Function()? onTap;
  const invertButton({Key? key, this.onTap}) : super(key: key);

  @override
  State<invertButton> createState() => _invertButtonState();
}

class _invertButtonState extends State<invertButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

      },
      child: Container(
        color:Colors.grey,
        width: 100,height: 30,
        child: Icon(Icons.cached),
      ),
    );
  }
}




