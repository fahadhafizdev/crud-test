import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_app/model/data_model.dart';

class DataService {
  CollectionReference _dataReference =
      FirebaseFirestore.instance.collection('data');

  Future<List<DataModel>> getData() async {
    try {
      QuerySnapshot result =
          await _dataReference.orderBy('name', descending: false).get();

      print('size ' + result.size.toString());

      List<DataModel> data = result.docs.map((e) {
        return DataModel.fromJson(
          e.id,
          e.data() as Map<String, dynamic>,
        );
      }).toList();

      return data;
    } catch (e) {
      throw e;
    }
  }

  Future<void> createData(DataModel data) async {
    try {
      _dataReference.add({
        'name': data.name,
        'url': data.url,
      });
    } catch (e) {
      throw e;
    }
  }

  Future<void> deleteData(String doc) async {
    try {
      _dataReference.doc(doc).delete();
    } catch (e) {
      throw e;
    }
  }

  Future<void> updateData(DataModel data, String doc) async {
    try {
      _dataReference.doc(doc).update({
        'name': data.name,
        'url': data.url,
      });
    } catch (e) {
      throw e;
    }
  }
}
