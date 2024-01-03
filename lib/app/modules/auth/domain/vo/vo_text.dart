class VoText {
  final String _value;

  VoText(this._value);

  String get value => _value;

  String? validate([String? label = "texto"]) {
    if (value.isEmpty) {
      return "Por favor preencha $label, está vazio";
    }
    return null;
  }
}
