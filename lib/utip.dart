import 'dart:developer';

import 'package:calculator_app/widgets/bill_amount_field.dart';
import 'package:calculator_app/widgets/person_counter.dart';
import 'package:calculator_app/widgets/tip_row.dart';
import 'package:calculator_app/widgets/tip_slider.dart';
import 'package:calculator_app/widgets/total_per_person.dart';
import 'package:flutter/material.dart';

class UTip extends StatefulWidget {
  const UTip({super.key});

  @override
  State<UTip> createState() => _UTipState();
}

class _UTipState extends State<UTip> {
  int _personCount = 1;
  double _tipPercentage = 0.0;
  double _billTotal = 0.0;

  double totalPerPerson() {
    return (((_billTotal * _tipPercentage) + (_billTotal)) / _personCount);
  }

  double totalTip() {
    return (_billTotal * _tipPercentage);
  }

  //methods

  void increment() {
    log("Calling increment function");
    setState(() {
      _personCount++;
    });
  }

  void decrement() {
    log("Calling decrement function");
    setState(() {
      if (_personCount > 1) {
        _personCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //print(context.widget);
    var themeData = Theme.of(context);
    double total = totalPerPerson();
    double totalT = totalTip();
    final style = themeData.textTheme.titleMedium!.copyWith(
      color: themeData.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    );
    return Scaffold(
      appBar: AppBar(title: Text("UTip")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TotalPerPerson(themeData: themeData, style: style, total: total),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: themeData.colorScheme.primary,
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  BillAmountField(
                    billAmount: _billTotal.toString(),
                    onChanged: (value) {
                      setState(() {
                        _billTotal = double.parse(value);
                      });
                      // log("Amount: $value");
                    },
                  ),
                  //Split Bill Area
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Split", style: themeData.textTheme.titleMedium),

                      PersonCounter(
                        themeData: themeData,
                        personCount: _personCount,
                        onDecrement: decrement,
                        onIncrement: increment,
                      ),
                    ],
                  ),
                  TipRow(themeData: themeData, totalT: totalT),
                  //slider text
                  Text("${(_tipPercentage * 100).round()}%"),
                  TipSlider(
                    tipPercentage: _tipPercentage,
                    onChanged: (double value) {
                      setState(() {
                        _tipPercentage = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


