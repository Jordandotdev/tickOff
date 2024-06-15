Future<Map<String, dynamic>> getAboutData() async {
  await Future.delayed(Duration(seconds: 1));
  return {'title': 'Example Title', 'description': 'Example Description'};
}
