import 'package:flutter/material.dart';
import '../../utils/project_colors.dart';
import '../../widgets/custom_botton.dart';
import '../charger_status/view.dart';
import '../charging_of_charger/view.dart';
import '../command_run/view.dart';
import 'model.dart';
import 'services.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ProjectColor.primaryColor,
        title: const Text(
          "Home",
          style:TextStyle(
          color: ProjectColor.secondaryColor,
          fontSize: 20,
          fontWeight: FontWeight.w500
        ),
        ),
      ),
      body: Container(
        color: ProjectColor.secondaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(children: [
              Expanded(child:  CustomButton(buttonText: "Telemetry", ontab: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const ChargerStatus()));
              }),),
              Expanded(child:  CustomButton(buttonText: "Transaction", ontab: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Charging()));
              }),)
            ],),
            Row(children: [
              Expanded(child:  CustomButton(buttonText: "Act", ontab: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const CommandRun()));
              }),),
              Expanded(child:  CustomButton(buttonText: "Publish", ontab: (() => onTabPublist(context))))
            ],),
        ],),
      ),
    );
  }
}

onTabPublist(BuildContext context)async{
    var result= await PublishServices.publishReuest();
    PublishModel publishModel=publishModelFromJson(result.toString());
    if(publishModel.data==""){
       
    }else{
      print("Data loaded successfully: ${publishModel.data.toString()}");
    }
}