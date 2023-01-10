// ignore_for_file: avoid_print

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sitedi/app/data/database.dart';
import 'package:sitedi/app/integrations/firebase.dart';

const String uid = "id";
const String unama = "nama";
const String uavatar = "avatar";
const String urole = "role";
const String unis = "nis";
const String upw = "password";
const String utingkat = "tingkat";
const String ukelas = "kelas";

class UserModel {
  String? id;
  String? nama;
  String? avatar;
  String? role;
  String? nis;
  String? pw;
  String? tingkat;
  String? kelas;

  UserModel(
      {this.id,
      this.nama,
      this.avatar,
      this.role,
      this.nis,
      this.pw,
      this.kelas,
      this.tingkat});

  UserModel fromJson(DocumentSnapshot doc) {
    var json = doc.data() as Map<String, dynamic>?;
    return UserModel(
        id: doc.id,
        nama: json?[unama],
        avatar: json?[uavatar],
        role: json?[urole],
        nis: json?[unis],
        pw: json?[upw],
        kelas: json?[ukelas],
        tingkat: json?[utingkat]);
  }

  Map<String, dynamic> get toJson => {
        uid: id,
        unama: nama,
        uavatar: avatar,
        urole: role,
        unis: nis,
        upw: pw,
        ukelas: kelas,
        utingkat: tingkat
      };

  Database db = Database(
      collectionReference: firebaseFirestore.collection(
        usersCollection,
      ),
      storageReference: firebaseStorage.ref(usersCollection));

  Future<UserModel> save({File? file}) async {
    id == null ? id = await db.add(toJson) : await db.edit(toJson);
    if (file != null && id != null) {
      avatar = await db.upload(id: id!, file: file);
      db.edit(toJson);
    }
    return this;
  }

  Stream<UserModel> streamList(String? id) async* {
    yield* db.collectionReference.doc(id).snapshots().map((event) {
      return fromJson(event);
    });
  }

  // Stream<List<UserModel>> allstreamList() async* {
  //   yield* db.collectionReference.snapshots().map((query) {
  //     List<UserModel> list = [];
  //     for (var doc in query.docs) {
  //       list.add(
  //         UserModel().fromJson(
  //           doc,
  //         ),
  //       );
  //     }
  //     return list;
  //   });
  // }
}
