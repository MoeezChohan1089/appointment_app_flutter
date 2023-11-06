// To parse this JSON data, do
//
//     final dashBoardModel = dashBoardModelFromJson(jsonString);

import 'dart:convert';

DashBoardModel dashBoardModelFromJson(String str) => DashBoardModel.fromJson(json.decode(str));

String dashBoardModelToJson(DashBoardModel data) => json.encode(data.toJson());

class DashBoardModel {
  DashBoardModel({
    this.message,
    this.value,
    this.error,
    this.statusCode,
  });

  String? message;
  DashBoardModelValue? value;
  bool? error;
  int? statusCode;

  factory DashBoardModel.fromJson(Map<String, dynamic> json) => DashBoardModel(
    message: json["message"],
    value: DashBoardModelValue.fromJson(json["value"]),
    error: json["error"],
    statusCode: json["status-code"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "value": value!.toJson(),
    "error": error,
    "status-code": statusCode,
  };
}

class DashBoardModelValue {
  DashBoardModelValue({
    this.roomsAndCategoriesReport,
    this.bookerAndGuestsReport,
    this.arrivalsReport,
    this.departuresReport,
    this.totalBookedAndCheckIn,
    this.reservationReport,
    this.occupiedRooms,
    this.reservationReportRightTab,
    this.checkInThisWeek,
    this.revenueReportThisWeek,
    this.occupancyThisWeek,
    this.occupancyThisYear,
    this.occupancyLastYear,
  });

  RoomsAndCategoriesReport? roomsAndCategoriesReport;
  BookerAndGuestsReport? bookerAndGuestsReport;
  ArrivalsReport? arrivalsReport;
  DeparturesReport? departuresReport;
  TotalBookedAndCheckIn? totalBookedAndCheckIn;
  ReservationReport? reservationReport;
  int? occupiedRooms;
  ReservationReportRightTab? reservationReportRightTab;
  CheckInThisWeek? checkInThisWeek;
  RevenueReportThisWeek? revenueReportThisWeek;
  Occupancy? occupancyThisWeek;
  Occupancy? occupancyThisYear;
  Occupancy? occupancyLastYear;

  factory DashBoardModelValue.fromJson(Map<String, dynamic> json) => DashBoardModelValue(
    roomsAndCategoriesReport: RoomsAndCategoriesReport.fromJson(json["rooms_and_categories_report"]),
    bookerAndGuestsReport: BookerAndGuestsReport.fromJson(json["booker_and_guests_report"]),
    arrivalsReport: ArrivalsReport.fromJson(json["arrivals_report"]),
    departuresReport: DeparturesReport.fromJson(json["departures_report"]),
    totalBookedAndCheckIn: TotalBookedAndCheckIn.fromJson(json["total_booked_and_check_in"]),
    reservationReport: ReservationReport.fromJson(json["reservation_report"]),
    occupiedRooms: json["occupied_rooms"],
    reservationReportRightTab: ReservationReportRightTab.fromJson(json["reservation_report_right_tab"]),
    checkInThisWeek: CheckInThisWeek.fromJson(json["check_in_this_week"]),
    revenueReportThisWeek: RevenueReportThisWeek.fromJson(json["revenue_report_this_week"]),
    occupancyThisWeek: Occupancy.fromJson(json["Occupancy_this_week"]),
    occupancyThisYear: Occupancy.fromJson(json["Occupancy_this_year"]),
    occupancyLastYear: Occupancy.fromJson(json["Occupancy_last_year"]),
  );

