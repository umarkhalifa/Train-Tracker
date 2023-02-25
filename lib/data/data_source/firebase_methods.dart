import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:train_tracking/data/models/ticket_model.dart';

class FirebaseMethods{
  CollectionReference ticketReference = FirebaseFirestore.instance.collection('TICKETS');

//  FETCH TICKETS
Future <List<Ticket>> fetchTickets()async{
  final List<Ticket> tickets = [];
  try{
    final response = await ticketReference.get();
    for(var element in response.docs){
      print(element.data());
      final ticket = Ticket.fromSnapshot(element);
      tickets.add(ticket);
    }
    return tickets;
  }catch(error){
    debugPrint(error.toString());
  }
  return tickets;


}
}

final firebaseMethods = Provider((ref) => FirebaseMethods());