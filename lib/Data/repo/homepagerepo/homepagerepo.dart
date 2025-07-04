class Homepagerepo {
  Future<List<Map<String, dynamic>>> getData() async {
    try {
      return [
        {"name": "Hari Raval", "age": "21"},
        {"name": "Kashyap Raval", "age": "22"},
      ];
    } catch (e) {
      rethrow;
    }
  }
}
