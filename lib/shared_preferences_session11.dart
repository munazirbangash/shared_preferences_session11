import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SwitchButton extends StatefulWidget {
  const SwitchButton({super.key});

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool bulbStatus = false;

  @override
  void initState() {
    // TODO: implement initState
    getBulbStatus();
    super.initState();
  }

  Future getBulbStatus() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool? status = sp.getBool("BULB_STATUS");
    if(status != null){
      setState(() {
        bulbStatus = status;
      });
    }

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:const Text("Shared Preferences"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(bulbStatus ? "assets/bulb/on.png" : "assets/bulb/off.png",width: 250,height: 200,),
            Switch(value: bulbStatus, onChanged: (bool isChecked) async{
              SharedPreferences sp = await SharedPreferences.getInstance();
              sp.setBool("BULB_STATUS", isChecked);
              setState(() {
                bulbStatus = isChecked;
              });
            })
          ],
        ),
      ),
    );

  }
}




