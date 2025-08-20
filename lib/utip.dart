import 'package:calculator_app/providers/tip_calculator_model.dart';
import 'package:calculator_app/widgets/bill_amount_field.dart';
import 'package:calculator_app/widgets/person_counter.dart';
import 'package:calculator_app/widgets/tip_row.dart';
import 'package:calculator_app/widgets/tip_slider.dart';
import 'package:calculator_app/widgets/total_per_person.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UTip extends StatefulWidget {
  final bool isDark;
  final ValueChanged<bool> onThemeChanged;

  const UTip({super.key, required this.isDark, required this.onThemeChanged});

  @override
  State<UTip> createState() => _UTipState();
}

class _UTipState extends State<UTip> {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TipCalculatorModel>(context);
    //print(context.widget);
    var themeData = Theme.of(context);

    final style = themeData.textTheme.titleMedium!.copyWith(
      color: themeData.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("UTip"),
        actions: [
          Switch(value: widget.isDark, onChanged: widget.onThemeChanged),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TotalPerPerson(
              themeData: themeData,
              style: style,
              total: model.totalPerPerson,
            ),
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
                      billAmount: model.billTotal.toString(),
                      onChanged: (value) {
                        model.updateBillTotal(double.parse(value));
                      },
                    ),
                    //Split Bill Area
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Split", style: themeData.textTheme.titleMedium),
                        PersonCounter(
                          themeData: themeData,
                          personCount: model.personCount,
                          onDecrement: () {
                            if (model.personCount > 1) {
                              model.updatePersonCount(model.personCount -1);
                            }
                          },
                          onIncrement: () {
                            model.updatePersonCount(model.personCount +1);
                          },
                        ),
                      ],
                    ),
                    TipRow(
                      themeData: themeData,
                      billTotal: model.billTotal,
                      percentage: model.tipPercentage,
                    ),
                    //slider text
                    Text("${(model.tipPercentage * 100).round()}%"),
                    TipSlider(
                      tipPercentage: model.tipPercentage,
                      onChanged: (double value) {
                        model.updateTipPercentage(value);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
