import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';

class Utilities {
  static final RegExp _hexExp = RegExp(
    r'^#?([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$',
    caseSensitive: false,
  );
  static final RegExp _rgbExp = RegExp(
    r'^rgb\((0|255|25[0-4]|2[0-4]\d|1\d\d|0?\d?\d)\s?,\s?(0|255|25[0-4]|2[0-4]\d|1\d\d|0?\d?\d)\s?,\s?(0|255|25[0-4]|2[0-4]\d|1\d\d|0?\d?\d)\)$',
    caseSensitive: false,
  );
  static final RegExp _rgbaExp = RegExp(
    r'^rgba\((0|255|25[0-4]|2[0-4]\d|1\d\d|0?\d?\d)\s?,\s?(0|255|25[0-4]|2[0-4]\d|1\d\d|0?\d?\d)\s?,\s?(0|255|25[0-4]|2[0-4]\d|1\d\d|0?\d?\d)\s?,\s?(0|0?\.\d|1(\.0)?)\)$',
    caseSensitive: false,
  );
  static final RegExp _materialDesignColorExp = RegExp(
    r'^((?:red|pink|purple|deepPurple|indigo|blue|lightBlue|cyan|teal|green|lightGreen|lime|yellow|amber|orange|deepOrange|brown|grey|blueGrey)(?:50|100|200|300|400|500|600|700|800|900)?|(?:red|pink|purple|deepPurple|indigo|blue|lightBlue|cyan|teal|green|lightGreen|lime|yellow|amber|orange|deepOrange)(?:Accent|Accent50|Accent100|Accent200|Accent400|Accent700)?|(?:black|white))$',
    caseSensitive: false,
  );

  static const Color BLACK = Color.fromARGB(255, 0, 0, 0);
  static const Color WHITE = Color.fromARGB(255, 255, 255, 255);

