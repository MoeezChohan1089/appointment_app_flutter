// To parse this JSON data, do
//
//     final simple = simpleFromJson(jsonString);

import 'dart:convert';

Simple simpleFromJson(String str) => Simple.fromJson(json.decode(str));

String simpleToJson(Simple data) => json.encode(data.toJson());

class Simple {
  Simple({
    required this.message,
    required this.value,
    required this.error,
    required this.statusCode,
  });

  final String message;
  final List<Value> value;
  final bool error;
  final int statusCode;

  factory Simple.fromJson(Map<String, dynamic> json) => Simple(
        message: json["message"],
        value: List<Value>.from(json["value"].map((x) => Value.fromJson(x))),
        error: json["error"],
        statusCode: json["status-code"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "value": List<dynamic>.from(value.map((x) => x.toJson())),
        "error": error,
        "status-code": statusCode,
      };
}

class Value {
  Value({
    required this.id,
    required this.roomCategory,
    required this.rooms,
  });

  final int id;
  final String roomCategory;
  final List<Room> rooms;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        id: json["id"],
        roomCategory: json["roomCategory"],
        rooms: List<Room>.from(json["rooms"].map((x) => Room.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "roomCategory": roomCategory,
        "rooms": List<dynamic>.from(rooms.map((x) => x.toJson())),
      };
}

class Room {
  Room({
    required this.roomId,
    required this.name,
    required this.number,
    required this.isOccupied,
    required this.roomCondition,
    required this.dates,
  });

  final int roomId;
  final RoomName name;
  final int number;
  final bool isOccupied;
  final RoomCondition roomCondition;
  final Map<String, Date> dates;

