import 'package:flutter/material.dart';
import 'package:myapp1/home_page.dart';

class Calculator extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => Cal();
}

class Cal extends State<Calculator>{
  TextEditingController numcontroller1= TextEditingController();
  TextEditingController numcontroller2=TextEditingController();
  TextEditingController resultcontroller=TextEditingController();

  var selectOpcontroller;
  var result;

  @override
  Widget build(BuildContext context) => Scaffold(

    body: Center(
      child: Container(
        height: 550,
        width: 500,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
         // colors: [Colors.cyan,Colors.white10],
         colors:[Color(0xff6a11cb),Color(0xff2575fc),Color(0xff8E2DE2)],
           // colors:[Color(0xff0F2027),Color(0xff2C5364),Color(0xff203A43)],
           begin: Alignment.topCenter,
          ),
        ),

        child: Column(
          children: [
           Padding(
             padding:EdgeInsets.all(30),
             child: TextField(
               controller: numcontroller1,
               decoration: InputDecoration(
                   hintText:"Enter a number 1",
                   hintStyle: TextStyle(
                     color: Colors.white,
                   ),
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(30),
                 )
               ),
             ),
           ),

            Padding(
              padding:EdgeInsets.all(30),
              child: TextField(
                controller: numcontroller2,
                decoration: InputDecoration(
                    hintText:"Enter a number 2",
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(30),
              child: TextField(
                controller: resultcontroller,
                decoration: InputDecoration(
                  hintText: "Calculation is: ",
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30)
                  ),
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      height: 50,
                      width:80,
                      child: ElevatedButton(onPressed: (){
                        selectOpcontroller=1;
                      }, child: Text("+",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),))
                  ),

                  SizedBox(
                      height: 50,
                      width:80,
                      child: ElevatedButton(onPressed: (){
                        selectOpcontroller=2;
                      }, child: Text("-",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),))
                  ),

                  SizedBox(
                      height: 50,
                      width:80,
                      child: ElevatedButton(onPressed: (){
                        selectOpcontroller=3;
                        }, child: Text("*",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),))
                  ),

                  SizedBox(
                      height: 50,
                      width:80,
                      child: ElevatedButton(onPressed: (){
                        selectOpcontroller=4;
                      }, child: Text("/",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),))
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(onPressed: (){
                sum();
              }, child: Text("Calculate")),
            )
          ],
        ),
      ),
    ),
  );

  void sum()
  {
    int num1=int.parse(numcontroller1.text);
    int num2=int.parse(numcontroller2.text);

    if(selectOpcontroller ==1){
      result=num1+num2;
      resultcontroller.text=result.toString();
    }

    else if(selectOpcontroller==2){
      result=num1-num2;
      resultcontroller.text=result.toString();
    }

    else if(selectOpcontroller==3){
      result=num1*num2;
      resultcontroller.text=result.toString();
    }

    else if(selectOpcontroller==4){
      result=num1/num2;
      resultcontroller.text=result.toString();
    }

    setState(() {});

    print("Result is: $result");
  }
}
