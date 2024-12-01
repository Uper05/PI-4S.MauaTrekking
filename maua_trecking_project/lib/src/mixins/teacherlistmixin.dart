import 'package:flutter/material.dart';

mixin InputMixin {
  late IconData icon;
  late String title;
  late TextEditingController controller;
  late String label;
  late String hint;
  late bool obscuretext;
  
}

class EmailInput with InputMixin{
  EmailInput(){
    icon = Icons.person;
    title = "Email";
    controller = TextEditingController();
    label = "Digite seu Email";
    hint = "exemploemail@maua.br";
    obscuretext = false;
  }
}

class PasswordInput with InputMixin{
  PasswordInput(){
    icon = Icons.lock;
    title = "Senha";
    controller = TextEditingController();
    label = "Digite sua Senha";
    hint ="*********";
    obscuretext = true;
  }
}