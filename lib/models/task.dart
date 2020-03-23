class Task {
  String taskName, description, comment, status;
  int id, rating;
  String creatorUsername, assignedUsername;
  int previousTaskID;
  String createdAt, updatedAt, endedAt;

  Task({
    this.id,
    this.taskName,
    this.description,
    this.creatorUsername,
    this.assignedUsername,
    this.previousTaskID,
    this.comment,
    this.status,
    this.rating,
    this.createdAt,
    this.updatedAt,
    this.endedAt,
  });

  factory Task.fromJson(dynamic json) {
    return Task(
      id: json['id'] as int,
      taskName: json['fullname'] as String,
      description: json['username'] as String,
      creatorUsername: json['creatorUsername'] as String,
      assignedUsername: json['assignedUsername'] as String,
      comment: json['comment'] as String,
      status: json['status'] as String,
      rating: json['rating'] as int,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      endedAt: json['endedAt'] as String,
    );
  }
}

Future<List<Task>> fetchTasks() async {
  Task task1 = Task(
      id: 1,
      taskName: 'Test API',
      description: 'Fully test the API.',
      creatorUsername: 'SpacePotato',
      assignedUsername: 'Mitsuki',
      status: 'In Progress');

  Task task2 = Task(
      id: 2,
      taskName: 'Update Documents',
      description: 'API Documentation',
      creatorUsername: 'SpacePotato',
      assignedUsername: 'Potato',
      status: 'Done');

  Task task3 = Task(
      id: 3,
      taskName: 'Deploy & Testing',
      previousTaskID: 1,
      description: 'When the API is tested, deploy it.',
      creatorUsername: 'SpacePotato',
      assignedUsername: 'Potato1234',
      status: 'In Progress');
  List<Task> list = List();
  list.add(task1);
  list.add(task2);
  list.add(task3);

  return list;
}
