import 'package:flutter/material.dart';

class TipCalculatorModel with ChangeNotifier{
  int _personCount = 1;
  double _tipPercentage =0.0;
  double _billTotal =0.0;

  int get personCount => _personCount;

  double get tipPercentage => _tipPercentage;

  double get billTotal => _billTotal;

  void updateBillTotal(double billTotal){
    _billTotal = billTotal;
    print("Bill Amount:$_billTotal");
    notifyListeners();
  }

  void updateTipPercentage (double tipPercentage ){
    _tipPercentage = tipPercentage;
    print("Tip Percentage:$_tipPercentage");

    notifyListeners();
  }
  void updatePersonCount (int personCount){
    _personCount = personCount;
    print("person count:$personCount");
    notifyListeners();
  }

  double get totalPerPerson => ((_billTotal * _tipPercentage) + (_billTotal)) / _personCount;


}