  Map<String, dynamic> toJson() => {
    "rooms_and_categories_report": roomsAndCategoriesReport!.toJson(),
    "booker_and_guests_report": bookerAndGuestsReport!.toJson(),
    "arrivals_report": arrivalsReport!.toJson(),
    "departures_report": departuresReport!.toJson(),
    "total_booked_and_check_in": totalBookedAndCheckIn!.toJson(),
    "reservation_report": reservationReport!.toJson(),
    "occupied_rooms": occupiedRooms,
    "reservation_report_right_tab": reservationReportRightTab!.toJson(),
    "check_in_this_week": checkInThisWeek!.toJson(),
    "revenue_report_this_week": revenueReportThisWeek!.toJson(),
    "Occupancy_this_week": occupancyThisWeek!.toJson(),
    "Occupancy_this_year": occupancyThisYear!.toJson(),
    "Occupancy_last_year": occupancyLastYear!.toJson(),
  };
}

class ArrivalsReport {
  ArrivalsReport({
    this.totalArrivals,
    this.totalVipGuests,
    this.totalRegularsGuests,
  });

  int? totalArrivals;
  int? totalVipGuests;
  int? totalRegularsGuests;

  factory ArrivalsReport.fromJson(Map<String, dynamic> json) => ArrivalsReport(
    totalArrivals: json["totalArrivals"],
    totalVipGuests: json["totalVIPGuests"],
    totalRegularsGuests: json["totalRegularsGuests"],
  );

  Map<String, dynamic> toJson() => {
    "totalArrivals": totalArrivals,
    "totalVIPGuests": totalVipGuests,
    "totalRegularsGuests": totalRegularsGuests,
  };
}

class BookerAndGuestsReport {
  BookerAndGuestsReport({
    this.totalBookersNr,
    this.totalGuestsNr,
    this.totalVipGuestsNr,
  });

  int? totalBookersNr;
  int? totalGuestsNr;
  int? totalVipGuestsNr;

  factory BookerAndGuestsReport.fromJson(Map<String, dynamic> json) => BookerAndGuestsReport(
    totalBookersNr: json["totalBookersNr"],
    totalGuestsNr: json["totalGuestsNr"],
    totalVipGuestsNr: json["totalVIPGuestsNr"],
  );

  Map<String, dynamic> toJson() => {
    "totalBookersNr": totalBookersNr,
    "totalGuestsNr": totalGuestsNr,
    "totalVIPGuestsNr": totalVipGuestsNr,
  };
}

class CheckInThisWeek {
  CheckInThisWeek({
    this.message,
    this.value,
    this.error,
    this.statusCode,
  });

  String? message;
  CheckInThisWeekValue? value;
  bool? error;
  int? statusCode;

  factory CheckInThisWeek.fromJson(Map<String, dynamic> json) => CheckInThisWeek(
    message: json["message"],
    value: CheckInThisWeekValue.fromJson(json["value"]),
    error: json["error"],
    statusCode: json["status-code"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "value": value!.toJson(),
    "error": error,
    "status-code": statusCode,
  };
}

class CheckInThisWeekValue {
  CheckInThisWeekValue({
    this.totalPerDay,
    this.revenue,
    this.totalLost,
  });

  List<PurpleTotalPerDay>? totalPerDay;
  int? revenue;
  int? totalLost;

  factory CheckInThisWeekValue.fromJson(Map<String, dynamic> json) => CheckInThisWeekValue(
    totalPerDay: List<PurpleTotalPerDay>.from(json["totalPerDay"].map((x) => PurpleTotalPerDay.fromJson(x))),
    revenue: json["revenue"],
    totalLost: json["totalLost"],
  );

  Map<String, dynamic> toJson() => {
    "totalPerDay": List<dynamic>.from(totalPerDay!.map((x) => x.toJson())),
    "revenue": revenue,
    "totalLost": totalLost,
  };
}

class PurpleTotalPerDay {
  PurpleTotalPerDay({
    this.date,
    this.reservationCount,
    this.deletedReservationCount,
    this.totalRevenue,
    this.totalLost,
    this.day,
  });

  DateTime? date;
  int? reservationCount;
  int? deletedReservationCount;
  int? totalRevenue;
  int? totalLost;
  String? day;

