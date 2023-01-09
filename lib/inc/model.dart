import 'package:flutter/foundation.dart';

class SelectModel {
  int? id;
  String? displayName;
  bool selected = false;

  SelectModel({this.id, this.displayName});

  factory SelectModel.fromJson(Map<String, dynamic> json) {
    return SelectModel(id: json['ID'], displayName: json['DISPLAY_NAME']);
  }

  @override
  String toString() {
    return '{ $displayName }';
  }
}
