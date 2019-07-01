

class Employee {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Employee({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  factory Employee.fromJson(Map<String, dynamic> parsedJson) {
    return Employee(
        userId: parsedJson['userId'],
        id: parsedJson['id'],
        title: parsedJson['title'],
        completed: parsedJson['completed']);
  }
}
