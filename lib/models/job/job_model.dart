class PostDataModel {
  //late final String JOB_ID;
  late String DISCREPTION;
  late String JOB_LOCATION;
  late String JOB_TITLE;
  late String JOB_SALARY;
  late String StartDate;
  late String EndDate;
  late String StartTime;
  late String EndTime;
  late String PostTime;
  //late final String USER_ID;
  //late final String WORKER_ID;
  //late final String COMPLETED_JOB;

  PostDataModel({
    //required this.JOB_ID,
    required this.DISCREPTION,
    required this.JOB_LOCATION,
    required this.JOB_TITLE,
    required this.JOB_SALARY,
    required this.StartDate,
    required this.EndDate,
    required this.StartTime,
    required this.EndTime,
    required this.PostTime,
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
    StartDate = json['StartDate'] ?? '';
    EndDate = json['EndDate'] ?? '';
    StartTime = json['StartTime'] ?? '';
    EndTime = json['EndTime'] ?? '';
    PostTime = json['PostTime'] ?? '';
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
      'StartDate': StartDate,
      'EndDate': EndDate,
      'StartTime': StartTime,
      'EndTime': EndTime,
      'PostTime' : PostTime ,
      //'USER_ID': USER_ID,
      //'WORKER_ID': WORKER_ID,
      //'COMPLETED_JOB': COMPLETED_JOB,
    };
  }
}