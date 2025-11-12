abstract class DatabaseServices {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  });

  Future<dynamic> getData({
    required String path,
    String? docId,
    Map<String, dynamic>? query,
  });
  Future<Map<String, dynamic>> getDataWithOrder({required String path});

  Stream<dynamic> getStreamData({
    required String path,
    Map<String, dynamic>? query,
  });

  Future<void> updateData({
    required String path,
    required Map<String, dynamic> data,
    required String documentId,
  });

  Future<bool> checkDataExists({required String path, required String userId});
}
