import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_api_call/screens/command_run/model.dart';
import 'package:flutter_api_call/screens/command_run/view_model.dart';
import 'package:flutter_api_call/utils/project_colors.dart';
import 'package:provider/provider.dart';


class CommandRun extends StatefulWidget {
  const CommandRun({Key? key}) : super(key: key);

  @override
  State<CommandRun> createState() => _CommandRunState();
}

class _CommandRunState extends State<CommandRun> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CommandRunViewModel>(
      builder: (c,dataProvider,child){
        return Scaffold(
           appBar: AppBar(
          centerTitle: true,
          backgroundColor: ProjectColor.primaryColor,
          title:const Text(
            "Command Run",
            style:TextStyle(
            color: ProjectColor.secondaryColor,
            fontSize: 20,
            fontWeight: FontWeight.w500
          ),
          ),
        ),
        body: FutureBuilder(
          future:dataProvider.getCommandRunViewModel(),
          builder: (context, snapshot) {
            if (snapshot.connectionState !=ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const SizedBox(
                  child: Center(child: Text("No Data Found")));
                  } else if (snapshot.hasData) {
                    print("request data:=>  ${jsonDecode(snapshot.data.toString())}");
                    CommandRunModel commandRunModel=commandRunModelFromJson(snapshot.data.toString());
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(child: Text(commandRunModel.data!.success.toString()),)
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
