

import 'package:dio/dio.dart';

class StudentData {
  final String firstName;
  final String lastName;
  final String course;
  final int score;
  final String createdAt;
  final String updatedAt;

  StudentData(this.firstName, this.lastName, this.course, this.score,
      this.createdAt, this.updatedAt);

  StudentData.fronJson(Map<String, dynamic> json)
      : firstName = json['first_name'],
        lastName = json['last_name'],
        course = json['course'],
        score = json['score'],
        createdAt = json['created_at'],
        updatedAt = json['updated_at'];
}

class Httpclient {
  static Dio dio =
      Dio(BaseOptions(baseUrl: 'http://expertdevelopers.ir/api/v1/'));
}

Future<List<StudentData>> getStudent() async {
  final response = await Httpclient.dio.get('experts/student');
  final List<StudentData> students = [];
  if (response.data is List<dynamic>) {
    (response.data as List<dynamic>).forEach((element) {
      students.add(StudentData.fronJson(element));
    });
  }
  return students;
}

Future<StudentData> saveStudent(
    String firstName, String lastname, String course, int score) async {
  final response = await Httpclient.dio.post('experts/student', data: {
    'first_name': firstName,
    'last_name': lastname,
    'course': course,
    'score': score
  });
  if (response.statusCode == 200) {
    return StudentData.fronJson(response.data);
  } else {
    return throw Exception();
  }
}
