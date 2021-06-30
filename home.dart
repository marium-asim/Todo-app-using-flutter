import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

var output = "";
 List<dynamic> lst = [1,2,3];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: ListView.builder(
       itemCount: lst.length,
       itemBuilder: (context, index){
         return Container(
           height: 50,
           color: Colors.purple,
           margin: EdgeInsets.only(top: 15),
           child: ListTile(
           title: Text("${lst[index]}"),
           trailing: Container(
             width: 50,
             child: Row(
               children: [
                  GestureDetector(
                   onTap: () {
                         showDialog(context: context, builder: (context){
return AlertDialog(
  title: Text("Edit Item"),
  content: TextField(
    onChanged: (value)
    {
      output = value;
    },
  ),
  actions: [
    ElevatedButton(onPressed: (){
       Navigator.of(context).pop();
      setState(() {
        lst.replaceRange(index, index+1, {output});
      });
    }, child: Text("Edit"))
  ],
);
         });
                   },
                   child:  Icon(Icons.edit),),
                 GestureDetector(
                   onTap: () {
                     setState(() {
                       lst.removeAt(index);
                     });
                   },
                   child:  Icon(Icons.delete),),
               ],
             ),
           )
          
           ),
         );
       }),
       floatingActionButton: FloatingActionButton(onPressed: (){
        
         showDialog(context: context, builder: (context){
return AlertDialog(
  title: Text("Add Item"),
  content: TextField(
    onChanged: (value)
    {
      output = value;
    },
  ),
  actions: [
    ElevatedButton(onPressed: (){
       Navigator.of(context).pop();
      setState(() {
        lst.add(output);
      });
    }, child: Text("Add"))
  ],
);
         });
       },
        child: Text("Add"),),
    );
  }
}

