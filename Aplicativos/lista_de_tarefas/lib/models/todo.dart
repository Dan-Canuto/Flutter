class Todo {
  Todo({required this.title, required this.ok});

  String title;
  bool ok;

  toJson() {
    return {
      'title': title,
      'ok': ok,
    };
  }
}
