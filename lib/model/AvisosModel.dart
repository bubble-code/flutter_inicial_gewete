class AvisosModel {
  final String comunidad, detalles, fecha, prioridad;

  AvisosModel(
      {required this.comunidad,
      required this.detalles,
      required this.fecha,
      required this.prioridad});
  factory AvisosModel.fromMap(Map data) {
    return AvisosModel(
        comunidad: data["comunidad"] ?? "",
        detalles: data["detalles"] ?? '',
        fecha: data["fecha"] ?? '',
        prioridad: data["prioridad"] ?? '');
  }
}
