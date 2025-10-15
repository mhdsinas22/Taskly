import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  final String id;
  final String taskText;
  final bool isCompleted;
  final Timestamp createdAt;
  final Timestamp updatedAt;

  TaskModel({
    required this.id,
    required this.taskText,
    required this.isCompleted,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Converts TaskModel instance to JSON for Firestore
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "taskText": taskText,
      "isCompleted": isCompleted,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
    };
  }

  /// Creates a TaskModel from Firestore DocumentSnapshot
  factory TaskModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snap) {
    final data = snap.data() ?? {};
    return TaskModel(
      id: snap.id,
      taskText: data["taskText"] as String? ?? "",
      isCompleted: data["isCompleted"] as bool? ?? false,
      createdAt: data["createdAt"] as Timestamp? ?? Timestamp.now(),
      updatedAt: data["updatedAt"] as Timestamp? ?? Timestamp.now(),
    );
  }
}
