import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),

    home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {

 late int firstnum;
  late int secondnum;
  String texttodisply = "";
   late String res;
  late String operatortoperform;
  void btnclicked( String btnval){
    if(btnval == "c"){
      texttodisply = "";
      firstnum= 0 ;
      secondnum = 0;
        res = "";
    }
    else if(btnval=='+'|| btnval =='-'||btnval=='x'||btnval=='/'){
      firstnum=int .parse(texttodisply);
      res="";
      operatortoperform=btnval;
    }
    else if(btnval ==  "=")
      { secondnum = int.parse(texttodisply);
        if(operatortoperform== "+"){
            res= (firstnum + secondnum).toString();
        }
      if(operatortoperform== "-"){
        res= (firstnum - secondnum).toString();
      }
      if(operatortoperform== "x"){
        res= (firstnum * secondnum).toString();
      }
      if(operatortoperform== "/"){
        res= (firstnum / secondnum).toString();
      }
      }
    else{
      res = int.parse(texttodisply + btnval).toString();
    }
    setState(() {
      texttodisply = res;
    });
  }
  Widget custombutton (String btnval){
      return Expanded(

          child: OutlinedButton(

            onPressed: () => btnclicked(btnval),
            child: Text('$btnval',
            style: TextStyle(
                fontSize: 24.0
            ),),
          )
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculator',
        ),
      ),
      body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            Expanded(child:
                  Container(
                    padding: EdgeInsets.all(10.0),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      '$texttodisply',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

            ),

              Row(
                children: [
                  custombutton("9"),
                  custombutton("8"),
                  custombutton("7"),
                  custombutton("+"),

                ],
              ),

              Row(
                children: [
                  custombutton("6"),
                  custombutton("5"),
                  custombutton("4"),
                  custombutton("-"),

                ],
              ),

              Row(
                children: [
                  custombutton("3"),
                  custombutton("2"),
                  custombutton("1"),
                  custombutton("*"),
                ],
              ),

              Row(
                children: [
                  custombutton("c"),
                  custombutton("0"),
                  custombutton("="),
                  custombutton("/"),
                ],
              )
            ],
          ),
      ),
    );
  }
}


