import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:train_tracking/data/data_source/firebase_methods.dart';
import 'package:train_tracking/data/models/ticket_model.dart';

final ticketProvider = FutureProvider<List<Ticket>>(
    (ref) => ref.read(firebaseMethods).fetchTickets());
