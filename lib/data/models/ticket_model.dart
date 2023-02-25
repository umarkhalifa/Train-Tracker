import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Ticket {
  String locationFrom;
  String locationTo;
  DateTime date;
  int price;
  Map timeFrom;
  Map timeTo;
  String city;
  List<dynamic> seats;

  Ticket({
    required this.locationFrom,
    required this.locationTo,
    required this.price,
    required this.date,
    required this.timeFrom,
    required this.timeTo,
    required this.city,
    required this.seats
  });

  static Ticket fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Ticket(
      locationFrom: snapshot['locationFrom'],
      locationTo: snapshot['locationTo'],
      price: snapshot['price'],
      date: DateTime.fromMillisecondsSinceEpoch(snapshot['date']),
      timeFrom: snapshot['timeFrom'],
      timeTo: snapshot['timeTo'],
      city: snapshot['city'],
      seats: snapshot['seats']
    );
  }
}
