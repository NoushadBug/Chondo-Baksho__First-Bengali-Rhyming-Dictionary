import 'package:flutter/material.dart';

class Backend extends StatefulWidget {
  final String data;

  Backend({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  _BackendState createState() => _BackendState();
}

class _BackendState extends State<Backend> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('সিলেবল কাউন্টার'),
      ),
      body: Center(
        child: Text(
          widget.data +
              ' শব্দের সিলেবল সংখ্যা ' +
              (Syllable(widget.data).syllableCounter().toString()),
          style: TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }
}

//
//
// syllable algo part

class Syllable {
  var snrVowels = ['অ', 'আ', 'ই', 'ঈ', 'উ', 'ঊ', 'ঋ', 'এ', 'ঐ', 'ও', 'ঔ'];
  var vowels = [
    "য়",
    "া",
    "ি",
    "ী",
    "ু",
    "ূ",
    "ৃ",
    "ে",
    "ৈ",
    "ঁ",
    "ো",
    "ৌ",
    "্",
    "়",
    "ৗ",
    "্য",
    "্র",
    "ঙ",
    "ং"
  ];
  var exc = ["া", "ে", "ো", "ূ", "ু", "ৈ", "়", "্"];
  int syllable = 0;
  bool vowelCheck = false;
  var vowelPattern = Map();

  var a = ["প", "ফ", "ভ", "ব", "ম"];
  var b = ["ক", "খ", "গ", "ঘ", "হ", "ঞ"];
  var c = ["চ", "ছ", "জ", "ঝ", "শ", "য", "ষ"];
  var d = ["ত", "ৎ", "থ", "দ", "ধ", "ন", "ল", "স"];
  var e = ["ট", "ঠ", "ড", "ঢ", "ণ", "র", "ড়", "ঢ়"];

  String x, vowelFreeWord;

  backend(String x) {
    this.x = x;
    vowelFreeWord = x;
    for (int i = 0; i < vowelFreeWord.length; i++) {
      if (vowels.contains(vowelFreeWord[i])) {
        if (vowelFreeWord[i].contains("্")) {
          vowelFreeWord = vowelFreeWord.replaceRange(i, i + 2, '');
          print('vowelFreeWord = ' + vowelFreeWord);
        }
      }
    }
  }

  int syllableCounter() {
//     print("the word "+x+" has: ");
    if (snrVowels.contains(x[0]) && !vowels.contains(x[2])) {
      syllable--;
    }
    for (int i = 0; i < x.length; i++) {
      if (vowels.contains(x[i])) {
        vowelCheck = true;
        if (i < x.length - 1 && [i].contains("া") && x[i + 1].contains("ক")) {
          syllable--;
        }
        if (x[i].contains("্")) {
          if (!(i == x.length - 2)) {
            syllable--;
          }
        }

        vowelPattern[i] = x[i];
//       print(vowelPattern[i]+": "+vowelCheck.toString()+syllable.toString());

      } else {
        if (snrVowels.contains(x[i])) {
          x = x.replaceAll(x[i], 'v');

          if (i > 0) {
            if (!x[i - 1].contains("v") || !vowels.contains(x[i - 1])) {
              syllable--;
            }
            if (x[i - 1].contains("v")) {
              syllable++;
            }
          }

          vowelCheck = true;
        }

        if (a.contains(x[i])) {
          x = x.replaceAll(x[i], 'a');
        }
        if (b.contains(x[i])) {
          x = x.replaceAll(x[i], 'b');
        }
        if (c.contains(x[i])) {
          x = x.replaceAll(x[i], 'c');
        }
        if (d.contains(x[i])) {
          x = x.replaceAll(x[i], 'd');
        }
        if (e.contains(x[i])) {
          x = x.replaceAll(x[i], 'e');
        }

//      print(x[i]+": "+vowelCheck.toString()+syllable.toString());
        syllable++;
        vowelCheck = false;
      }

      if (i == x.length - 2 && x[i + 1] != "হ") {
        if (exc.contains(x[i]) && vowelCheck && !snrVowels.contains(x[i + 1])) {
          if (!x[i + 1].contains("ঁ")) {
            syllable--;
          }

//         print('[dasd]');
        }
        if (!snrVowels.contains(x[i]) &&
            !vowelCheck &&
            !vowels.contains(x[i + 1])) {
          syllable--;
//         print('fsdfds');
        }

        if (x[i].contains("ি") || x[i].contains("ী")) {
          if (x[i + 1].contains("ক") ||
              x[i + 1].contains("শ") ||
              x[i + 1].contains("র") ||
              x[i + 1].contains("ল")) {
            syllable--;
          }
        }
      }

      if (x[i].contains("ঁ") && !vowelCheck) {
        syllable--;
        x = x.replaceAll(x[i], 'x');
//         print("fsaaaa");
      }
    }

    print(x);
    print(y);
//   print(syllable.toString()+" Syllable(s)");
    return syllable;
  }

  // void VPatternChecker() {}

  // void CPatternChecker() {}
}

// Syllable algo ends here
//
//
