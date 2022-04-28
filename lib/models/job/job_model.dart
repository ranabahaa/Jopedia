class PostDataModel {
  //late final String JOB_ID;
  late String DISCREPTION;
  late String JOB_LOCATION;
  late String JOB_TITLE;
  late String JOB_SALARY;
  //late final String USER_ID;
  //late final String WORKER_ID;
  //late final String COMPLETED_JOB;

  PostDataModel({
    //required this.JOB_ID,
    required this.DISCREPTION,
    required this.JOB_LOCATION,
    required this.JOB_TITLE,
    required this.JOB_SALARY,
    //required this.USER_ID,
    //required this.WORKER_ID,
    //required this.COMPLETED_JOB,

  });

  PostDataModel.fromJson(Map<String, dynamic> json) {
    //JOB_ID = json['JOB_ID'] ?? '';
    DISCREPTION = json['DISCREPTION'] ?? '';
    JOB_LOCATION = json['JOB_LOCATION'] ?? '';
    JOB_TITLE = json['JOB_TITLE'] ?? '';
    JOB_SALARY = json['JOB_SALARY'] ?? '';
    //USER_ID = json['USER_ID'] ?? '';
    //WORKER_ID = json['WORKER_ID'] ?? '';
    //COMPLETED_JOB = json['COMPLETED_JOB'] ?? '';

  }

  Map<String, dynamic> toJson() {
    return {
      //'JOB_ID': JOB_ID,
      'DISCREPTION': DISCREPTION,
      'JOB_LOCATION': JOB_LOCATION,
      'JOB_TITLE': JOB_TITLE,
      'JOB_SALARY': JOB_SALARY,
      //'USER_ID': USER_ID,
      //'WORKER_ID': WORKER_ID,
      //'COMPLETED_JOB': COMPLETED_JOB,
    };
  }
}