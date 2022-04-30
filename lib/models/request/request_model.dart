class RequestDataModel {
  late String JOB_SALARY;
  late String USER_ID;
  late String WORKER_ID;
  late String JOB_ID;

  RequestDataModel({
    required this.JOB_ID,
    required this.JOB_SALARY,
    required this.USER_ID,
    required this.WORKER_ID,
  });

  RequestDataModel.fromJson(Map<String, dynamic> json) {
    JOB_ID = json['JOB_ID'] ?? '';
    JOB_SALARY = json['JOB_SALARY'] ?? '';
    USER_ID = json['USER_ID'] ?? '';
    WORKER_ID = json['WORKER_ID'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      'JOB_ID': JOB_ID,
      'JOB_SALARY': JOB_SALARY,
      'USER_ID': USER_ID,
      'WORKER_ID': WORKER_ID,
    };
  }
}