  factory PurpleTotalPerDay.fromJson(Map<String, dynamic> json) => PurpleTotalPerDay(
    date: DateTime.parse(json["date"]),
    reservationCount: json["reservationCount"],
    deletedReservationCount: json["deletedReservationCount"],
    totalRevenue: json["totalRevenue"],
    totalLost: json["totalLost"],
    day: json["day"],
  );

  Map<String, dynamic> toJson() => {
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "reservationCount": reservationCount,
    "deletedReservationCount": deletedReservationCount,
    "totalRevenue": totalRevenue,
    "totalLost": totalLost,
    "day": day,
  };
}

class DeparturesReport {
  DeparturesReport({
    this.totalDepartures,
    this.totalVipDepartures,
    this.totalNewDepartures,
  });

  int? totalDepartures;
  int? totalVipDepartures;
  int? totalNewDepartures;

  factory DeparturesReport.fromJson(Map<String, dynamic> json) => DeparturesReport(
    totalDepartures: json["totalDepartures"],
    totalVipDepartures: json["totalVIPDepartures"],
    totalNewDepartures: json["totalNewDepartures"],
  );

  Map<String, dynamic> toJson() => {
    "totalDepartures": totalDepartures,
    "totalVIPDepartures": totalVipDepartures,
    "totalNewDepartures": totalNewDepartures,
  };
}

class Occupancy {
  Occupancy({
    this.message,
    this.value,
    this.error,
    this.statusCode,
  });

  String? message;
  OccupancyLastYearValue? value;
  bool? error;
  int? statusCode;

  factory Occupancy.fromJson(Map<String, dynamic> json) => Occupancy(
    message: json["message"],
    value: OccupancyLastYearValue.fromJson(json["value"]),
    error: json["error"],
    statusCode: json["status-code"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "value": value!.toJson(),
    "error": error,
    "status-code": statusCode,
  };
}

class OccupancyLastYearValue {
  OccupancyLastYearValue({
    this.single,
    this.test,
    this.safas,
    this.tetete,
    this.valueDouble,
    this.t2,
  });

  int? single;
  int? test;
  int? safas;
  int? tetete;
  int? valueDouble;
  int? t2;

  factory OccupancyLastYearValue.fromJson(Map<String, dynamic> json) => OccupancyLastYearValue(
    single: json["Single"],
    test: json["Test"],
    safas: json["safas"],
    tetete: json["TETETE"],
    valueDouble: json["Double"],
    t2: json["T2"],
  );

  Map<String, dynamic> toJson() => {
    "Single": single,
    "Test": test,
    "safas": safas,
    "TETETE": tetete,
    "Double": valueDouble,
    "T2": t2,
  };
}

class ReservationReport {
  ReservationReport({
    this.arrivalReservations,
    this.departuresReservations,
    this.inHouseGuests,
    this.stayOvers,
  });

  Reservations? arrivalReservations;
  Reservations? departuresReservations;
  InHouseGuests? inHouseGuests;
  InHouseGuests? stayOvers;

  factory ReservationReport.fromJson(Map<String, dynamic> json) => ReservationReport(
    arrivalReservations: Reservations.fromJson(json["arrivalReservations"]),
    departuresReservations: Reservations.fromJson(json["departuresReservations"]),
    inHouseGuests: InHouseGuests.fromJson(json["inHouseGuests"]),
    stayOvers: InHouseGuests.fromJson(json["stayOvers"]),
  );

  Map<String, dynamic> toJson() => {
    "arrivalReservations": arrivalReservations!.toJson(),
    "departuresReservations": departuresReservations!.toJson(),
    "inHouseGuests": inHouseGuests!.toJson(),
    "stayOvers": stayOvers!.toJson(),
  };
}

class Reservations {
  Reservations({
    this.todayReservations,
    this.tomorrowReservations,
  });

  List<Reservation>? todayReservations;
  List<Reservation>? tomorrowReservations;

