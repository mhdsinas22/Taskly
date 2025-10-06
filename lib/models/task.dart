import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  final String id;
  final String tasktext;
  final bool iscomplted;
  final DateTime createadat;
  Task({
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

  factory Task.fromsnapshot(DocumentSnapshot<Map<String, dynamic>> snap) {
    final data = snap.data() ?? {};
    return Task(
      id: snap.id,
      tasktext: data["tasktext"] as String,
      createadat: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      iscomplted: data["isCompleted"] as bool? ?? false,
    );
  }
}
