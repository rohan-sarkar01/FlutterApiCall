import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_api_call/screens/charging_of_charger/model.dart';
import 'package:flutter_api_call/screens/charging_of_charger/view_model.dart';
import 'package:flutter_api_call/utils/project_colors.dart';
import 'package:provider/provider.dart';


class Charging extends StatefulWidget {
  const Charging({Key? key}) : super(key: key);

  @override
  State<Charging> createState() => _ChargingState();
}

class _ChargingState extends State<Charging> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ChargingViewModel>(
      builder: (c,dataProvider,child){
        return Scaffold(
           appBar: AppBar(
          centerTitle: true,
          backgroundColor: ProjectColor.primaryColor,
          title:const Text(
            "Charging",
            style:TextStyle(
            color: ProjectColor.secondaryColor,
            fontSize: 20,
            fontWeight: FontWeight.w500
          ),
          ),
        ),
        body: FutureBuilder(
          future:dataProvider.getChargingViewModel(),
          builder: (context, snapshot) {
            if (snapshot.connectionState !=ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const SizedBox(
                  child: Center(child: Text("No Data Found")));
                  } else if (snapshot.hasData) {
                    print("request data:=>  ${jsonDecode(snapshot.data.toString())}");
                    ChargingModel charging=chargingModelFromJson(snapshot.data.toString());
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(child: Text(charging.data!.type.toString()),)
                      ],
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                  }
      ));
      }
      );
  }
}
