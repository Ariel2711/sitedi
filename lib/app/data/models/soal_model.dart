import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sitedi/app/data/database.dart';
import 'package:sitedi/app/integrations/firebase.dart';

const String sid = 'id';
const String snomer = 'nomer';
const String ssoal = 'soal';
const String simage = 'image';
const String spilihan_jawaban = "pilihan_jawaban";
const String sjawaban_siswa = "jawaban_siswa";
const String skunci_jawaban = "kunci_jawaban";

void getidParent() {}

class SoalModel {
  String? id;
  int? nomer;
  String? soal;
  String? image;
  List<String>? pilihanJawaban;
  String? jawabanSiswa;
  String? kunciJawaban;

  SoalModel(
      {this.id,
      this.nomer,
      this.soal,
      this.image,
      this.pilihanJawaban,
      this.kunciJawaban,
      this.jawabanSiswa});

  SoalModel fromJson(DocumentSnapshot doc) {
    var json = doc.data() as Map<String, dynamic>?;
    return SoalModel(
        id: doc.id,
        nomer: json?[snomer],
        soal: json?[ssoal],
        image: json?[simage],
        pilihanJawaban: (json?[spilihan_jawaban] as List?)
            ?.map((e) => e.toString())
            .toList(),
        jawabanSiswa: json?[sjawaban_siswa],
        kunciJawaban: json?[skunci_jawaban]);
  }

  Map<String, dynamic> get toJson => {
        sid: id,
        snomer: nomer,
        ssoal: soal,
        simage: image,
        spilihan_jawaban: pilihanJawaban,
        sjawaban_siswa: jawabanSiswa,
        skunci_jawaban: kunciJawaban
      };

  Database db = Database(
      collectionReference: firebaseFirestore
          .collection(
            ujianCollection,
          )
          .doc()
          .collection(soalCollection),
      storageReference: firebaseStorage.ref(soalCollection));

  Future<SoalModel> save({File? file}) async {
    id == null ? id = await db.add(toJson) : await db.edit(toJson);
    if (file != null && id != null) {
      image = await db.upload(id: id!, file: file);
      db.edit(toJson);
    }
    return this;
  }

  Stream<SoalModel> streamList(String? id) async* {
    yield* db.collectionReference.doc(id).snapshots().map((event) {
      return fromJson(event);
    });
  }

  Stream<List<SoalModel>> allstreamList() async* {
    yield* db.collectionReference.snapshots().map((query) {
      List<SoalModel> list = [];
      for (var doc in query.docs) {
        list.add(
          SoalModel().fromJson(
            doc,
          ),
        );
      }
      return list;
    });
  }
}
