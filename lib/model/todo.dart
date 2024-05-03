
class ToDo {
  final String id;
  final String todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  factory ToDo.fromMap(Map<String, dynamic> map) {
    return ToDo(
      id: map['id'],
      todoText: map['todoText'],
      isDone: map['isDone'] == 1, // Convert from SQLite INTEGER to bool
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'todoText': todoText,
      'isDone': isDone ? 1 : 0, // Convert bool to SQLite INTEGER
    };
  }

  // Add any additional methods or properties here as needed
}
