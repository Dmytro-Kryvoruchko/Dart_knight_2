import 'package:flutter/material.dart';

class BookingCalendarPage extends StatefulWidget {
  const BookingCalendarPage({super.key});

  @override
  State<BookingCalendarPage> createState() => _BookingCalendarPageState();
}

class _BookingCalendarPageState extends State<BookingCalendarPage> {
  DateTime? _startDate;
  DateTime? _endDate;
  final List<Map<String, dynamic>> _bookings = [];

  Future<void> _selectDate({required bool isStart}) async {
    final DateTime initialDate = isStart
        ? DateTime.now()
        : _startDate ?? DateTime.now();
    final DateTime firstDate = isStart
        ? DateTime.now()
        : _startDate ?? DateTime.now();
    final DateTime lastDate = DateTime.now().add(const Duration(days: 365));

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (picked != null) {
      setState(() {
        if (isStart) {
          _startDate = picked;
          _endDate = null;
        } else {
          _endDate = picked;
        }
      });
    }
  }

  void _saveBooking() {
    if (_startDate != null && _endDate != null) {
      _bookings.add({'startDate': _startDate, 'endDate': _endDate});
      setState(() {
        _startDate = null;
        _endDate = null;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Бронювання збережено')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Календар Бронювання'),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (_) => ListView(
                  padding: const EdgeInsets.all(16),
                  children: _bookings
                      .map(
                        (b) => ListTile(
                          title: Text(
                            'З: ${b['startDate'].toString().split(" ")[0]}',
                          ),
                          subtitle: Text(
                            'До: ${b['endDate'].toString().split(" ")[0]}',
                          ),
                        ),
                      )
                      .toList(),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () => _selectDate(isStart: true),
                  child: Text(
                    _startDate == null
                        ? 'Оберіть дату початку'
                        : 'Початок: ${_startDate!.toLocal().toString().split(" ")[0]}',
                  ),
                ),
                ElevatedButton(
                  onPressed: _startDate != null
                      ? () => _selectDate(isStart: false)
                      : null,
                  child: Text(
                    _endDate == null
                        ? 'Оберіть дату завершення'
                        : 'Завершення: ${_endDate!.toLocal().toString().split(" ")[0]}',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: (_startDate != null && _endDate != null)
                  ? _saveBooking
                  : null,
              child: const Text('Зберегти бронювання'),
            ),
            const SizedBox(height: 20),
            Text('Збережено: ${_bookings.length} бронювань'),
          ],
        ),
      ),
    );
  }
}
