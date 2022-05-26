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
  late String JOBID;
  late bool MORE_THAN_DAY;
  late String USER_ID;
  late String WORKER_ID ="";
  late String COMPLETED_JOB = "1";
  late String IMAGE;
  late String USER_RATE="";
  late String WORKER_RATE ="";
  late String USER_REVIEW="";
  late String WORKER_REVIEW ="";
  late String FLAG='0';

  PostDataModel({
    required this.JOBID,
    required this.DISCREPTION,
    required this.JOB_LOCATION,
    required this.JOB_TITLE,
    required this.JOB_SALARY,
    required this.StartDate,
    required this.EndDate,
    required this.StartTime,
    required this.EndTime,
    required this.PostTime,
    required this.MORE_THAN_DAY,
    required this.USER_ID,
    required this.WORKER_ID,
    this.IMAGE = "",
  });

  PostDataModel.fromJson(Map<String, dynamic>? json, String? id) {
    JOBID = id ?? '';
    DISCREPTION = json?['DISCREPTION'] ?? '';
    JOB_LOCATION = json?['JOB_LOCATION'] ?? '';
    JOB_TITLE = json?['JOB_TITLE'] ?? '';
    JOB_SALARY = json?['JOB_SALARY'] ?? '';
    StartDate = json?['StartDate'] ?? '';
    EndDate = json?['EndDate'] ?? '';
    StartTime = json?['StartTime'] ?? '';
    EndTime = json?['EndTime'] ?? '';
    PostTime = json?['PostTime'] ?? '';
    USER_ID = json?['USER_ID'] ?? '';
    MORE_THAN_DAY = json?['MORE_THAN_DAY'] ?? true;
    WORKER_ID = json?['WORKER_ID'] ?? '';
    COMPLETED_JOB = json?['COMPLETED_JOB'] ?? '';
    IMAGE = json?['IMAGE'] ?? '';

    USER_RATE= json?['USER_RATE'] ?? '';
    WORKER_RATE = json?['WORKER_RATE'] ?? '';
    USER_REVIEW= json?['USER_REVIEW'] ?? '';
    WORKER_REVIEW = json?['WORKER_REVIEW'] ?? '';
    FLAG= json?['FLAG'] ?? '';
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
      'MORE_THAN_DAY' : MORE_THAN_DAY ,
      'USER_ID': USER_ID,
      'WORKER_ID': WORKER_ID,
      'COMPLETED_JOB': COMPLETED_JOB,
      'IMAGE': IMAGE,
      'USER_RATE': USER_RATE,
      'WORKER_RATE': WORKER_RATE,
      'USER_REVIEW': USER_REVIEW ,
      'WORKER_REVIEW' : WORKER_REVIEW ,
      'FLAG': FLAG ,
    };
  }
}