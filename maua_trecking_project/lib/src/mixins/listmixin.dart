import 'package:flutter/material.dart';

mixin ListaMixin {
  final List<String> ratitulos = [
    'RA Líder',
    'RA Companheiro 1',
    'RA Companheiro 2',
    'RA Companheiro 3',
    'RA Companheiro 4'
  ];

  final List<IconData> raicones = [
    Icons.person,
    Icons.group,
    Icons.group,
    Icons.group,
    Icons.group
  ];

  final List<TextEditingController> controllers = List.generate(5, (_) => TextEditingController());
}