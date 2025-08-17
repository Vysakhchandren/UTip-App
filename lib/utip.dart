import 'package:flutter/material.dart';
import 'package:flutter/src/material/theme.dart';

class UTip extends StatefulWidget {
  const UTip({super.key});

  @override
  State<UTip> createState() => _UTipState();
}

class _UTipState extends State<UTip> {
   int _personCount = 1;
  //methods

  void increment(){
    setState(() {
      _personCount++;
    });
  }

   void decrement(){
     setState(() {
       if(_personCount >0){
       _personCount--;}
     });
   }

  @override
  Widget build(BuildContext context) {
    print(context.widget);
    var themeData = Theme.of(context);
    final style = themeData.textTheme.titleMedium!.copyWith(
      color: themeData.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    );
    return Scaffold(
      appBar: AppBar(title: Text("UTip")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: themeData.colorScheme.inversePrimary,
                borderRadius: BorderRadius.circular(10),
              ),

              child: Column(
                children: [
                  Text("Total Per Person", style: style),
                  Text(
                    "\$24.45",
                    style: style.copyWith(
                      color: themeData.colorScheme.onPrimary,
                      fontSize: themeData.textTheme.displaySmall?.fontSize,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: themeData.colorScheme.primary,
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.attach_money),
                      labelText: "Bill Amount",
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (String value) {
                      print("Value= $value");
                    },
                  ),
                  //Split Bill Area
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Split", style: themeData.textTheme.titleMedium),

                      Row(
                        children: [
                          IconButton(
                            onPressed: decrement,
                            icon: Icon(Icons.remove),
                            color: themeData.colorScheme.primary,
                          ),
                          Text(_personCount.toString(), style: themeData.textTheme.titleMedium),
                          IconButton(
                            onPressed: increment,
                            icon: Icon(Icons.add),
                            color: themeData.colorScheme.primary,
                          ),
                        ],
                      ),
                    ],
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
