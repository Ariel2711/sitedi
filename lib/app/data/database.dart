// ignore_for_file: body_might_complete_normally_nullable

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sitedi/app/integrations/firebase.dart';

Database dbApp = Database(
    collectionReference: firebaseFirestore.collection(usersCollection),
    storageReference: firebaseStorage.ref(usersCollection));

class Database {
  CollectionReference collectionReference;
  Reference storageReference = FirebaseStorage.instance.ref();
  Database({required this.collectionReference, required this.storageReference});

  Database childDB({required String id, required String collectionName}) =>
      Database(
          collectionReference:
              collectionReference.doc(id).collection(collectionName),
          storageReference: storageReference.child(id).child(collectionName));

  Future<String?> add(Map<String, dynamic> json) async {
    try {
      DocumentReference res = await collectionReference.add(json);
      return res.id;
    } on FirebaseException catch (e) {
      Get.snackbar(e.code, e.message ?? '');
    } catch (e) {
      Get.snackbar("Unknown Error", e.toString());
    }
  }

  Future<QuerySnapshot> get({String? sortBy, bool descending = false}) {
    var coll = sortBy.isEmptyOrNull
        ? collectionReference
        : collectionReference.orderBy(sortBy!, descending: descending);
    return coll.get();
  }

  Future<DocumentSnapshot> getID(String id) {
    return collectionReference.doc(id).get();
  }

  Stream<int> countDoc({Query? query}) {
    return (query ?? collectionReference)
        .snapshots()
        .map((event) => event.docs.length);
  }

  Stream<QuerySnapshot> snapshots({String? sortBy, bool descending = false}) {
    var coll = sortBy.isEmptyOrNull
        ? collectionReference
        : collectionReference.orderBy(sortBy!, descending: descending);
    return coll.snapshots();
  }

  Future edit(Map<String, dynamic> json) async {
    try {
      return await collectionReference.doc(json["id"]).update(json);
    } on FirebaseException catch (e) {
      Get.snackbar(e.code, e.message ?? '');
      rethrow;
    }
    // catch (e) {
    //   Get.snackbar("Unknown Error", e.toString());
    //   rethrow;
    // }
  }

  Future delete(String id, {String? url}) async {
    try {
      if (url is String) {
        await FirebaseStorage.instance.refFromURL(url).delete();
      }
      return await collectionReference.doc(id).delete();
    } on FirebaseException catch (e) {
      Get.snackbar(e.code, e.message ?? '');
      rethrow;
    } catch (e) {
      Get.snackbar("Unknown Error", e.toString());
      rethrow;
    }
  }

  Future<bool> checkMedia(String id) async {
    try {
      return storageReference
          .child(id)
          .getDownloadURL()
          .then((value) => !value.isEmptyOrNull);
    } on FirebaseException catch (tes) {
      print(tes.code);
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future deleteMedia(String id) async {
    try {
      storageReference.child(id).delete();
      toast("SUCCES DELETE MEDIA");
    } on FirebaseException catch (e) {
      Get.snackbar(e.code, e.message ?? '');
    } catch (e) {
      Get.snackbar("Unknown Error", e.toString());
    }
  }

  Future<String?> upload({required String id, required File file}) async {
    try {
      // String? url;
      // file = await compressImage(file);
      var task = await storageReference.child(id).putFile(file);
      if (task.state == TaskState.success) {
        return await storageReference.child(id).getDownloadURL();
      }

      Get.defaultDialog(
          middleText: "An error occured when uploading photo",
          textConfirm: "Try Again");
      // task.snapshotEvents.listen((event) async {
      //   if (event.state == TaskState.success) {
      //     return await storage.child(id).getDownloadURL();
      //   }
      // });

    } on FirebaseException catch (e) {
      Get.snackbar(e.code, e.message ?? '');
      rethrow;
    } catch (e) {
      Get.snackbar("Unknown Error", e.toString());
      rethrow;
    }
  }
}
