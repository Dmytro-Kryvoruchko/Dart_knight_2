import 'dart:math';

void main() {
  runTask1();
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
