import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  final String id;
  final String title; // 👈 Task title
  final String description; // 👈 Task description
  final Timestamp dueDate; // 👈 Task due date
  final bool isCompleted;
  final Timestamp createdAt;
  final Timestamp updatedAt;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.isCompleted,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Converts TaskModel instance to JSON for Firestore
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "dueDate": dueDate,
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
      title: data["title"] as String? ?? "",
      description: data["description"] as String? ?? "",
      dueDate: data["dueDate"] as Timestamp? ?? Timestamp.now(),
      isCompleted: data["isCompleted"] as bool? ?? false,
      createdAt: data["createdAt"] as Timestamp? ?? Timestamp.now(),
      updatedAt: data["updatedAt"] as Timestamp? ?? Timestamp.now(),
    );
  }
}
