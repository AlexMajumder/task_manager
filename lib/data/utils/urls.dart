class Urls {
  static const _baseUrl = 'http://35.73.30.144:2005/api/v1';
  static const registration = '$_baseUrl/Registration';
  static const loginUrl = '$_baseUrl/Login';
  static const addNewTask = '$_baseUrl/createTask';
  static const newTaskList = '$_baseUrl/listTaskByStatus/New';
  static const completedTaskList = '$_baseUrl/listTaskByStatus/Completed';
  static const taskStatusCount = '$_baseUrl/taskStatusCount';
  static const updateProfile = '$_baseUrl/ProfileUpdate';

  static changeStatus(String taskID, String status) =>
      '$_baseUrl/updateTaskStatus/$taskID/$status';
  static deleteTask(String taskID) => '$_baseUrl/deleteTask/$taskID';
}
