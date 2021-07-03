// import 'dart:convert';

// import 'package:book_vaccine_slot/slots.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// void main() => runApp(new MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.teal),
//       home: Home(),
//     );
//   }
// }

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   //---------------------------------------------------------------
//   TextEditingController pincodecontroller = TextEditingController();
//   TextEditingController daycontroller = TextEditingController();
//   String dropdownValue = '01';
//   List slots = [];
//   //---------------------------------------------------------------

//   fetchslots() async {
//     await http
//         .get(Uri.parse(
//             'https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?pincode=' +
//                 pincodecontroller.text +
//                 '&date=' +
//                 daycontroller.text +
//                 '%2F' +
//                 dropdownValue +
//                 '%2F2021'))
//         .then((value) {
//       Map result = jsonDecode(value.body);
//       setState(() {
//         slots = result['sessions'];
//       });
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) => Slot(
//                     slots: slots,
//                   )));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Vaccination Slots')),
//       body: SingleChildScrollView(
//         child: Container(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           child: Column(
//             children: [
//               Container(
//                 margin: EdgeInsets.all(20.0),
//                 height: 250.0,
//                 child: Image.asset('assets/vaccine.png'),
//               ),
//               TextField(
//                 controller: pincodecontroller,
//                 keyboardType: TextInputType.number,
//                 maxLength: 6,
//                 decoration: InputDecoration(hintText: 'Enter PIN Code'),
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     child: Container(
//                       height: 60.0,
//                       child: TextField(
//                         controller: daycontroller,
//                         decoration: InputDecoration(
//                           hintText: 'Enter Date',
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 10),
//                   Expanded(
//                     child: Container(
//                       height: 52,
//                       child: DropdownButton<String>(
//                         isExpanded: true,
//                         value: dropdownValue,
//                         icon: const Icon(Icons.arrow_drop_down),
//                         iconSize: 24,
//                         elevation: 16,
//                         underline: Container(
//                           color: Colors.grey.shade400,
//                           height: 2,
//                         ),
//                         onChanged: (String newValue) {
//                           setState(() {
//                             dropdownValue = newValue;
//                           });
//                         },
//                         items: <String>[
//                           '01',
//                           '02',
//                           '03',
//                           '04',
//                           '05',
//                           '06',
//                           '07',
//                           '08',
//                           '09',
//                           '10',
//                           '11',
//                           '12'
//                         ].map<DropdownMenuItem<String>>((String value) {
//                           return DropdownMenuItem<String>(
//                             value: value,
//                             child: Text(value),
//                           );
//                         }).toList(),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               Container(
//                 width: double.infinity,
//                 height: 45,
//                 child: ElevatedButton(
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all(
//                         Theme.of(context).primaryColor),
//                   ),
//                   child: Text('Find Slots'),
//                   onPressed: () {
//                     fetchslots();
//                   },
//                 ),
//               ),
//               // Expanded(
//               //   child: Container(
//               //     child: Row(
//               //       mainAxisAlignment: MainAxisAlignment.center,
//               //       children: [
//               //         Text('Made By Harsh'),
//               //       ],
//               //     ),
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:convert';
import 'package:book_vaccine_slot/slots.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vaccine Slot',
      theme: ThemeData(primaryColor: Colors.teal, brightness: Brightness.dark),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  // const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //---------------------------------------------------------
  TextEditingController pincodecontrolller = TextEditingController();
  TextEditingController daycontrolller = TextEditingController();
  String dropdownValue = '01';
  List slots = [];
  //----------------------------------------------------------
  fetchslots() async {
    await http
        .get(Uri.parse(
            'https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?pincode=' +
                pincodecontrolller.text +
                '&date=' +
                daycontrolller.text +
                '%2F' +
                dropdownValue +
                '%2F2021'))
        .then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        slots = result['sessions'];
      });
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Slot(
                    slots: slots,
                  )));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vaccination Slot'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(children: [
            Container(
              margin: EdgeInsets.all(20.0),
              height: 250.0,
              child: Lottie.asset('assets/vaccine.json'),
            ),
            TextField(
              controller: pincodecontrolller,
              keyboardType: TextInputType.number,
              maxLength: 6,
              decoration: InputDecoration(hintText: 'Enter PIN Code'),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 60.0,
                    child: TextField(
                      controller: daycontrolller,
                      decoration: InputDecoration(hintText: 'Enter Date'),
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: Container(
                    height: 52,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      // style: const TextStyle(color: Colors.grey),
                      underline: Container(
                        height: 2,
                        color: Colors.grey.shade400,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                          
                        });
                      },
                      items: <String>[
                        '01',
                        '02',
                        '03',
                        '04',
                        '05',
                        '06',
                        '07',
                        '08',
                        '09',
                        '10',
                        '11',
                        '12'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 45.0,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor)),
                onPressed: () {
                  fetchslots();
                },
                child: Text('Find Slots'),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
