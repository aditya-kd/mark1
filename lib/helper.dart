
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final searchController = TextEditingController();
  @override
  void initState(){
    super.initState();
    searchController.addListener(() {
      String op= searchController.text;
      print('Currently type: $op');
    });
  }
  @override
  void dispose(){
    searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        actions: [IconButton(icon: const Icon(Icons.more_vert),
        onPressed: (){ print("More Tapped");},)],
        ),
      body: Material(
        child: Column(
        children: [
          Flexible(
          flex:1,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,

            decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius:  BorderRadius.only(
                bottomLeft:  Radius.circular(40.0),
                bottomRight: Radius.circular(40.0),
              )
            ),
            child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("Select the type for", style:  TextStyle(color: Colors.white , fontSize: 16.0)),
          Text("GST Number Search Tool", style: TextStyle(color: Colors.white, fontSize: 24.0))
        ])
                  )
         )
          ),
          
          Flexible(flex:2,
          child: gstInputBox(searchController)),
          Flexible(
          flex:2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
        style: ElevatedButton.styleFrom(
        primary: Colors.green,
        minimumSize: const Size.fromHeight(50), // NEW
      ),    onPressed: () {String s= searchController.text;
                    print('serached : $s');},
            child: const Text('Search'),
          ),
    )),
          
          ])
          )
          );
  }
}


Widget randomText(){
  return Row(mainAxisAlignment:MainAxisAlignment.start,
             children:[  Text("Enter GST Number",
                          style: TextStyle(color:  Color(0xFFa8a8a8)))
                          ]
            );
    
}

Widget inputBox(TextEditingController searchController){
  return  TextField(
    controller: searchController,
    onChanged: (value) {
      print('Submitted: $value');
    },
  decoration: const InputDecoration(
    border: InputBorder.none,
    filled: true,
    fillColor:  Color(0xFFdbdbdb),
    hintStyle: TextStyle(color: Color(0xFFa8a8a8)),
    hintText: "Enter code here"),
  style: const TextStyle(color: Colors.black));
}
Widget gstInputBox(TextEditingController searchController){

  return Padding(
       padding: const EdgeInsets.all(8.0),
       child: Column(
     mainAxisAlignment: MainAxisAlignment.center,
     children:[randomText(),
              inputBox(searchController)]));
}

Widget searchGST(){
   return Padding(
  padding: const EdgeInsets.all(16.0),
  child: Container(padding: const EdgeInsets.all(16.0),
                child: const Text("Search GST Number", 
                                  style: TextStyle(color:Colors.green)),
                decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(50.0),
                  color: Colors.white,
                ),
              ));
}