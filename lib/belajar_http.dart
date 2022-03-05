import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// class GetrHttp extends StatefulWidget {
//   @override
//   _GetrHttpState createState() => _GetrHttpState();
// }

// class _GetrHttpState extends State<GetrHttp> {
//   String nama = "";
//   String email = "";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("LATIHANA HTTTP"),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 nama,
//                 style: TextStyle(color: Colors.black),
//               ),
//               Text(email),
//               RaisedButton(
//                 onPressed: () async {
//                   var respond = await http
//                       .get(Uri.parse('https://reqres.in/api/users/2'));
//                   var myData = (jsonDecode(respond.body)
//                       as Map<String, dynamic>)["data"];

//                   print(myData);
//                   setState(() {});
//                   email = myData["email"].toString();
//                   nama = myData["first_name"].toString();
//                 },
//                 child: Text("Get Data"),
//               )
//             ],
//           ),
//         ));
//   }
// }

// class PostHttp extends StatefulWidget {
//   @override
//   State<PostHttp> createState() => _PostHttpState();
// }

// class _PostHttpState extends State<PostHttp> {
//   TextEditingController name = TextEditingController();
//   TextEditingController job = TextEditingController();
//   String nama = "";
//   String jobs = "";

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("LATIHAN HTTPS"),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.only(top: 16),
//           child: ListView(
//             children: [
//               Column(
//                 children: [
//                   TextField(
//                     controller: name,
//                     decoration: InputDecoration(
//                         border: OutlineInputBorder(), label: Text("Name")),
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   TextField(
//                     controller: job,
//                     decoration: InputDecoration(
//                         border: OutlineInputBorder(), label: Text("Job")),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   ElevatedButton(
//                     onPressed: () async {
//                       var respond = await http.get(
//                         Uri.parse("https://reqres.in/api/users?page=2"),
//                       );

//                       List dataku = json.decode(respond.body)["data"];

//                       dataku.forEach((element) {
//                         Map<String, dynamic> user = element;
//                         print(user["email"]);
//                       });

//                       setState(() {
//                         // nama = dataku["name"];
//                         // jobs = dataku['job'];
//                       });
//                     },
//                     child: Text("Post job"),
//                     clipBehavior: Clip.antiAlias,
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               Text(nama),
//               Text(jobs)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//// List User Api
// class LatihanFutureBuilder extends StatelessWidget {
//   List<Map<String, dynamic>> user = [];

//   Future getData() async {
//     var respond =
//         await http.get(Uri.parse("https://reqres.in/api/users?page=1"));

//     List dataUser = (json.decode(respond.body) as Map<String, dynamic>)["data"];

//     dataUser.forEach((element) {
//       user.add(element);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Latihan FutureBuilder"),
//       ),
//       body: FutureBuilder(
//           future: getData(),
//           builder: (context, snapshot) {
//             return ListView.builder(
//                 itemCount: user.length,
//                 itemBuilder: (context, index) => ListTile(
//                       leading: CircleAvatar(
//                         foregroundImage:
//                             NetworkImage('${user[index]["avatar"]}'),
//                       ),
//                       title: Text('${user[index]["first_name"]} ' +
//                           '${user[index]["last_name"]}'),
//                       subtitle: Text('${user[index]["email"]} '),
//                     ));
//           }),
//     );
//   }
// }

// class LatihanBloc extends StatefulWidget {
//   @override
//   State<LatihanBloc> createState() => _LatihanBlocState();
// }

// class _LatihanBlocState extends State<LatihanBloc> {
//   CounterBloc bloc = CounterBloc();
//   @override
//   Widget build(BuildContext context) {
//     print("build");
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           StreamBuilder(
//               stream: bloc.output,
//               builder: (_, snapshot) => Text("Counter : ${snapshot.data}")),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               RaisedButton(
//                 onPressed: () {
//                   bloc._input.add("Add");
//                 },
//                 child: Icon(Icons.add),
//               ),
//               SizedBox(
//                 width: 50,
//               ),
//               RaisedButton(
//                 onPressed: () {
//                   bloc._input.add("min");
//                 },
//                 child: Icon(Icons.add),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

// class CounterBloc {
//   int count = 0;
//   final StreamController _inputControler = StreamController();
//   StreamSink get _input => _inputControler.sink;

//   final StreamController _outputController = StreamController();
//   StreamSink get _outPout => _outputController.sink;

//   Stream get output => _outputController.stream;

//   CounterBloc() {
//     _inputControler.stream.listen((event) {
//       if (event == "Add") {
//         count++;
//       } else {
//         count--;
//       }

//       _outPout.add(count);
//     });
//   }
//   void dispos() {
//     _inputControler.close();
//     _outputController.close();
//   }
// }
