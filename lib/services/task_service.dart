import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/task.dart';

/// Service layer for handling Firestore CRUD operations on tasks.
/// Keeps all Firebase logic separated from UI/Bloc.
class TaskService {
  /// Reference to the `tasks` collection in Firestore
  final CollectionReference<Map<String, dynamic>> _collection =
      FirebaseFirestore.instance.collection("tasks");

  /// Add a new task
  Future<void> addTask(String text) async {
    final task = {
      "taskText": text,
      "isCompleted": false,
      "createdAt": Timestamp.now(),
    };
    await _collection.add(task);
  }

  /// Update the completion status of a task
  Future<void> setCompleted(String docId, bool isCompleted) async {
    await _collection.doc(docId).update({"isCompleted": isCompleted});
  }

  /// Delete a task by document ID
  Future<void> deleteTask(String docId) async {
    await _collection.doc(docId).delete();
  }

  /// Update the text of a task
  Future<void> updateTask(String docId, String taskText) async {
    await _collection.doc(docId).update({"taskText": taskText});
  }

  /// Listen to a realtime stream of tasks (ordered by createdAt desc)
  Stream<List<TaskModel>> tasksStream() {
    return _collection
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map(
          (query) =>
              query.docs.map((doc) => TaskModel.fromsnapshot(doc)).toList(),
        );
  }

  /// Fetch tasks once (without realtime updates)
  Future<List<TaskModel>> fetchTasksOnce() async {
    final snapshot =
        await _collection.orderBy('createdAt', descending: true).get();
    return snapshot.docs.map((doc) => TaskModel.fromsnapshot(doc)).toList();
  }
}
