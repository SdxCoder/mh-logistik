import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/result.dart';
import '../../utils/logger.dart';
import 'database_service.dart';

// R is data type
class FirebaseCrudService<R> {
  final String collection;
  final R Function(String, Map<String, dynamic>?) fromDS;
  final Map<String, dynamic> Function(R)? toMap;
  final DatabaseService<R> db;

  FirebaseCrudService(this.collection, {required this.fromDS, this.toMap})
      : db = DatabaseService<R>(collection, fromDS: fromDS, toMap: toMap);

  // Save interval timer
  // Returns 1 if record was added successfuly
  Future<Result<int>> save(Map<String, dynamic> data, {String? id}) async {
    //
    try {
      // Timeout is if the device is offline
      await db
          .create(data, id: id)
          .timeout(const Duration(seconds: 1), onTimeout: () {});

      return const Result.success(1);
    } on FirebaseException catch (e) {
      logger.e(e.toString(), null);
      return const Result.error("Something went wrong");
    } catch (e) {
      logger.e(e.toString(), null);
      return const Result.error("Something went wrong");
    }
  }

  /// Returns stream of data<R> for current user
  Stream<List<R>> stream() {
    return db.streamQueryList();
  }

  /// Returns list of data<R> for current user
  Future<List<R>> getList() async {
    return await db.getQueryList(
        source: Source.cache,
     );
  }

  /// Get data based on record id
  Future<Result<R>> getSingle(String id, {Source? source}) async {
    try {
      final result = await db.getSingle(id, source: source);

      return Result.success(result);
    } catch (e) {
     

      return const Result.error("Something went wrong");
    }
  }

  /// Updates timer
  /// Returns true if record is updated
  Future<Result<int>> update(String id, Map<String, dynamic> data) async {
    try {
      // Timeout is if the device is offline.
      await db
          .updateData(id, data)
          .timeout(const Duration(seconds: 1), onTimeout: () {});

     
        return const Result.success(1);
      
    } catch (e) {
    
      return const Result.error("Something went wrong");
    }
  }

  /// Deletes timer
  /// Returns 1 if successfuly deleted
  Future<Result<int>> delete(String id) async {
    try {
      await db.removeItem(id);
      return const Result.success(1);
    } catch (e) {
     
      return const Result.error("Something went wrong");
    }
  }
}
