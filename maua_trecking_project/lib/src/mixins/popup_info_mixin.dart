import 'package:flutter/material.dart';

mixin InfoPopUp {}

  Future infoPopup(BuildContext context){
    return showDialog(context: context, builder: (context)=>AlertDialog(title: Text("LEGOZ"),));
  }