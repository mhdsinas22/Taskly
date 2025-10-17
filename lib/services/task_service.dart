import 'dart:async';
import 'package:borading_week2/services/logger_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/task.dart';

const String TODO_COLLECTION_REF = "todos";

class TaskService {
  final CollectionReference<Map<String, dynamic>> _collection =
      FirebaseFirestore.instance.collection(TODO_COLLECTION_REF);

  final log = LoggerService();
  final StreamController<String> _searchController =
      StreamController<String>.broadcast();

  /// ✅ Add a new task (with title, description, and dueDate)
  Future<void> addTask(
    String title,
    String description,
    DateTime dueDate,
  ) async {
    final id = DateTime.now().millisecondsSinceEpoch.toString();
    final task = TaskModel(
      id: id,
      title: title,
      description: description,
      dueDate: Timestamp.fromDate(dueDate),
      createdAt: Timestamp.now(),
      isCompleted: false,
      updatedAt: Timestamp.now(),
    );

    await _collection.doc(id).set(task.toJson());
  }

  void setSearchTerm(String term) {
    _searchController.add(term);
  }

  /// ✅ Update the completion status
  Future<void> setCompleted(String docId, bool isCompleted) async {
    await _collection.doc(docId).update({"isCompleted": isCompleted});
  }

  /// ✅ Delete a task
  Future<void> deleteTask(String docId) async {
    await _collection.doc(docId).delete();
  }

  /// ✅ Fetch pending count
  Future<int> getPendingCount() async {
    final snapshot =
        await _collection.where('isCompleted', isEqualTo: false).get();
    return snapshot.docs.length;
  }

  /// ✅ Stream of pending tasks
  Stream<List<TaskModel>> pendingTasksStream() {
    return _collection
        .where('isCompleted', isEqualTo: false)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => TaskModel.fromSnapshot(doc)).toList(),
        );
  }

  Stream<int> pendingTasksCountStream() {
    return pendingTasksStream().map((list) => list.length);
  }

  /// ✅ Update a task’s data
  Future<void> updateTask(
    String id,
    String title,
    String description,
    Timestamp dueDate,
  ) async {
    await _collection.doc(id).update({
      "title": title,
      "description": description,
      "dueDate": dueDate,
      "updatedAt": Timestamp.now(),
    });
  }

  /// ✅ Stream of all tasks
  Stream<List<TaskModel>> tasksStream() {
    return _collection
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map(
          (query) =>
              query.docs.map((doc) => TaskModel.fromSnapshot(doc)).toList(),
        );
  }

  /// ✅ Fetch once (no realtime)
  Future<List<TaskModel>> fetchTasksOnce() async {
    final snapshot =
        await _collection.orderBy('createdAt', descending: true).get();
    return snapshot.docs.map((doc) => TaskModel.fromSnapshot(doc)).toList();
  }
}
