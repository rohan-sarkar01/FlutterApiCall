import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_api_call/screens/charger_status/model.dart';
import 'package:flutter_api_call/screens/charger_status/view_model.dart';
import 'package:flutter_api_call/utils/project_colors.dart';
import 'package:provider/provider.dart';


class ChargerStatus extends StatefulWidget {
  const ChargerStatus({Key? key}) : super(key: key);

  @override
  State<ChargerStatus> createState() => _ChargerStatusState();
}

class _ChargerStatusState extends State<ChargerStatus> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ChargerStatusViewModel>(
      builder: (c,dataProvider,child){
        return Scaffold(
           appBar: AppBar(
          centerTitle: true,
          backgroundColor: ProjectColor.primaryColor,
          title:const Text(
            "Charger Status",
            style:TextStyle(
            color: ProjectColor.secondaryColor,
            fontSize: 20,
            fontWeight: FontWeight.w500
          ),
          ),
        ),
        body: FutureBuilder(
          future:dataProvider.getChargerStatusViewModel(),
          builder: (context, snapshot) {
            if (snapshot.connectionState !=ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const SizedBox(
                  child: Center(child: Text("No Data Found")));
                  } else if (snapshot.hasData) {
                    print("request data:=>  ${jsonDecode(snapshot.data.toString())}");
                    ChargeStateModel chargerStatus=chargeStateModelFromJson(snapshot.data.toString());
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(child: Text(chargerStatus.data!.cpState.toString()),)
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
