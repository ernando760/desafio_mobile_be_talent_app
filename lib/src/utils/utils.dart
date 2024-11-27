String formatDate(DateTime date) {
  final day = date.day.toString().padLeft(2, "0");
  final month = date.month.toString().padLeft(2, "0");
  final year = date.year.toString();
  return "$day/$month/$year";
}

String formatPhoneNumber(String phoneNumber) {
  if (phoneNumber.length != 13) {
    throw const FormatException(
        'Número de telefone inválido. Esperado 13 dígitos.');
  }

  final countryCode = phoneNumber.substring(0, 2); // +55
  final areaCode = phoneNumber.substring(2, 4); // 55
  final firstPart = phoneNumber.substring(4, 9); // 55555
  final secondPart = phoneNumber.substring(9, 13); // 5555

  return '+$countryCode ($areaCode) $firstPart-$secondPart';
}
