import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  final String id;
  final String tasktext;
  final bool iscomplted;
  final Timestamp createadat;
  final Timestamp updatedon;
  TaskModel({
    required this.id,
    required this.tasktext,
    required this.createadat,
    required this.iscomplted,
    required this.updatedon,
  });
  Map<String, dynamic> tojson() {
    return {
      "id": id,
      "taskText": tasktext,
      "isCompleted": iscomplted,
      "createdAt": createadat, // store as Timestamp
      "updatedAt": updatedon,
    };
  }

  factory TaskModel.fromsnapshot(DocumentSnapshot<Map<String, dynamic>> snap) {
    final data = snap.data() ?? {};
    return TaskModel(
      id: snap.id,
      tasktext: data["taskText"] as String,
      createadat: data['createdAt'] as Timestamp,
      updatedon: data["updatedAt"] as Timestamp,
      iscomplted: data["isCompleted"] as bool? ?? false,
    );
  }
}
