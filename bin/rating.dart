// import 'package:rating/rating.dart' as rating;
import 'package:collection/collection.dart';

void main(List<String> arguments) {
  Map<String, double> rating = {};
  double totalRating = 0;

  for (int i = 0; i < restaurantes.length; i++) {
    var restaurante = restaurantes.elementAt(i);
    var tipo = restaurante['tipo'];

    if (!rating.containsKey(tipo)) {
      var restaurantesTipo = restaurantes.where((r) => r['tipo'] == tipo);
      List<int> calificaciones = [];

      for (int j = 0; j < restaurantesTipo.length; j++) {
        calificaciones.addAll(restaurantesTipo.elementAt(j)['calificaciones']);
      }

      rating.addAll({ tipo: calificaciones.sum / calificaciones.length });
      totalRating += calificaciones.sum / calificaciones.length;
    }
  }

  rating.addAll({ 'totalRating': totalRating / rating.length });
  print(rating);
}

Set restaurantes = {
  {
    'nombre': 'El novillo alegre',
    'tipo': 'Argentina',
    'calificaciones': [4, 5, 2, 1, 2]
  },
  {
    'nombre': 'Mario Brothers',
    'tipo': 'Italiana',
    'calificaciones': [4, 3, 2, 1, 1]
  },
  {
    'nombre': 'Baires Grill',
    'tipo': 'Argentina',
    'calificaciones': [3, 1, 3, 5, 5, 2, 3]
  },
  {
    'nombre': 'Molto bene',
    'tipo': 'Italiana',
    'calificaciones': [4, 3, 1, 1, 5]
  },
  {
    'nombre': 'Molto bene',
    'tipo': 'Venezolana',
    'calificaciones': [4, 3, 1, 1, 5]
  }
};
