import 'package:flutter_riverpod/flutter_riverpod.dart';

class Seats extends StateNotifier<List<String>> {
  Seats(super.state);

  void add(String seat) {
    state = [...state, seat];
  }

  void remove(String seat) {
    state = state.where((element) => element != seat).toList();
  }
}

final seatProvider = StateNotifierProvider.autoDispose<Seats, List<String>>(
  (ref) => Seats(
    [],
  ),
);
List<String> takenSeats = [
  'A2',
  'A6',
  'A8',
  'A9',
  'A10',
  'A11',
  'A14',
  'A16',
  'A18',
  'A20',
  'A21',
  'A22',
  'A23'];
