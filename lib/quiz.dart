// quiz_data.dart

class Question {
  final String question;
  final bool answer;

  Question(this.question, this.answer);
}

List<Question> questions = [
  Question('Flutter es un lenguaje de programación?', false),
  Question('Dart es el lenguaje de programación utilizado en Flutter?', true),
  Question('Flutter es un framework de código abierto desarrollado por Google?', true),
  Question('Dart es un lenguaje de programación creado por Apple?', false),
  Question('Flutter utiliza el motor de renderizado Skia para mostrar la interfaz de usuario?', true),
  Question('Dart se inspiró en varios lenguajes de programación, incluyendo Java, JavaScript y C#?', true),
  Question('Dart es un lenguaje compilado a código nativo antes de ser ejecutado?', true),

];
