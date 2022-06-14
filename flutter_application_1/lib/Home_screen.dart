

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/second_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';



class HOMESCREEN extends StatefulWidget{ 
  final double d4;
  const HOMESCREEN (this.d4,{Key? key}):super(key: key);
  
  @override
  State<HOMESCREEN> createState() =>_HOMESCREENState();

    
  

}
class _HOMESCREENState extends State<HOMESCREEN> {
  final  a1  = TextEditingController();
  final   b2 = TextEditingController();

  double porcent = 0;

  void setDefaultValues(double value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('percent', value);

  }

  Future<double?> getDefaultValues() async {
      final prefs = await SharedPreferences.getInstance();
      final double percent = prefs.getDouble('percent')??widget.d4;

      return percent;

  }


  @override
  Widget build(BuildContext context) {
getDefaultValues().then((value) =>{
      b2.text = value.toString()
    });
   return Scaffold(
    backgroundColor: Colors.black,
    appBar: AppBar(title: const Text("calculation"), elevation: 0, backgroundColor:  Color.fromARGB(255, 143, 54, 244)),
    drawer: Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
            'Menu',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('home'),
          onTap: () {

          },
        ),
        ListTile(
          leading: const Icon(Icons.build),
          title: const Text('configuration'),
          onTap: () {
            final route = MaterialPageRoute(builder: (context) => const SECONDSCREEN());
            Navigator.push(context, route);
          },
        ),
      ],
    ),
  ),
    body: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[ 
    Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: a1,
            decoration: InputDecoration(
              labelText: 'amont',
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          ),
          keyboardType: TextInputType.number,
        ),
        ),
  
  Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: b2,
            decoration: InputDecoration(
              labelText: 'amont',
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          ),
          keyboardType: TextInputType.number,
        ),
        ),
  

  Padding(padding:const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
  child:
  Center(child:
  ElevatedButton(
    style: ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(Colors.cyan)),
    onPressed: (){
      porcent =(double.parse(a1.text)*double.parse(b2.text))/100;
      setDefaultValues(double.parse(b2.text));

      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: const Text("Result"),
          content: Text("The result is $porcent"),
        );
      });

    }, child: const Text("Calculate")
  )
  )
  )
  ]

)
   );
  }

}

