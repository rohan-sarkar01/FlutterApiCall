import 'package:flutter/material.dart';
import 'package:flutter_api_call/utils/project_colors.dart';


class CustomButton extends StatelessWidget {
  final String buttonText;
  final Function() ontab;
   CustomButton({ required this.buttonText, required this.ontab});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontab,
      child: Container(
        decoration: BoxDecoration(
          color: ProjectColor.blue,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey)
        ),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: Text(buttonText,textAlign: TextAlign.center, style: const TextStyle(
          color: ProjectColor.secondaryColor,
          fontSize: 20,
          fontWeight: FontWeight.w500
        ),),
      ),
    );
  }
}