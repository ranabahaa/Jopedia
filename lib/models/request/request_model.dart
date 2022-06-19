class RequestDataModel {
  late String JOB_SALARY;
  late String USER_ID;
  late String WORKER_ID;
  late String JOB_ID;
  late String JOB_TITLE;
  late String name;

  RequestDataModel({
    required this.JOB_ID,
    required this.JOB_SALARY,
    required this.USER_ID,
    required this.WORKER_ID,
    required this.JOB_TITLE,
    required this.name,
  });

  RequestDataModel.fromJson(Map<String, dynamic>? json, String? id) {
    JOB_ID = json?['JOB_ID'] ?? '';
    JOB_SALARY = json?['JOB_SALARY'] ?? '';
    USER_ID = json?['USER_ID'] ?? '';
    WORKER_ID = json?['WORKER_ID'] ?? '';
    JOB_TITLE = json?['JOB_TITLE'] ?? '';
    name = json?['name'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      'JOB_ID': JOB_ID,
      'JOB_SALARY': JOB_SALARY,
      'USER_ID': USER_ID,
      'WORKER_ID': WORKER_ID,
      'name': name,
      'JOB_TITLE' : JOB_TITLE,
    };
  }
}