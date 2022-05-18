import 'package:flutter/foundation.dart';

class MyTask {
  final String id;
  final String name;
  final String description;
  final DateTime creationDate;
  final DateTime expectedDate;

  MyTask({
    required this.id,
    required this.name,
    required this.description,
    required this.creationDate,
    required this.expectedDate,
  });
}
