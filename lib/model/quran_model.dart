// ignore_for_file: public_member_api_docs, sort_constructors_first
class Quran {
  int number;
  String name;
  String englishName;
  String englishNameTranslation;

  List<Ayat> ayahs;
  Quran({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.ayahs,
  });

  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'name': name,
      'englishName': englishName,
      'englishNameTranslation': englishNameTranslation,
      'ayat': ayahs.map((ayah) => ayah.toJson()).toList(),
    };
  }

  factory Quran.fromJsom(Map<String, dynamic> json) {
    var ayats = json['ayahs'] as List;
    List<Ayat> ayahs = ayats.map((e) => Ayat.fromJson(e)).toList();
    return Quran(
        number: json['number'],
        name: json['name'],
        englishName: json['englishName'],
        englishNameTranslation: json['englishNameTranslation'],
        ayahs: ayahs);
  }
}

class Ayat {
  int number;
  String text;
  int numberInSurah;
  int juz;
  int page;
  int ruku;
  Ayat({
    required this.number,
    required this.text,
    required this.numberInSurah,
    required this.juz,
    required this.page,
    required this.ruku,
  });

  factory Ayat.fromJson(Map<String, dynamic> json) {
    return Ayat(
        number: json['number'],
        text: json['text'],
        numberInSurah: json['numberInSurah'],
        juz: json['juz'],
        page: json['page'],
        ruku: json['ruku']);
  }

  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'text': text,
      'numberInSurah': numberInSurah,
      'juz': juz,
      'page': page
    };
  }
}
