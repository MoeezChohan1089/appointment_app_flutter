import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
class CustomCalendarDialogue extends StatelessWidget {
   const CustomCalendarDialogue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 100,right: 18,top: 20),
      child: Align(
        alignment: const Alignment(0, -1),
        child: Material(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SfCalendar(
                  view: CalendarView.month,
                  cellEndPadding: 5,
                  allowedViews: const <CalendarView>[
                    CalendarView.day,
                    CalendarView.week,
                    CalendarView.workWeek,
                    CalendarView.month,
                    CalendarView.timelineDay,
                    CalendarView.timelineWeek,
                    CalendarView.timelineWorkWeek,
                    CalendarView.timelineMonth,
                    CalendarView.schedule,
                  ],
                  viewHeaderStyle:  const ViewHeaderStyle(),
                  monthViewSettings: const MonthViewSettings(
                      appointmentDisplayMode:
                      MonthAppointmentDisplayMode.appointment),
                  dataSource: _getDataSource(),
                  showNavigationArrow: false,
                  showDatePickerButton: false,
                  allowViewNavigation: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
   _DataSource _getDataSource() {
     final List<Appointment> appointments = <Appointment>[];
     appointments.add(Appointment(
       startTime: DateTime.now().add(const Duration(hours: 4)),
       endTime: DateTime.now().add(const Duration(hours: 5)),
       subject: 'Meeting',
       color: Colors.red,
     ));
     appointments.add(Appointment(
       startTime: DateTime.now().add(const Duration(days: -2, hours: 4)),
       endTime: DateTime.now().add(const Duration(days: -2, hours: 5)),
       subject: 'Development Meeting   New York, U.S.A',
       color: const Color(0xfff527318),
     ));
     appointments.add(Appointment(
       startTime: DateTime.now().add(const Duration(days: -2, hours: 3)),
       endTime: DateTime.now().add(const Duration(days: -2, hours: 4)),
       subject: 'Project Plan Meeting   Kuala Lumpur, Malaysia',
       color: const Color(0xfffb21f66),
     ));
     appointments.add(Appointment(
       startTime: DateTime.now().add(const Duration(days: -2, hours: 2)),
       endTime: DateTime.now().add(const Duration(days: -2, hours: 3)),
       subject: 'Support - Web Meeting   Dubai, UAE',
       color: const Color(0xfff3282b8),
     ));
     appointments.add(Appointment(
       startTime: DateTime.now().add(const Duration(days: -2, hours: 1)),
       endTime: DateTime.now().add(const Duration(days: -2, hours: 2)),
       subject: 'Project Release Meeting   Istanbul, Turkey',
       color: const Color(0xfff2a7886),
     ));
     appointments.add(Appointment(
         startTime: DateTime.now().add(const Duration(hours: 4, days: -1)),
         endTime: DateTime.now().add(const Duration(hours: 5, days: -1)),
         subject: 'Release Meeting',
         color: Colors.lightBlueAccent,
         isAllDay: true));
     appointments.add(Appointment(
       startTime: DateTime.now().add(const Duration(hours: 2, days: -4)),
       endTime: DateTime.now().add(const Duration(hours: 4, days: -4)),
       subject: 'Performance check',
       color: Colors.amber,
     ));
     appointments.add(Appointment(
       startTime: DateTime.now().add(const Duration(hours: 11, days: -2)),
       endTime: DateTime.now().add(const Duration(hours: 12, days: -2)),
       subject: 'Customer Meeting   Tokyo, Japan',
       color: const Color(0xffffb8d62),
     ));
     appointments.add(Appointment(
       startTime: DateTime.now().add(const Duration(hours: 6, days: 2)),
       endTime: DateTime.now().add(const Duration(hours: 7, days: 2)),
       subject: 'Retrospective',
       color: Colors.purple,
     ));

     return _DataSource(appointments);

   }

}
class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source) {
    appointments = source;
  }
}