  factory Room.fromJson(Map<String, dynamic> json) => Room(
        roomId: json["roomId"],
        name: roomNameValues.map![json["name"]] ?? RoomName.values[0],
        number: json["number"],
        isOccupied: json["isOccupied"],
        roomCondition: RoomCondition.fromJson(json["roomCondition"]),
        dates: Map.from(json["dates"])
            .map((k, v) => MapEntry<String, Date>(k, Date.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "roomId": roomId,
        "name": roomNameValues.reverse[name],
        "number": number,
        "isOccupied": isOccupied,
        "roomCondition": roomCondition.toJson(),
        "dates": Map.from(dates)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class Date {
  Date({
    required this.id,
    required this.arrival,
    required this.departure,
    required this.booker,
    required this.reservationStatus,
    required this.guests,
    required this.totalAmount,
    required this.totalPayments,
    required this.dueAmount,
    required this.paymentStatus,
  });

  final int id;
  final int arrival;
  final int departure;
  final Booker booker;
  final ReservationStatus reservationStatus;
  final List<Guest> guests;
  final double totalAmount;
  final double totalPayments;
  final double dueAmount;
  final String paymentStatus;

  factory Date.fromJson(Map<String, dynamic> json) => Date(
        id: json["id"],
        arrival: json["arrival"],
        departure: json["departure"],
        booker: Booker.fromJson(json["booker"]),
        reservationStatus:
            ReservationStatus.fromJson(json["reservationStatus"]),
        guests: List<Guest>.from(json["guests"].map((x) => Guest.fromJson(x))),
        totalAmount: json["totalAmount"],
        totalPayments: json["totalPayments"],
        dueAmount: json["dueAmount"],
        paymentStatus: json["paymentStatus"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "arrival": arrival,
        "departure": departure,
        "booker": booker.toJson(),
        "reservationStatus": reservationStatus.toJson(),
        "guests": List<dynamic>.from(guests.map((x) => x.toJson())),
        "totalAmount": totalAmount,
        "totalPayments": totalPayments,
        "dueAmount": dueAmount,
        "paymentStatus": paymentStatus,
      };
}

class Booker {
  Booker({
    required this.firstName,
    required this.lastName,
    required this.bookerInformation,
  });

  final String firstName;
  final String lastName;
  final String bookerInformation;

  factory Booker.fromJson(Map<String, dynamic> json) => Booker(
        firstName: json["firstName"],
        lastName: json["lastName"],
        bookerInformation: json["bookerInformation"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "bookerInformation": bookerInformation,
      };
}

class Guest {
  Guest({
    required this.firstName,
    required this.lastname,
    required this.isVip,
  });

  final String firstName;
  final String lastname;
  final dynamic isVip;

  factory Guest.fromJson(Map<String, dynamic> json) => Guest(
        firstName: json["firstName"],
        lastname: json["lastname"],
        isVip: json["isVip"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastname": lastname,
        "isVip": isVip,
      };
}

class ReservationStatus {
  ReservationStatus({
    required this.id,
    required this.name,
    required this.color,
    required this.defaultColor,
    required this.isCheckedIn,
    required this.isCheckedOut,
    required this.isConfirmed,
    required this.isLock,
    required this.isDeleted,
  });

  final int id;
  final String name;
  final String color;
  final String defaultColor;
  final bool isCheckedIn;
  final bool isCheckedOut;
  final bool isConfirmed;
  final bool isLock;
  final bool isDeleted;

  factory ReservationStatus.fromJson(Map<String, dynamic> json) =>
      ReservationStatus(
        id: json["id"],
        name: json["name"],
        color: json["color"],
        defaultColor: json["defaultColor"],
        isCheckedIn: json["isCheckedIn"],
        isCheckedOut: json["isCheckedOut"],
        isConfirmed: json["isConfirmed"],
        isLock: json["isLock"],
        isDeleted: json["isDeleted"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "color": color,
        "defaultColor": defaultColor,
        "isCheckedIn": isCheckedIn,
        "isCheckedOut": isCheckedOut,
        "isConfirmed": isConfirmed,
        "isLock": isLock,
        "isDeleted": isDeleted,
      };
}

enum RoomName { ROOM, DHOMA, ODA }

final roomNameValues = EnumValues(
    {"Dhoma": RoomName.DHOMA, "Oda": RoomName.ODA, "Room": RoomName.ROOM});

class RoomCondition {
  RoomCondition({
    required this.id,
    required this.name,
    required this.color,
    required this.isOutOfService,
    required this.isTouched,
    required this.isChecked,
    required this.isCleaning,
    required this.isDeleted,
  });

  final int id;
  final RoomConditionName name;
  final Color color;
  final bool isOutOfService;
  final bool isTouched;
  final bool isChecked;
  final bool isCleaning;
  final bool isDeleted;

  factory RoomCondition.fromJson(Map<String, dynamic> json) => RoomCondition(
        id: json["id"],
        name: roomConditionNameValues.map![json["name"]]! ,
        color: colorValues.map![json["color"]]!,
        isOutOfService: json["isOutOfService"],
        isTouched: json["isTouched"],
        isChecked: json["isChecked"],
        isCleaning: json["isCleaning"],
        isDeleted: json["isDeleted"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": roomConditionNameValues.reverse[name],
        "color": colorValues.reverse[color],
        "isOutOfService": isOutOfService,
        "isTouched": isTouched,
        "isChecked": isChecked,
        "isCleaning": isCleaning,
        "isDeleted": isDeleted,
      };
}

enum Color { THE_12_D379, THE_004040, THE_0000_FF, C0_C0_C0 }

final colorValues = EnumValues({
  "#c0c0c0": Color.C0_C0_C0,
  "#0000ff": Color.THE_0000_FF,
  "#004040": Color.THE_004040,
  "#12d379": Color.THE_12_D379
});

enum RoomConditionName { CLEAN, CLEANING, OUT_OF_SERVICE, TOUCHED }

final roomConditionNameValues = EnumValues({
  "Clean": RoomConditionName.CLEAN,
  "Cleaning": RoomConditionName.CLEANING,
  "Out of service": RoomConditionName.OUT_OF_SERVICE,
  "Touched": RoomConditionName.TOUCHED
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map!.map((k, v) =>  MapEntry(v, k));
    return reverseMap as Map<T, String>;
  }
}
