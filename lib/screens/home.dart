import 'package:projet_test/constants/app_constants.dart';
import 'package:projet_test/widgets/left_bar.dart';
import 'package:projet_test/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _imcResultat = 0;
  String _textResultat = "";

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title: Text(
          "Calculateur IMC",
          style: TextStyle(color: accentHexColor, fontWeight: FontWeight.w300,),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          ),
          backgroundColor: mainHexColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 130,
                      child: TextField(
                        controller: _heightController,
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: accentHexColor 
                          ),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Taille",
                            hintStyle: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w300,
                              color: shadowHexColor.withOpacity(.8)
                            ),
                          ),
                        ),
                    ),

                    Container(
                      width: 130,
                      child: TextField(
                        controller: _weightController,
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: accentHexColor 
                          ),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Poids",
                            hintStyle: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w300,
                              color: shadowHexColor.withOpacity(.8)
                            ),
                          ),
                        ),
                    ),

                  ],
                ),
                SizedBox(height: 30,),
                Container(
                  width: 125,
                  height: 40,
                  child:OutlinedButton(
                  onPressed: (){
                    double _t = double.parse(_heightController.text);
                    double _p = double.parse(_weightController.text);
                    setState(() {
                      _imcResultat = _p / (_t * _t);
                      if(_imcResultat > 40){
                        _textResultat = "Obésité morbide";
                      } 
                      else if(_imcResultat >= 35 && _imcResultat <= 40){
                        _textResultat = "Obésité sévère";
                      }
                      else if(_imcResultat >= 30 && _imcResultat <= 35){
                        _textResultat = "Obésité modérée";
                      }
                      else if(_imcResultat >= 25 && _imcResultat <= 30){
                        _textResultat = "Surpoids";
                      }
                      else if(_imcResultat >= 18.5 && _imcResultat <= 25){
                        _textResultat = "Corpulence normale";
                      }
                      else{
                        _textResultat = "Vous êtes en sous-poids";
                      }
                    });
                  },
                  style: 
                    ButtonStyle(
                      shape :MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.red)))),

                  child: Text("Calculer", style: TextStyle(fontSize:22, fontWeight:FontWeight.bold, color : shadowHexColor),),
                ),
                ),
                SizedBox(height: 50,),
                Container(
                  child: Text(_imcResultat.toStringAsFixed(2), style: TextStyle(fontSize:90, color:accentHexColor),),
                ),
                SizedBox(height: 30,),
                Visibility(
                  visible: _textResultat.isNotEmpty,
                  child: Container(
                  child: Text(_textResultat, style: TextStyle(fontSize:32, fontWeight:FontWeight.w400, color:accentHexColor),),
                ),),
                SizedBox(height: 10,),
                LeftBar(barWidth: 40,),
                SizedBox(height: 20,),
                LeftBar(barWidth: 70,),
                SizedBox(height: 20,),
                LeftBar(barWidth: 40,),

                SizedBox(height: 20,),
                RightBar(barWidth: 70,),
                SizedBox(height: 50,),
                RightBar(barWidth: 70,),


              ],
            )
            ,),
    );

  }
}