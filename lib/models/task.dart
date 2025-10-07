import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  final String id;
  final String tasktext;
  final bool iscomplted;
  final DateTime createadat;
  TaskModel({
    required this.id,
    required this.tasktext,
    required this.createadat,
    required this.iscomplted,
  });
  Map<String, dynamic> tojson() {
    return {
      "tasktext": tasktext,
      "isCompeleted": iscomplted,
      "createdAt": Timestamp.fromDate(createadat), // store as Timestamp
    };
  }

  factory TaskModel.fromsnapshot(DocumentSnapshot<Map<String, dynamic>> snap) {
    final data = snap.data() ?? {};
    return TaskModel(
      id: snap.id,
      tasktext: data["tasktext"] as String,
      createadat: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      iscomplted: data["isCompleted"] as bool? ?? false,
    );
  }
}
