
// import 'firebase_service.dart';

// class FirestoreDatabase { 
//   // FirestoreDatabase({required this.uid}) : assert(uid != null);
//   // final String uid;

//   final _firestoreService = FirestoreService.instance;

//   //Method to create/update todoModel
//   // Future<void> setTodo(TodoModel todo) async => await _firestoreService.set(
//   //       path: FirestorePath.todo(uid, todo.id),
//   //       data: todo.toMap(),
//   //     );

//   //Method to delete todoModel entry
//   // Future<void> deleteTodo(TodoModel todo) async {
//   //   await _firestoreService.deleteData(path: FirestorePath.todo(uid, todo.id));
//   // }

//   //Method to retrieve todoModel object based on the given todoId
//   Stream<int> totalAveriasStream() =>
//       _firestoreService.documentStream(
//         path: FirestorePath.todo(uid, todoId),
//         builder: (data, documentId) => TodoModel.fromMap(data, documentId),
//       );

//   //Method to retrieve all todos item from the same user based on uid
//   Stream<List<TodoModel>> todosStream() => _firestoreService.collectionStream(
//         path: FirestorePath.todos(uid),
//         builder: (data, documentId) => TodoModel.fromMap(data, documentId),
//       );

//   //Method to mark all todoModel to be complete
//   Future<void> setAllTodoComplete() async {
//     final batchUpdate = FirebaseFirestore.instance.batch();

//     final querySnapshot = await FirebaseFirestore.instance
//         .collection(FirestorePath.todos(uid))
//         .get();

//     for (DocumentSnapshot ds in querySnapshot.docs) {
//       batchUpdate.update(ds.reference, {'complete': true});
//     }
//     await batchUpdate.commit();
//   }

//   Future<void> deleteAllTodoWithComplete() async {
//     final batchDelete = FirebaseFirestore.instance.batch();

//     final querySnapshot = await FirebaseFirestore.instance
//         .collection(FirestorePath.todos(uid))
//         .where('complete', isEqualTo: true)
//         .get();

//     for (DocumentSnapshot ds in querySnapshot.docs) {
//       batchDelete.delete(ds.reference);
//     }
//     await batchDelete.commit();
//   }
// }