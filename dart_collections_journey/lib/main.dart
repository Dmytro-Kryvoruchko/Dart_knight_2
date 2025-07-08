import 'dart:math';
import 'names.dart';
import 'package:word_generator/word_generator.dart';

void main() {
  runTask1();
  runTask2();
  runTask3();
}

void runTask1() {
  print('------------------- Task 1 -------------------');
  final random = Random();
  List<int> numbers = List.generate(100, (_) => random.nextInt(101));
  print(numbers);

  print('65-й елемент: ${numbers[64]}');

  numbers.insert(49, 1000000000);
  print('Після вставки 1000000000 на 50-й позиції: $numbers');

  numbers.removeWhere((num) => [24, 45, 66, 88].contains(num));
  print('Після видалення 24, 45, 66, 88: $numbers');

  int sum = 0;
  for (var number in numbers) {
    if (number % 3 == 0) sum += number;
  }
  print('Сума, кратна 3: $sum');

  List<int> temp = [];
  for (var number in numbers) {
    if (number % 2 == 0) temp.add(number);
  }
  print('Кількість парних у temp: ${temp.length}');
}

runTask2() {
  print('------------------- Task 2 -------------------');
  Set<String> uniqueNames1 = Set.from(ukrainianNames1);
  Set<String> uniqueNames2 = Set.from(ukrainianNames2);

  Set<String> commonNames = uniqueNames1.intersection(uniqueNames2);
  print("Кількість спільних імен: ${commonNames.length}");

  Set<String> onlyIn1 = uniqueNames1.difference(uniqueNames2);
  print("Імена лише в першому списку: $onlyIn1");

  Set<String> onlyIn2 = uniqueNames2.difference(uniqueNames1);
  print("Імена лише в другому списку: $onlyIn2");
}

runTask3() {
  print('------------------- Task 3 -------------------');
  final generator = WordGenerator();
  List<String> nounsList = generator.randomNouns(50);

  print('Згенеровані слова:');
  print(nounsList);
  Map<String, int> nounsMap = {for (var word in nounsList) word: word.length};

  Map<String, int> tempNouns = {};
  nounsMap.forEach((key, value) {
    if (value % 2 == 0) {
      tempNouns[key] = value;
    }
  });

  print('Слова з парною кількістю літер:');
  print(tempNouns.keys);
}