  static Color getColor(String value) {
    String colorValue = value;
    if (_hexExp.hasMatch(colorValue)) {
      final buffer = StringBuffer();
      if (colorValue.length == 3 || colorValue.length == 4) {
        colorValue = colorValue.replaceFirst('#', '');
        List<String> pieces =
            colorValue.split('').map((String piece) => '$piece$piece').toList();
        colorValue = pieces.join();
      }
      if (colorValue.length == 6 || colorValue.length == 7) buffer.write('ff');
      buffer.write(colorValue.replaceFirst('#', ''));
      return Color(int.parse(buffer.toString(), radix: 16));
    } else if (_rgbExp.hasMatch(value)) {
      var parts = _rgbExp.allMatches(value);
      int r = 0;
      int g = 0;
      int b = 0;
      for (var part in parts) {
        r = int.parse(part.group(1)!);
        g = int.parse(part.group(2)!);
        b = int.parse(part.group(3)!);
      }
      return Color.fromARGB(255, r, g, b);
    } else if (_rgbaExp.hasMatch(value)) {
      var parts = _rgbaExp.allMatches(value);
      int r = 0;
      int g = 0;
      int b = 0;
      double a = 1;
      for (var part in parts) {
        r = int.parse(part.group(1)!);
        g = int.parse(part.group(2)!);
        b = int.parse(part.group(3)!);
        a = double.parse(part.group(4)!);
      }
      return Color.fromARGB((255 * a).toInt(), r, g, b);
    } else if (_materialDesignColorExp.hasMatch(value)) {
      switch (value) {
        case 'black':
          return Colors.black;
        case 'white':
          return Colors.white;
        case 'amber':
          return Colors.amber;
        case 'amber100':
          return Colors.amber.shade100;
        case 'amber200':
          return Colors.amber.shade200;
        case 'amber300':
          return Colors.amber.shade300;
        case 'amber400':
          return Colors.amber.shade400;
        case 'amber500':
          return Colors.amber.shade500;
        case 'amber600':
          return Colors.amber.shade600;
        case 'amber700':
          return Colors.amber.shade700;
        case 'amber800':
          return Colors.amber.shade800;
        case 'amber900':
          return Colors.amber.shade900;
        case 'blue':
          return Colors.blue;
        case 'blue100':
          return Colors.blue.shade100;
        case 'blue200':
          return Colors.blue.shade200;
        case 'blue300':
          return Colors.blue.shade300;
        case 'blue400':
          return Colors.blue.shade400;
        case 'blue500':
          return Colors.blue.shade500;
        case 'blue600':
          return Colors.blue.shade600;
        case 'blue700':
          return Colors.blue.shade700;
        case 'blue800':
          return Colors.blue.shade800;
        case 'blue900':
          return Colors.blue.shade900;
        case 'blueAccent':
          return Colors.blueAccent;
        case 'blueAccent50':
          return Colors.blue.shade50;
        case 'blueAccent100':
          return Colors.blue.shade100;
        case 'blueAccent200':
          return Colors.blue.shade200;
        case 'blueAccent400':
          return Colors.blue.shade400;
        case 'blueAccent700':
          return Colors.blue.shade700;
        case 'blueGrey':
          return Colors.blueGrey;
        case 'blueGrey100':
          return Colors.blueGrey.shade100;
        case 'blueGrey200':
          return Colors.blueGrey.shade200;
        case 'blueGrey300':
          return Colors.blueGrey.shade300;
        case 'blueGrey400':
          return Colors.blueGrey.shade400;
        case 'blueGrey500':
          return Colors.blueGrey.shade500;
        case 'blueGrey600':
          return Colors.blueGrey.shade600;
        case 'blueGrey700':
          return Colors.blueGrey.shade700;
        case 'blueGrey800':
          return Colors.blueGrey.shade800;
        case 'blueGrey900':
          return Colors.blueGrey.shade900;
        case 'brown':
          return Colors.brown;
        case 'brown100':
          return Colors.brown.shade100;
        case 'brown200':
          return Colors.brown.shade200;
        case 'brown300':
          return Colors.brown.shade300;
        case 'brown400':
          return Colors.brown.shade400;
        case 'brown500':
          return Colors.brown.shade500;
        case 'brown600':
          return Colors.brown.shade600;
        case 'brown700':
          return Colors.brown.shade700;
        case 'brown800':
          return Colors.brown.shade800;
        case 'brown900':
          return Colors.brown.shade900;
        case 'cyan':
          return Colors.cyan;
        case 'cyan100':
          return Colors.cyan.shade100;
        case 'cyan200':
          return Colors.cyan.shade200;
        case 'cyan300':
          return Colors.cyan.shade300;
        case 'cyan400':
          return Colors.cyan.shade400;
        case 'cyan500':
          return Colors.cyan.shade500;
        case 'cyan600':
          return Colors.cyan.shade600;
        case 'cyan700':
          return Colors.cyan.shade700;
        case 'cyan800':
          return Colors.cyan.shade800;
        case 'cyan900':
          return Colors.cyan.shade900;
        case 'cyanAccent':
          return Colors.cyan;
        case 'cyanAccent50':
          return Colors.cyan.shade50;
        case 'cyanAccent100':
          return Colors.cyan.shade100;
        case 'cyanAccent200':
          return Colors.cyan.shade200;
        case 'cyanAccent400':
          return Colors.cyan.shade400;
        case 'cyanAccent700':
          return Colors.cyan.shade700;
        case 'deepOrange':
          return Colors.deepOrange;
        case 'deepOrange100':
          return Colors.deepOrange.shade100;
        case 'deepOrange200':
          return Colors.deepOrange.shade200;
        case 'deepOrange300':
          return Colors.deepOrange.shade300;
        case 'deepOrange400':
          return Colors.deepOrange.shade400;
        case 'deepOrange500':
          return Colors.deepOrange.shade500;
        case 'deepOrange600':
          return Colors.deepOrange.shade600;
        case 'deepOrange700':
          return Colors.deepOrange.shade700;
        case 'deepOrange800':
          return Colors.deepOrange.shade800;
        case 'deepOrange900':
          return Colors.deepOrange.shade900;
        case 'deepPurple':
          return Colors.deepPurple;
        case 'deepPurple100':
          return Colors.deepPurple.shade100;
        case 'deepPurple200':
          return Colors.deepPurple.shade200;
        case 'deepPurple300':
          return Colors.deepPurple.shade300;
        case 'deepPurple400':
          return Colors.deepPurple.shade400;
        case 'deepPurple500':
          return Colors.deepPurple.shade500;
        case 'deepPurple600':
          return Colors.deepPurple.shade600;
        case 'deepPurple700':
          return Colors.deepPurple.shade700;
        case 'deepPurple800':
          return Colors.deepPurple.shade800;
        case 'deepPurple900':
          return Colors.deepPurple.shade900;
        case 'green':
          return Colors.green;
        case 'green100':
          return Colors.green.shade100;
        case 'green200':
          return Colors.green.shade200;
        case 'green300':
          return Colors.green.shade300;
        case 'green400':
          return Colors.green.shade400;
        case 'green500':
          return Colors.green.shade500;
        case 'green600':
          return Colors.green.shade600;
        case 'green700':
          return Colors.green.shade700;
        case 'green800':
          return Colors.green.shade800;
        case 'green900':
          return Colors.green.shade900;
        case 'grey':
          return Colors.grey;
        case 'grey100':
          return Colors.grey.shade100;
        case 'grey200':
          return Colors.grey.shade200;
        case 'grey300':
          return Colors.grey.shade300;
        case 'grey400':
          return Colors.grey.shade400;
        case 'grey500':
          return Colors.grey.shade500;
        case 'grey600':
          return Colors.grey.shade600;
        case 'grey700':
          return Colors.grey.shade700;
        case 'grey800':
          return Colors.grey.shade800;
        case 'grey900':
          return Colors.grey.shade900;
        case 'indigo':
          return Colors.indigo;
        case 'indigo100':
          return Colors.indigo.shade100;
        case 'indigo200':
          return Colors.indigo.shade200;
        case 'indigo300':
          return Colors.indigo.shade300;
        case 'indigo400':
          return Colors.indigo.shade400;
        case 'indigo500':
          return Colors.indigo.shade500;
        case 'indigo600':
          return Colors.indigo.shade600;
        case 'indigo700':
          return Colors.indigo.shade700;
        case 'indigo800':
          return Colors.indigo.shade800;
        case 'indigo900':
          return Colors.indigo.shade900;
        case 'indigoAccent':
          return Colors.indigo;
        case 'indigoAccent50':
          return Colors.indigo.shade50;
        case 'indigoAccent100':
          return Colors.indigo.shade100;
        case 'indigoAccent200':
          return Colors.indigo.shade200;
        case 'indigoAccent400':
          return Colors.indigo.shade400;
        case 'indigoAccent700':
          return Colors.indigo.shade700;
        case 'lightBlue':
          return Colors.lightBlue;
        case 'lightBlue100':
          return Colors.lightBlue.shade100;
        case 'lightBlue200':
          return Colors.lightBlue.shade200;
        case 'lightBlue300':
          return Colors.lightBlue.shade300;
        case 'lightBlue400':
          return Colors.lightBlue.shade400;
        case 'lightBlue500':
          return Colors.lightBlue.shade500;
        case 'lightBlue600':
          return Colors.lightBlue.shade600;
        case 'lightBlue700':
          return Colors.lightBlue.shade700;
        case 'lightBlue800':
          return Colors.lightBlue.shade800;
        case 'lightBlue900':
          return Colors.lightBlue.shade900;
        case 'lightGreen':
          return Colors.lightGreen;
        case 'lightGreen100':
          return Colors.lightGreen.shade100;
        case 'lightGreen200':
          return Colors.lightGreen.shade200;
        case 'lightGreen300':
          return Colors.lightGreen.shade300;
        case 'lightGreen400':
          return Colors.lightGreen.shade400;
        case 'lightGreen500':
          return Colors.lightGreen.shade500;
        case 'lightGreen600':
          return Colors.lightGreen.shade600;
        case 'lightGreen700':
          return Colors.lightGreen.shade700;
        case 'lightGreen800':
          return Colors.lightGreen.shade800;
        case 'lightGreen900':
          return Colors.lightGreen.shade900;
        case 'lime':
          return Colors.lime;
        case 'lime100':
          return Colors.lime.shade100;
        case 'lime200':
          return Colors.lime.shade200;
        case 'lime300':
          return Colors.lime.shade300;
        case 'lime400':
          return Colors.lime.shade400;
        case 'lime500':
          return Colors.lime.shade500;
        case 'lime600':
          return Colors.lime.shade600;
        case 'lime700':
          return Colors.lime.shade700;
        case 'lime800':
          return Colors.lime.shade800;
        case 'lime900':
          return Colors.lime.shade900;
        case 'orange':
          return Colors.orange;
        case 'orange100':
          return Colors.orange.shade100;
        case 'orange200':
          return Colors.orange.shade200;
        case 'orange300':
          return Colors.orange.shade300;
        case 'orange400':
          return Colors.orange.shade400;
        case 'orange500':
          return Colors.orange.shade500;
        case 'orange600':
          return Colors.orange.shade600;
        case 'orange700':
          return Colors.orange.shade700;
        case 'orange800':
          return Colors.orange.shade800;
        case 'orange900':
          return Colors.orange.shade900;
        case 'pink':
          return Colors.pink;
        case 'pink100':
          return Colors.pink.shade100;
        case 'pink200':
          return Colors.pink.shade200;
        case 'pink300':
          return Colors.pink.shade300;
        case 'pink400':
          return Colors.pink.shade400;
        case 'pink500':
          return Colors.pink.shade500;
        case 'pink600':
          return Colors.pink.shade600;
        case 'pink700':
          return Colors.pink.shade700;
        case 'pink800':
          return Colors.pink.shade800;
        case 'pink900':
          return Colors.pink.shade900;
        case 'purple':
          return Colors.purple;
        case 'purple100':
          return Colors.purple.shade100;
        case 'purple200':
          return Colors.purple.shade200;
        case 'purple300':
          return Colors.purple.shade300;
        case 'purple400':
          return Colors.purple.shade400;
        case 'purple500':
          return Colors.purple.shade500;
        case 'purple600':
          return Colors.purple.shade600;
        case 'purple700':
          return Colors.purple.shade700;
        case 'purple800':
          return Colors.purple.shade800;
        case 'purple900':
          return Colors.purple.shade900;
        case 'red':
          return Colors.red;
        case 'red100':
          return Colors.red.shade100;
        case 'red200':
          return Colors.red.shade200;
        case 'red300':
          return Colors.red.shade300;
        case 'red400':
          return Colors.red.shade400;
        case 'red500':
          return Colors.red.shade500;
        case 'red600':
          return Colors.red.shade600;
        case 'red700':
          return Colors.red.shade700;
        case 'red800':
          return Colors.red.shade800;
        case 'red900':
          return Colors.red.shade900;
        case 'teal':
          return Colors.teal;
        case 'teal100':
          return Colors.teal.shade100;
        case 'teal200':
          return Colors.teal.shade200;
        case 'teal300':
          return Colors.teal.shade300;
        case 'teal400':
          return Colors.teal.shade400;
        case 'teal500':
          return Colors.teal.shade500;
        case 'teal600':
          return Colors.teal.shade600;
        case 'teal700':
          return Colors.teal.shade700;
        case 'teal800':
          return Colors.teal.shade800;
        case 'teal900':
          return Colors.teal.shade900;
        case 'yellow':
          return Colors.yellow;
        case 'yellow100':
          return Colors.yellow.shade100;
        case 'yellow200':
          return Colors.yellow.shade200;
        case 'yellow300':
          return Colors.yellow.shade300;
        case 'yellow400':
          return Colors.yellow.shade400;
        case 'yellow500':
          return Colors.yellow.shade500;
        case 'yellow600':
          return Colors.yellow.shade600;
        case 'yellow700':
          return Colors.yellow.shade700;
        case 'yellow800':
          return Colors.yellow.shade800;
        case 'yellow900':
          return Colors.yellow.shade900;
      }
    } else {
      return Color.fromARGB(255, 0, 0, 0);
    }
    return Color.fromARGB(255, 0, 0, 0);
  }

  static String toRGBA(Color color) {
    return 'rgba(${color.r},${color.g},${color.b},${color.a / 255})';
  }

  static Color textColor(Color color) {
    if (color.computeLuminance() > 0.6) {
      return BLACK;
    } else {
      return WHITE;
    }
  }

  static String generateRandom([int length = 16]) {
    final Random _random = Random.secure();
    var values = List<int>.generate(length, (i) => _random.nextInt(256));
    return base64Url.encode(values).substring(0, length);
  }

  static bool truthful(value) {
    if (value == null) {
      return false;
    }
    if (value == true ||
        value == 'true' ||
        value == 1 ||
        value == '1' ||
        value.toString().toLowerCase() == 'yes') {
      return true;
    }
    return false;
  }
}
