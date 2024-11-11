class Gasto {
  final String _nombre;
  final double _cantidad;
  final String _descripcion;

  Gasto(this._nombre, this._cantidad, this._descripcion);
  String get nombre => _nombre;
  double get cantidad => _cantidad;
  String get descripcion => _descripcion;
}
