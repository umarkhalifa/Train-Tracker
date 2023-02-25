// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:train_tracking/data/models/ticket_model.dart';
// import 'package:uuid/uuid.dart';
//
// // class Seat{
// //   String name;
// //   bool available;
// //   Seat({required this.name}): available = true;
// //
// //   Map toMap(){
// //     return {
// //       'name': name,
// //       'available': true
// //     };
// //   }
// // }
//
// class Ticket {
//   String locationFrom;
//   String locationTo;
//   DateTime date;
//   int price;
//   TimeOfDay timeFrom;
//   TimeOfDay timeTo;
//   String city;
//
//   Ticket({
//     required this.locationFrom,
//     required this.locationTo,
//     required this.price,
//     required this.date,
//     required this.timeFrom,
//     required this.timeTo,
//     required this.city,
//   });
//
//   static Ticket fromSnapshot(DocumentSnapshot snap) {
//     var snapshot = snap.data() as Map<String, dynamic>;
//
//     return Ticket(
//       locationFrom: snapshot['locationFrom'],
//       locationTo: snapshot['locationTo'],
//       price: snapshot['price'],
//       date: snapshot['date'],
//       timeFrom: snapshot['timeFrom'],
//       timeTo: snapshot['timeTo'],
//       city: snapshot['city'],
//     );
//   }
// }
//
// List<Ticket> tickets = [
//   Ticket(
//       locationFrom: "Abuja",
//       locationTo: "Kwara",
//       price: 9000,
//       timeFrom: const TimeOfDay(hour: 8, minute: 10),
//       timeTo: const TimeOfDay(hour: 18, minute: 30),
//       city: "Illorin",
//       date: DateTime(2023, 02, 01),
//       ),
//   Ticket(
//       locationFrom: "Abuja",
//       locationTo: "Kwara",
//       price: 9000,
//       timeFrom: const TimeOfDay(hour: 8, minute: 10),
//       timeTo: const TimeOfDay(hour: 18, minute: 30),
//       city: "Illorin",
//       date: DateTime(2023, 02, 02),
//       ),
//   Ticket(
//       locationFrom: "Abuja",
//       locationTo: "Kwara",
//       price: 9000,
//       timeFrom: const TimeOfDay(hour: 8, minute: 10),
//       timeTo: const TimeOfDay(hour: 18, minute: 30),
//       city: "Illorin",
//       date: DateTime(2023, 02, 03),
//       ),
//   Ticket(
//       locationFrom: "Abuja",
//       locationTo: "Kwara",
//       price: 4500,
//       timeFrom: const TimeOfDay(hour: 8, minute: 10),
//       timeTo: const TimeOfDay(hour: 18, minute: 30),
//       city: "Illorin",
//       date: DateTime(2023, 02, 04),
//       ),
//   //NIGER
//   Ticket(
//       locationFrom: "Abuja",
//       locationTo: "NIGER",
//       price: 2500,
//       timeFrom: const TimeOfDay(hour: 8, minute: 10),
//       timeTo: const TimeOfDay(hour: 13, minute: 30),
//       city: "Minna",
//       date: DateTime(2023, 02, 01),
//       ),
//   Ticket(
//       locationFrom: "Abuja",
//       locationTo: "Niger",
//       price: 2500,
//       timeFrom: const TimeOfDay(hour: 8, minute: 10),
//       timeTo: const TimeOfDay(hour: 13, minute: 30),
//       city: "Minna",
//       date: DateTime(2023, 02, 02),
//       ),
//   Ticket(
//       locationFrom: "Abuja",
//       locationTo: "Niger",
//       price: 2500,
//       timeFrom: const TimeOfDay(hour: 8, minute: 10),
//       timeTo: const TimeOfDay(hour: 9, minute: 30),
//       city: "Minna",
//       date: DateTime(2023, 02, 03),
//       ),
//   Ticket(
//       locationFrom: "Abuja",
//       locationTo: "Niger",
//       price: 2500,
//       timeFrom: const TimeOfDay(hour: 8, minute: 10),
//       timeTo: const TimeOfDay(hour: 13, minute: 30),
//       city: "Minna",
//       date: DateTime(2023, 02, 04),
//   ),
//   //KADUNA
//   Ticket(
//       locationFrom: "Abuja",
//       locationTo: "Kaduna",
//       price: 3500,
//       timeFrom: const TimeOfDay(hour: 8, minute: 10),
//       timeTo: const TimeOfDay(hour: 15, minute: 30),
//       city: "Kaduna",
//       date: DateTime(2023, 02, 01),
//       ),
//   Ticket(
//     locationFrom: "Abuja",
//     locationTo: "Kaduna",
//     price: 3500,
//     timeFrom: const TimeOfDay(hour: 8, minute: 10),
//     timeTo: const TimeOfDay(hour: 15, minute: 30),
//     city: "Kaduna",
//     date: DateTime(2023, 02, 02),
//   ),
//   Ticket(
//       locationFrom: "Abuja",
//       locationTo: "Kaduna",
//       price: 4500,
//       timeFrom: const TimeOfDay(hour: 8, minute: 10),
//       timeTo: const TimeOfDay(hour: 15, minute: 30),
//       city: "Kaduna",
//       date: DateTime(2023, 02, 03),
//       ),
//   Ticket(
//       locationFrom: "Abuja",
//       locationTo: "Kaduna",
//       price: 3500,
//       timeFrom: const TimeOfDay(hour: 8, minute: 10),
//       timeTo: const TimeOfDay(hour: 15, minute: 30),
//       city: "Kaduna",
//       date: DateTime(2023, 02, 04),
//       ),
//   //KANO
//   Ticket(
//       locationFrom: "Abuja",
//       locationTo: "Kano",
//       price: 4000,
//       timeFrom: const TimeOfDay(hour: 8, minute: 10),
//       timeTo: const TimeOfDay(hour: 16, minute: 30),
//       city: "Kano",
//       date: DateTime(2023, 02, 01),
//       ),
//   Ticket(
//       locationFrom: "Abuja",
//       locationTo: "Kano",
//       price: 4000,
//       timeFrom: const TimeOfDay(hour: 8, minute: 10),
//       timeTo: const TimeOfDay(hour: 16, minute: 30),
//       city: "Kano",
//       date: DateTime(2023, 02, 02),
//       ),
//   Ticket(
//       locationFrom: "Abuja",
//       locationTo: "Kano",
//       price: 4000,
//       timeFrom: const TimeOfDay(hour: 8, minute: 10),
//       timeTo: const TimeOfDay(hour: 16, minute: 30),
//       city: "Kano",
//       date: DateTime(2023, 02, 03),
//       ),
//   Ticket(
//       locationFrom: "Abuja",
//       locationTo: "Kano",
//       price: 4500,
//       timeFrom: const TimeOfDay(hour: 8, minute: 10),
//       timeTo: const TimeOfDay(hour: 16, minute: 30),
//       city: "Kano",
//       date: DateTime(2023, 02, 04),
//       ),
//   //BENUE
//   Ticket(
//       locationFrom: "Abuja",
//       locationTo: "Benue",
//       price: 3000,
//       timeFrom: const TimeOfDay(hour: 8, minute: 10),
//       timeTo: const TimeOfDay(hour: 14, minute: 30),
//       city: "Makurdi",
//       date: DateTime(2023, 02, 01),
//      ),
//   Ticket(
//       locationFrom: "Abuja",
//       locationTo: "Benue",
//       price: 3000,
//       timeFrom: const TimeOfDay(hour: 8, minute: 10),
//       timeTo: const TimeOfDay(hour: 14, minute: 30),
//       city: "Makurdi",
//       date: DateTime(2023, 02, 02),
//       ),
//   Ticket(
//       locationFrom: "Abuja",
//       locationTo: "Benue",
//       price: 3000,
//       timeFrom: const TimeOfDay(hour: 8, minute: 10),
//       timeTo: const TimeOfDay(hour: 14, minute: 30),
//       city: "Makurdi",
//       date: DateTime(2023, 02, 03),
//       ),
//   Ticket(
//       locationFrom: "Abuja",
//       locationTo: "Benue",
//       price: 3000,
//       timeFrom: const TimeOfDay(hour: 8, minute: 10),
//       timeTo: const TimeOfDay(hour: 14, minute: 30),
//       city: "Makurdi",
//       date: DateTime(2023, 02, 04),
//       ),
//   //KATSINA
//   Ticket(
//       locationFrom: "Abuja",
//       locationTo: "Katsina",
//       price: 4500,
//       timeFrom: const TimeOfDay(hour: 8, minute: 10),
//       timeTo: const TimeOfDay(hour: 16, minute: 30),
//       city: "Katsina",
//       date: DateTime(2023, 02, 01),
//       ),
//   Ticket(
//       locationFrom: "Abuja",
//       locationTo: "Katsina",
//       price: 4500,
//       timeFrom: const TimeOfDay(hour: 8, minute: 10),
//       timeTo: const TimeOfDay(hour: 16, minute: 30),
//       city: "Katsina",
//       date: DateTime(2023, 02, 02),
//       ),
//   Ticket(
//       locationFrom: "Abuja",
//       locationTo: "Katsina",
//       price: 4500,
//       timeFrom: const TimeOfDay(hour: 8, minute: 10),
//       timeTo: const TimeOfDay(hour: 16, minute: 30),
//       city: "Katsina",
//       date: DateTime(2023, 02, 03),
//       ),
//   Ticket(
//       locationFrom: "Abuja",
//       locationTo: "Katsina",
//       price: 4500,
//       timeFrom: const TimeOfDay(hour: 8, minute: 10),
//       timeTo: const TimeOfDay(hour: 16, minute: 30),
//       city: "Katsina",
//       date: DateTime(2023, 02, 04),
//       ),
//   //LAGOS
//   Ticket(
//       locationFrom: "Abuja",
//       locationTo: "Lagos",
//       price: 12000,
//       timeFrom: const TimeOfDay(hour: 8, minute: 10),
//       timeTo: const TimeOfDay(hour: 23, minute: 30),
//       city: "Lagos",
//       date: DateTime(2023, 02, 01),
//       ),
//   Ticket(
//       locationFrom: "Abuja",
//       locationTo: "Lagos",
//       price: 12000,
//       timeFrom: const TimeOfDay(hour: 8, minute: 10),
//       timeTo: const TimeOfDay(hour: 23, minute: 30),
//       city: "Lagos",
//       date: DateTime(2023, 02, 02),
//       ),
//   Ticket(
//       locationFrom: "Abuja",
//       locationTo: "Lagos",
//       price: 4500,
//       timeFrom: const TimeOfDay(hour: 8, minute: 10),
//       timeTo: const TimeOfDay(hour: 23, minute: 30),
//       city: "Lagos",
//       date: DateTime(2023, 02, 03),
//       ),
//   Ticket(
//       locationFrom: "Abuja",
//       locationTo: "Lagos",
//       price: 4500,
//       timeFrom: const TimeOfDay(hour: 8, minute: 10),
//       timeTo: const TimeOfDay(hour: 23, minute: 30),
//       city: "Lagos",
//       date: DateTime(2023, 02, 04),
//       ),
//   //PLATEAU
//   Ticket(
//       locationFrom: "Abuja",
//       locationTo: "Plateau",
//       price: 1000,
//       timeFrom: const TimeOfDay(hour: 8, minute: 10),
//       timeTo: const TimeOfDay(hour: 21, minute: 30),
//       city: "Jos",
//       date: DateTime(2023, 02, 01),
//       ),
//   Ticket(
//       locationFrom: "Abuja",
//       locationTo: "Plateau",
//       price: 4500,
//       timeFrom: const TimeOfDay(hour: 8, minute: 10),
//       timeTo: const TimeOfDay(hour: 21, minute: 30),
//       city: "Jos",
//       date: DateTime(2023, 02, 02),
//       ),
//   Ticket(
//       locationFrom: "Abuja",
//       locationTo: "Plateau",
//       price: 4500,
//       timeFrom: const TimeOfDay(hour: 8, minute: 10),
//       timeTo: const TimeOfDay(hour: 21, minute: 30),
//       city: "Jos",
//       date: DateTime(2023, 02, 03),
//       ),
//   Ticket(
//       locationFrom: "Abuja",
//       locationTo: "Plateau",
//       price: 4500,
//       timeFrom: const TimeOfDay(hour: 8, minute: 10),
//       timeTo: const TimeOfDay(hour: 21, minute: 30),
//       city: "Jos",
//       date: DateTime(2023, 02, 04),
//       ),
//
// ];
//
//
List<String> states = [
  'Abia',
  'Adamawa',
  'Akwa Ibom',
  'Anambra',
  'Bauchi',
  'Bayelsa',
  'Benue',
  'Borno',
  'Cross-River',
  'Delta',
  'Ebonyi',
  'Edo',
  'Ekiti',
  'Enugu',
  'Federal Capital Territory',
  'Gombe',
  'Imo',
  'Jigawa',
  'Kaduna',
  'Kano',
  'Katsina',
  'Kebbi',
  'Kogi',
  'Kwara',
  'Lagos',
  'Nasssarawa',
  'Niger',
  'Ogun',
  'Ondo',
  'Osun',
  'Plateau',
  'Rivers',
  'Sokoto',
  'Taraba',
  'Yobe',
  'Zamfara'
];
//
// Map timeOfDayToFirebase(TimeOfDay timeOfDay) {
//   return {'hour': timeOfDay.hour, 'minute': timeOfDay.minute};
// }
//
// class FirebaseMeth{
//   void addTickets(){
//     for(Ticket ticket in tickets){
//       FirebaseFirestore.instance.collection("TICKETS").doc(Uuid().v4()).set({
//         "locationFrom": ticket.locationFrom,
//         "locationTo": ticket.locationTo,
//         "timeFrom": timeOfDayToFirebase(ticket.timeFrom),
//         "timeTo": timeOfDayToFirebase(ticket.timeTo),
//         "city": ticket.city,
//         "date": ticket.date.millisecondsSinceEpoch,
//         "price": ticket.price,
//         "available": ticket.price,
//         "seats": seats
//       });
//     }
//   }
// }
