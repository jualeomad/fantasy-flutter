class Partido {
  final int jornada;
  final String local;
  final int golesLocal;
  final int golesVisitante;
  final String visitante;

  static final Map<String, String> map = {
    'Athletic Club': 'athletic',
    'Betis': 'betis',
    'Celta Vigo': 'celta',
    'Las Palmas': 'las_palmas',
    'Osasuna': 'osasuna',
    'Valencia': 'valencia',
    'Real Sociedad': 'real_sociedad',
    'Mallorca': 'mallorca',
    'Valladolid': 'valladolid',
    'Villarreal': 'villarreal',
    'Sevilla': 'sevilla',
    'Barcelona': 'barcelona',
    'Espanyol': 'espanyol',
    'Getafe': 'getafe',
    'Real Madrid': 'real_madrid',
    'Leganés': 'leganes',
    'Alavés': 'alaves',
    'Atlético Madrid': 'atletico',
    'Rayo Vallecano': 'rayo',
    'Girona': 'girona', 
  };

  Partido({
    required this.jornada,
    required this.local,
    required this.golesLocal,
    required this.golesVisitante,
    required this.visitante,
  });

  // Método para convertir el JSON en un objeto Partido
  factory Partido.fromJson(Map<String, dynamic> json) {
    return Partido(
      jornada: json['jornada'],
      local: map[json['local']] ??
          json['local'], // Usa el nombre original si no está en el map
      golesLocal: json['goles_local'],
      golesVisitante: json['goles_visitante'],
      visitante: map[json['visitante']] ?? json['visitante'], // Lo mismo aquí
    );
  }
}
