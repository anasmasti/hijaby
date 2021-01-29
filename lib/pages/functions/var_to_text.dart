boolNewToText(bool theVar){
  String result;
  // ignore: unrelated_type_equality_checks
  if (theVar == true) {
    result = 'New';
  } else {
    result = 'Trend';
  }
  return result;
}