  factory Reservations.fromJson(Map<String, dynamic> json) => Reservations(
    todayReservations: List<Reservation>.from(json["todayReservations"].map((x) => Reservation.fromJson(x))),
    tomorrowReservations: List<Reservation>.from(json["tomorrowReservations"].map((x) => Reservation.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "todayReservations": List<dynamic>.from(todayReservations!.map((x) => x.toJson())),
    "tomorrowReservations": List<dynamic>.from(tomorrowReservations!.map((x) => x.toJson())),
  };
}

class Reservation {
  Reservation({
    this.reservationId,
    this.totalRoomsNr,
    this.stayingDays,
    this.arrival,
    this.departure,
    this.rooms,
    this.guests,
    this.booker,
    this.reservationStatusName,
    this.connectivitySourceName,
    this.color,
    this.isLock,
    this.total,
    this.totalPayments,
    this.dueAmount,
    this.paymentStatus,
  });

  int? reservationId;
  int? totalRoomsNr;
  int? stayingDays;
  int? arrival;
  int? departure;
  List<Room>? rooms;
  List<dynamic>? guests;
  Booker? booker;
  ReservationStatusName? reservationStatusName;
  ConnectivitySourceName? connectivitySourceName;
  Color? color;
  bool? isLock;
  int? total;
  int? totalPayments;
  int? dueAmount;
  PaymentStatus? paymentStatus;

  factory Reservation.fromJson(Map<String, dynamic> json) => Reservation(
    reservationId: json["reservationId"],
    totalRoomsNr: json["totalRoomsNr"],
    stayingDays: json["stayingDays"],
    arrival: json["arrival"],
    departure: json["departure"],
    rooms: List<Room>.from(json["rooms"].map((x) => Room.fromJson(x))),
    guests: List<dynamic>.from(json["guests"].map((x) => x)),
    booker: Booker.fromJson(json["booker"]),
    reservationStatusName: reservationStatusNameValues.map![json["reservationStatusName"]],
    connectivitySourceName: connectivitySourceNameValues.map![json["connectivitySourceName"]],
    color: colorValues.map![json["color"]],
    isLock: json["isLock"],
    total: json["total"],
    totalPayments: json["totalPayments"],
    dueAmount: json["dueAmount"],
    paymentStatus: paymentStatusValues.map![json["paymentStatus"]],
  );

  Map<String, dynamic> toJson() => {
    "reservationId": reservationId,
    "totalRoomsNr": totalRoomsNr,
    "stayingDays": stayingDays,
    "arrival": arrival,
    "departure": departure,
    "rooms": List<dynamic>.from(rooms!.map((x) => x.toJson())),
    "guests": List<dynamic>.from(guests!.map((x) => x)),
    "booker": booker!.toJson(),
    "reservationStatusName": reservationStatusNameValues.reverse![reservationStatusName],
    "connectivitySourceName": connectivitySourceNameValues.reverse![connectivitySourceName],
    "color": colorValues.reverse![color],
    "isLock": isLock,
    "total": total,
    "totalPayments": totalPayments,
    "dueAmount": dueAmount,
    "paymentStatus": paymentStatusValues.reverse![paymentStatus],
  };
}

class Booker {
  Booker({
    this.firstName,
    this.lastName,
  });

  FirstName? firstName;
  LastName? lastName;

  factory Booker.fromJson(Map<String, dynamic> json) => Booker(
    firstName: firstNameValues.map![json["firstName"]],
    lastName: lastNameValues.map![json["lastName"]],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstNameValues.reverse![firstName],
    "lastName": lastNameValues.reverse![lastName],
  };
}

enum FirstName { ALBANA }

final firstNameValues = EnumValues({
  "Albana": FirstName.ALBANA
});

enum LastName { KOLA }

final lastNameValues = EnumValues({
  "Kola": LastName.KOLA
});

enum Color { THE_80_FFFF }

final colorValues = EnumValues({
  "#80ffff": Color.THE_80_FFFF
});

enum ConnectivitySourceName { ALBA_TRAVEL }

final connectivitySourceNameValues = EnumValues({
  "AlbaTravel": ConnectivitySourceName.ALBA_TRAVEL
});

enum PaymentStatus { UNPAID }

final paymentStatusValues = EnumValues({
  "Unpaid": PaymentStatus.UNPAID
});

enum ReservationStatusName { BOOKED }

final reservationStatusNameValues = EnumValues({
  "Booked": ReservationStatusName.BOOKED
});

class Room {
  Room({
    this.name,
    this.number,
  });

  Name? name;
  int? number;

  factory Room.fromJson(Map<String, dynamic> json) => Room(
    name: nameValues.map![json["name"]],
    number: json["number"],
  );

  Map<String, dynamic> toJson() => {
    "name": nameValues.reverse![name],
    "number": number,
  };
}

enum Name { ROOM }

final nameValues = EnumValues({
  "Room": Name.ROOM
});

class InHouseGuests {
  InHouseGuests({
    this.guestsTotalNr,
    this.adultGuestTotalNr,
    this.childGuestTotalNr,
    this.guests,
  });

  int? guestsTotalNr;
  int? adultGuestTotalNr;
  int? childGuestTotalNr;
  List<dynamic>? guests;

  factory InHouseGuests.fromJson(Map<String, dynamic> json) => InHouseGuests(
    guestsTotalNr: json["guestsTotalNr"],
    adultGuestTotalNr: json["adultGuestTotalNr"],
    childGuestTotalNr: json["childGuestTotalNr"],
    guests: List<dynamic>.from(json["guests"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "guestsTotalNr": guestsTotalNr,
    "adultGuestTotalNr": adultGuestTotalNr,
    "childGuestTotalNr": childGuestTotalNr,
    "guests": List<dynamic>.from(guests!.map((x) => x)),
  };
}

class ReservationReportRightTab {
  ReservationReportRightTab({
    this.totalTodayReservations,
    this.totalStayingDaysToday,
    this.totalTodayIsDeletedReservations,
    this.totalIsDeletedStayingDaysToday,
    this.totalTodayReservationRooms,
    this.todayReservation,
    this.isCanceledTodayReservation,
    this.totalRevenue,
    this.totalLost,
  });

  int? totalTodayReservations;
  int? totalStayingDaysToday;
  int? totalTodayIsDeletedReservations;
  int? totalIsDeletedStayingDaysToday;
  int? totalTodayReservationRooms;
  List<dynamic>? todayReservation;
  List<dynamic>? isCanceledTodayReservation;
  int? totalRevenue;
  int? totalLost;

  factory ReservationReportRightTab.fromJson(Map<String, dynamic> json) => ReservationReportRightTab(
    totalTodayReservations: json["totalTodayReservations"],
    totalStayingDaysToday: json["totalStayingDaysToday"],
    totalTodayIsDeletedReservations: json["totalTodayIsDeletedReservations"],
    totalIsDeletedStayingDaysToday: json["totalIsDeletedStayingDaysToday"],
    totalTodayReservationRooms: json["totalTodayReservationRooms"],
    todayReservation: List<dynamic>.from(json["todayReservation"].map((x) => x)),
    isCanceledTodayReservation: List<dynamic>.from(json["isCanceledTodayReservation"].map((x) => x)),
    totalRevenue: json["totalRevenue"],
    totalLost: json["totalLost"],
  );

  Map<String, dynamic> toJson() => {
    "totalTodayReservations": totalTodayReservations,
    "totalStayingDaysToday": totalStayingDaysToday,
    "totalTodayIsDeletedReservations": totalTodayIsDeletedReservations,
    "totalIsDeletedStayingDaysToday": totalIsDeletedStayingDaysToday,
    "totalTodayReservationRooms": totalTodayReservationRooms,
    "todayReservation": List<dynamic>.from(todayReservation!.map((x) => x)),
    "isCanceledTodayReservation": List<dynamic>.from(isCanceledTodayReservation!.map((x) => x)),
    "totalRevenue": totalRevenue,
    "totalLost": totalLost,
  };
}

class RevenueReportThisWeek {
  RevenueReportThisWeek({
    this.message,
    this.value,
    this.error,
    this.statusCode,
  });

  String? message;
  RevenueReportThisWeekValue? value;
  bool? error;
  int? statusCode;

  factory RevenueReportThisWeek.fromJson(Map<String, dynamic> json) => RevenueReportThisWeek(
    message: json["message"],
    value: RevenueReportThisWeekValue.fromJson(json["value"]),
    error: json["error"],
    statusCode: json["status-code"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "value": value!.toJson(),
    "error": error,
    "status-code": statusCode,
  };
}

class RevenueReportThisWeekValue {
  RevenueReportThisWeekValue({
    this.totalPerDay,
  });

  List<FluffyTotalPerDay>? totalPerDay;

  factory RevenueReportThisWeekValue.fromJson(Map<String, dynamic> json) => RevenueReportThisWeekValue(
    totalPerDay: List<FluffyTotalPerDay>.from(json["totalPerDay"].map((x) => FluffyTotalPerDay.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "totalPerDay": List<dynamic>.from(totalPerDay!.map((x) => x.toJson())),
  };
}

class FluffyTotalPerDay {
  FluffyTotalPerDay({
    this.date,
    this.discountTotal,
    this.day,
  });

  DateTime? date;
  int? discountTotal;
  String? day;

  factory FluffyTotalPerDay.fromJson(Map<String, dynamic> json) => FluffyTotalPerDay(
    date: DateTime.parse(json["date"]),
    discountTotal: json["discountTotal"],
    day: json["day"],
  );

  Map<String, dynamic> toJson() => {
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "discountTotal": discountTotal,
    "day": day,
  };
}

class RoomsAndCategoriesReport {
  RoomsAndCategoriesReport({
    this.totalRoomNr,
    this.totalCategoriesNr,
    this.categoriesReport,
  });

  int? totalRoomNr;
  int? totalCategoriesNr;
  List<CategoriesReport>? categoriesReport;

  factory RoomsAndCategoriesReport.fromJson(Map<String, dynamic> json) => RoomsAndCategoriesReport(
    totalRoomNr: json["totalRoomNr"],
    totalCategoriesNr: json["totalCategoriesNr"],
    categoriesReport: List<CategoriesReport>.from(json["categoriesReport"].map((x) => CategoriesReport.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "totalRoomNr": totalRoomNr,
    "totalCategoriesNr": totalCategoriesNr,
    "categoriesReport": List<dynamic>.from(categoriesReport!.map((x) => x.toJson())),
  };
}

class CategoriesReport {
  CategoriesReport({
    this.roomCategory,
    this.countRooms,
  });

  RoomCategory? roomCategory;
  int? countRooms;

  factory CategoriesReport.fromJson(Map<String, dynamic> json) => CategoriesReport(
    roomCategory: RoomCategory.fromJson(json["roomCategory"]),
    countRooms: json["countRooms"],
  );

  Map<String, dynamic> toJson() => {
    "roomCategory": roomCategory!.toJson(),
    "countRooms": countRooms,
  };
}

class RoomCategory {
  RoomCategory({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory RoomCategory.fromJson(Map<String, dynamic> json) => RoomCategory(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class TotalBookedAndCheckIn {
  TotalBookedAndCheckIn({
    this.totalBooked,
    this.totalCheckIn,
  });

  int? totalBooked;
  int? totalCheckIn;

  factory TotalBookedAndCheckIn.fromJson(Map<String, dynamic> json) => TotalBookedAndCheckIn(
    totalBooked: json["totalBooked"],
    totalCheckIn: json["totalCheckIn"],
  );

  Map<String, dynamic> toJson() => {
    "totalBooked": totalBooked,
    "totalCheckIn": totalCheckIn,
  };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap != null) {
      reverseMap = map!.map((k, v) =>  MapEntry(v, k));
    }
    return reverseMap;
  }
}
