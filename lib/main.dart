import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(MaterialApp(
  home: HomeScreen(),
));

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   String strExp = "" , strResult = "0.0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Calculator App"),
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: Column(
        children: <Widget>[
          //Expression
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 28, 12),
                child: Text(
                  strExp== "" ? "Tap on the keypad to calculate" : strExp,
                  textAlign: TextAlign.right,
                  style:TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),

          //Results
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 12, 82),
                child: Text(
                  strResult,
                  textAlign: TextAlign.right,
                  style:TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w400,
                    color: Colors.deepPurple,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0,10,8,62),
                child: CircleAvatar(
                  backgroundColor: Colors.deepPurpleAccent.withAlpha(30),
                  radius: 16,
                  child: IconButton(
                      onPressed: (){
                        setState(() {
                          strResult="";
                          strExp="";
                        });
                      },
                      icon: Icon(
                        Icons.close,
                        color: Colors.deepPurpleAccent,
                        size: 16,),
                  ),
                ),
              ),
            ],
          ),

          //Keypad
          getkeypad()

        ],
      ),
    );
  }

  getkeypad(){
    return Column(
      children: <Widget>[

        //first half of the keypad
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[

            //Number Pad
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //First Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //7
                    InkWell(
                      child: Padding(
                        padding: EdgeInsets.all(32),
                        child: Text(
                          "7",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                      ),

                      onTap: () => updateExp("7"),
                    ),

                    //8
                    InkWell(
                      child: Padding(
                        padding: EdgeInsets.all(32),
                        child: Text(
                          "8",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                      ),

                      onTap: ()=> updateExp("8"),
                    ),

                    //9
                    InkWell(
                      child: Padding(
                        padding: EdgeInsets.all(32),
                        child: Text(
                          "9",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                      ),

                      onTap:()=> updateExp("9"),
                    ),

                  ],
                ),

                //Second Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //4
                    InkWell(
                      child: Padding(
                        padding: EdgeInsets.all(32),
                        child: Text(
                          "4",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                      ),

                      onTap: ()=> updateExp("4"),
                    ),

                    //5
                    InkWell(
                      child: Padding(
                        padding: EdgeInsets.all(32),
                        child: Text(
                          "5",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                      ),

                      onTap: ()=> updateExp("5"),
                    ),

                    //6
                    InkWell(
                      child: Padding(
                        padding: EdgeInsets.all(32),
                        child: Text(
                          "6",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                      ),

                      onTap: ()=> updateExp("6"),
                    ),

                  ],
                ),

                //Third Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //1
                    InkWell(
                      child: Padding(
                        padding: EdgeInsets.all(32),
                        child: Text(
                          "1",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                      ),

                      onTap: ()=> updateExp("1"),
                    ),

                    //2
                    InkWell(
                      child: Padding(
                        padding: EdgeInsets.all(32),
                        child: Text(
                          "2",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                      ),

                      onTap: ()=> updateExp("2"),
                    ),

                    //3
                    InkWell(
                      child: Padding(
                        padding: EdgeInsets.all(32),
                        child: Text(
                          "3",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                      ),

                      onTap: ()=> updateExp("3"),
                    ),

                  ],
                ),

              ],
            ),

            //Operator Pad
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.purple.withAlpha(30),
              ),
              child: Column(
                children: <Widget>[
                  // /
                  InkWell(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        "/",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),

                    onTap: ()=> updateExp("/"),
                  ),

                  //X
                  InkWell(
                    child: Padding(
                      padding: EdgeInsets.all(22),
                      child: Text(
                        "X",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            color: Colors.deepPurple
                        ),
                      ),
                    ),

                    onTap: ()=> updateExp("*"),
                  ),

                  //-
                  InkWell(
                    child: Padding(
                      padding: EdgeInsets.all(22),
                      child: Text(
                        "-",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            color: Colors.deepPurple
                        ),
                      ),
                    ),

                    onTap: ()=> updateExp("-"),
                  ),

                  //+
                  InkWell(
                    child: Padding(
                      padding: EdgeInsets.all(22),
                      child: Text(
                        "+",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            color: Colors.deepPurple
                        ),
                      ),
                    ),

                    onTap: ()=> updateExp("+"),
                  ),
                ],
              ),
            ),
          ],
        ),

        //second half
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //.
            InkWell(
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Text(
                  ".",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
              ),

              onTap: ()=> updateExp("."),
            ),

            //0
            InkWell(
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Text(
                  "0",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
              ),

              onTap: ()=> updateExp("0"),
            ),

            //delete
            Padding(
              padding: EdgeInsets.all(32),
              child:IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.deepPurpleAccent,
                ),
                onPressed: (){
                  setState(() {
                    if(strExp != null && strExp.length > 0){
                      strExp = strExp.substring(0,strExp.length-1);
                    }
                  });
                },
              ),
            ),

            // =
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: FlatButton(
                padding: EdgeInsets.all(0),
                color: Colors.deepPurpleAccent,
                textColor: Colors.white,
                child: Text(
                  "=",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),

                onPressed: (){
                  Parser p = Parser();
                  //Bind Variables
                  ContextModel cm = new ContextModel();
                  Expression exp = p.parse(strExp);

                  setState(() {
                    strResult = exp.evaluate(EvaluationType.REAL, cm).toString();
                  });
                },
              ),
            ),

          ],
        ),

      ],
    );
  }

  updateExp(String strValue){
    setState(() {
      strExp = strExp + strValue;
    });
  }
}




