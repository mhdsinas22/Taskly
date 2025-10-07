import 'package:borading_week2/services/logger_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/task.dart';

// ignore: constant_identifier_names
const String TODO_COLLECTION_REF = "todos";

/// Service layer for handling Firestore CRUD operations on tasks.
/// Keeps all Firebase logic separated from UI/Bloc.
class TaskService {
  /// Reference to the `tasks` collection in Firestore
  final CollectionReference<Map<String, dynamic>> _collection =
      FirebaseFirestore.instance.collection(TODO_COLLECTION_REF);
  final log = LoggerService(); // Singleton instance

  /// Add a new task
  Future<void> addTask(String text) async {
    final id = DateTime.now().millisecondsSinceEpoch.toString();
    final task = TaskModel(
      id: id,
      tasktext: text,
      createadat: Timestamp.now(),
      iscomplted: false,
      updatedon: Timestamp.now(),
    );

    log.i("🔥 Adding Task: ${task.tojson()}"); // info

    try {
      await _collection.doc(id).set(task.tojson());
      log.i("✅ Task added successfully");
    } catch (e, stack) {
      log.e("❌ Firestore add failed", e, stack);
    }
  }

  /// Update the completion status of a task
  Future<void> setCompleted(String docId, bool isCompleted) async {
    await _collection.doc(docId).update({"isCompleted": isCompleted});
  }

  /// Delete a task by document ID
  Future<void> deleteTask(String docId) async {
    await _collection.doc(docId).delete();
  }

  // **New function: first fetch pending tasks count**
  Future<int> getPendingCount() async {
    final snapshot =
        await _collection.where('isCompleted', isEqualTo: false).get();
    return snapshot.docs.length;
  }

  /// Stream of only pending tasks (List<TaskModel>)
  Stream<List<TaskModel>> pendingTasksStream() {
    return _collection
        .where('isCompleted', isEqualTo: false) // pending tasks mathram
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => TaskModel.fromsnapshot(doc)).toList(),
        );
  }

  /// Stream of pending tasks count
  Stream<int> pendingTasksCountStream() {
    return pendingTasksStream().map((list) => list.length);
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
