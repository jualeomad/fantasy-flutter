String parseTeamName(String input) {
  // Convertir a minúsculas y reemplazar espacios por guiones bajos
  String formatted = input.toLowerCase().replaceAll(' ', '_');

  // Reemplazar caracteres acentuados
  const accents = {
    'á': 'a',
    'é': 'e',
    'í': 'i',
    'ó': 'o',
    'ú': 'u',
    'ü': 'u',
    'ñ': 'n',
  };

  accents.forEach((accent, normal) {
    formatted = formatted.replaceAll(accent, normal);
  });

  return formatted;
}
