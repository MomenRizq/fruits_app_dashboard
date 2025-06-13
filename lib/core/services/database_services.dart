abstract class DatabaseServices {
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? docId});
  Future<Map<String, dynamic>> getData(
      {required String path, required String docId});
  Future<bool> checkIfDataExist(
      {required String path, required String docId});

 
}
