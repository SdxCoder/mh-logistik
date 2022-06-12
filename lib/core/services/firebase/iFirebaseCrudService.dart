import 'package:cloud_firestore/cloud_firestore.dart';
import '../../exceptions/exceptions.dart';
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

  // Save data
  // If fails, throws exception
  Future<bool> save(Map<String, dynamic> data, {String? id}) async {
    //
    try {
      await db.create(data, id: id);

      return true;
    } on FirebaseException catch (e) {
      logger.e(null, e);
      logger.e(null, e.code);

      if (e.code == "permission-denied") {
        throw PermissionDeniedException;
      }

      rethrow;
    } catch (e) {
      logger.e(null, e);
      rethrow;
    }
  }

  /// Returns stream of data<R> for current user
  Stream<List<R>> stream({List<QueryArgs> args = const [],}) {
    return db.streamQueryList(
      args: args
    );
  }

  /// Returns list of data<R> for current user
  Future<List<R>> getList(
      {List<QueryArgs> args = const [],
      List<OrderBy>? orderBy,
      int? limit,
      Source? source}) async {
    return await db.getQueryList(
        source: source ?? Source.serverAndCache,
        args: [...args],
        orderBy: orderBy,
        limit: limit);
  }

  /// Get data based on record id
  Future<R> getSingle(String id, {Source? source}) async {
    try {
      final result = await db.getSingle(id, source: source);

      if (result == null) {
        throw NoDataException();
      }

      return result;
    } catch (e) {
      logger.e(null, e);

      rethrow ;
    }
  }

  /// Updates timer
  /// Returns true if record is updated
  Future<bool> update(String id, Map<String, dynamic> data) async {
    try {
      // Timeout is if the device is offline.
      await db.updateData(id, data);

      return true;
    } catch (e) {
      logger.e(null, e);

      rethrow ;
    }
  }

  /// Deletes timer
  /// Returns true if successfuly deleted
  Future<bool> delete(String id) async {
    try {
      await db.removeItem(id);
      return true;
    } catch (e) {
      logger.e(null, e);
      rethrow;
    }
  }
}
