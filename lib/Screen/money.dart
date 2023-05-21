import 'package:flutter/material.dart';

class CurrencyConverterMenu extends StatefulWidget {
  @override
  State<CurrencyConverterMenu> createState() => _CurrencyConverterMenuState();
}

class _CurrencyConverterMenuState extends State<CurrencyConverterMenu> {
  final List<String> listmoney = <String>['USD', 'EUR', 'KRW', 'AUD', 'IDR'];
  final TextEditingController _inputController = TextEditingController();
  int amount = 0;
  String _selectedItem = 'USD';
  String _converted = "";

  String convertCurrencies(String input){
    double rates = 1;

    if(_selectedItem == 'EUR'){
      rates = 0.92;
    }

    if(_selectedItem == 'KRW'){
      rates = 1325.20;
    }
    if (_selectedItem == 'AUD') {
      rates = 1.50;
    }
    if (_selectedItem == 'IDR') {
      rates = 14936.00;
    }
    else {
      print("INVALID");
    }

    var convert = double.parse(input) * rates; 

    return convert.toString();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Currency Converter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              child: Container(
                width: 200,
                child: 
              TextField(
                controller: _inputController,
                   decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'USD',
                   ), 
                ),
              )
              ),
            DropdownButton(
              value: _selectedItem,
              items: listmoney.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedItem = value!;
                });
              },
            ),
            ElevatedButton(onPressed: (){
              setState(() {
                _converted = convertCurrencies(_inputController.text);
              });
            }, style:ElevatedButton.styleFrom(primary: Colors.green), child: Text('Convert')),
            Text('$_converted'),

          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(
      BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }
}
