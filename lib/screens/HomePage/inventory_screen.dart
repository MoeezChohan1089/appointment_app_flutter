import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:pms/Api/api_url.dart';
import 'package:pms/models/reservations.dart';
import 'package:pms/utilites/constants.dart';
import 'package:pms/widgets/custom_text.dart';

extension DateUtils on DateTime {
  DateTime get tomorrow {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return DateTime(tomorrow.year, tomorrow.month, tomorrow.day);
  }

  DateTime get overmorrow {
    final overmorrow = DateTime.now().add(const Duration(days: 2));
    return DateTime(overmorrow.year, overmorrow.month, overmorrow.day);
  }

  DateTime get nextOvermorrow {
    final nextOvermorrow = DateTime.now().add(const Duration(days: 3));
    return DateTime(
        nextOvermorrow.year, nextOvermorrow.month, nextOvermorrow.day);
  }

  DateTime get dayAfertNextOvermorrow {
    final nextOvermorrow = DateTime.now().add(const Duration(days: 4));
    return DateTime(
        nextOvermorrow.year, nextOvermorrow.month, nextOvermorrow.day);
  }
}

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({Key? key}) : super(key: key);

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  EmployeeDataSource? employeeDataSource;

  @override
  void initState() {
    getDashboardData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mediumGreyColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: const CustomText(
          title: "Inventory",
          fontSize: 17,
          color: whiteColor,
        ),
      ),
      body: Column(
        children: [
          //Space
          const SizedBox(
            height: 20,
          ),
          //
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  Icons.arrow_back_ios_outlined,
                  size: 18,
                  color: greyIconColor,
                ),
                CustomText(
                  title: "March 2021",
                  fontSize: 17,
                  color: mediumPurpleColor,
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18,
                  color: greyIconColor,
                ),
              ],
            ),
          ),
          //Space
          const SizedBox(
            height: 20,
          ),
          //March Rooms Record
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            alignment: Alignment.centerLeft,
            child: const CustomText(
              title: "March Rooms Record",
              fontSize: 16,
              color: mediumPurpleColor2,
            ),
          ),
          //Space
          const SizedBox(
            height: 5,
          ),
          //
          Expanded(
              child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
            child: Column(
              children: [
                //Space
                const SizedBox(
                  height: 20,
                ),
                //By Category
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  alignment: Alignment.centerLeft,
                  child: const CustomText(
                    title: "By Category",
                    fontSize: 16,
                    color: mediumPurpleColor2,
                  ),
                ),
                //Space
                const SizedBox(
                  height: 10,
                ),
                //
                Expanded(
                  child: employeeDataSource == null
                      ? const Center(child: CircularProgressIndicator())
                      : Container(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: SfData(
                            instance: employeeDataSource!,
                          ),
                        ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }

  // Widget sfdata() {
  //   return  }

  // List<Employee> employees = <Employee>[];
  List<Inventory> inventory = <Inventory>[];

  Future<Simple?> getDashboardData() async {
    // print('object first time *********************');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.getString("accessToken");
    // print('$accessToken' 'accessToken');
    Simple? simpleModel;
    final response = await http.get(ApiUrl.prices, headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $accessToken",
    });
    // print('response.body ' '${response.body}');
    if (response.statusCode == 200) {
      // print('${response.body}' ' response.body********');
      simpleModel = simpleFromJson(response.body);
      for (var element in simpleModel.value) {
        if (element.roomCategory.isNotEmpty) {
          setState(() {
            int totalRoom = element.rooms.length;
            inventory.add(Inventory(
                roomCategory: element.roomCategory,
                roomAvailable: totalRoom,
                spare: totalRoom,
                spare1: totalRoom,
                spare2: totalRoom));
            if (element.rooms.isNotEmpty) {
              for (var element in element.rooms) {
                inventory.add(Inventory(
                    roomCategory: element.number.toString(),
                    roomAvailable: 0,
                    spare: 0,
                    spare1: 0,
                    spare2: 0));
              }
            }
          });
        }
      }
      setState(() {
        employeeDataSource = EmployeeDataSource(employees: inventory);
      });
      // employeeDataSource = EmployeeDataSource(employees: inventory);

      return simpleModel;
    }
    return null;
  }

  // List<Employee> getEmployees() {
  //   return [
  //     Employee('Standard S', '5', '5', '5', '5'),
  //     Employee(
  //       '301',
  //       '0',
  //       '0',
  //       '0',
  //       '0',
  //     ),
  //     Employee(
  //       '302',
  //       '0',
  //       '0',
  //       '0',
  //       '0',
  //     ),
  //     Employee(
  //       '303',
  //       '0',
  //       '0',
  //       '0',
  //       '0',
  //     ),
  //     Employee(
  //       '304',
  //       '0',
  //       '0',
  //       '0',
  //       '0',
  //     ),
  //     Employee(
  //       '305',
  //       '0',
  //       '0',
  //       '0',
  //       '0',
  //     ),
  //     Employee(
  //       'Superior S',
  //       '2',
  //       '2',
  //       '2',
  //       '2',
  //     ),
  //     Employee('Vip Room', '3', '3', '3', '3'),
  //     Employee('Superior D', '5', '5', '5', '5'),
  //     Employee('Triple Roo', '5', '5', '5', '5'),
  //     Employee('Standard D', '5', '5', '5', '5'),
  //     Employee('Cabana', '4', '4', '4', '4'),
  //     Employee('Quad Roo', '5', '5', '5', '5'),
  //     Employee('Suite', '5', '5', '5', '5'),
  //     Employee('Deluxe S', '5', '5', '5', '5'),
  //   ];
  // }

  // List<Employee> getEmployees() {
  //   return[
  //     Employee('Standard S', '5', '5','5','5','5','5','5','5','5',"5"),
  //     Employee( '301', '0','0','0','0','0','0','0','0','0','0', ),
  //     Employee( '302', '0','0','0','0','0','0','0','0','0','0', ),
  //     Employee( '303', '0', '0','0','0','0','0','0','0','0','0',),
  //     Employee( '304', '0','0','0','0','0','0','0','0','0','0', ),
  //     Employee( '305', '0','0','0','0','0','0','0','0','0','0', ),
  //     Employee( 'Superior S', '2', '2','2','2','2','2','2','2','2','2',),
  //     Employee( 'Vip Room', '3','3','3','3','3','3','3','3','3','3', ),
  //     Employee( 'Superior D', '5','5','5','5','5','5','5','5','5','5', ),
  //     Employee( 'Triple Roo', '5','5','5','5','5','5','5','5','5','5', ),
  //     Employee( 'Standard D', '5','5','5','5','5','5','5','5','5','5', ),
  //     Employee( 'Cabana', '4','4','4','4','4','4','4','4','4','4', ),
  //     Employee( 'Quad Roo', '5','5','5','5','5','5','5','5','5','5', ),
  //     Employee( 'Suite', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', ),
  //     Employee( 'Deluxe S', '5','5','5','5','5','5','5','5','5','5', ),
  //   ];
  // }
}

class Inventory {
  final String roomCategory;
  final int roomAvailable;
  final int spare;
  final int spare1;
  final int spare2;

  Inventory({
    required this.roomCategory,
    required this.roomAvailable,
    required this.spare,
    required this.spare1,
    required this.spare2,
  });
}

class SfData extends StatefulWidget {
  const SfData({
    Key? key,
    required this.instance,
  }) : super(key: key);
  final EmployeeDataSource instance;

  @override
  State<SfData> createState() => _SfDataState();
}

class _SfDataState extends State<SfData> {
  late DateTime now;
  late DateTime tomorrow;
  late DateTime overmorrow;
  late DateTime nextOvermorrow;
  // DateTime? dayAfterNextOvermorrow;
  String? firstDay;
  String? secondDay;
  String? thirdDay;
  String? fourthDay;
  @override
  void initState() {
    now = DateTime.now();
    tomorrow = now.tomorrow;
    overmorrow = now.overmorrow;
    nextOvermorrow = now.nextOvermorrow;
    firstDay = DateFormat('EEEEE', 'en_US').format(now);
    secondDay = DateFormat('EEEEE', 'en_US').format(tomorrow);
    thirdDay = DateFormat('EEEEE', 'en_US').format(overmorrow);
    fourthDay = DateFormat('EEEEE', 'en_US').format(nextOvermorrow);
    // dayAfterNextOvermorrow = now.dayAfertNextOvermorrow;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfDataGrid(
      gridLinesVisibility: GridLinesVisibility.both,
      headerGridLinesVisibility: GridLinesVisibility.both,
      rowHeight: 30,
      allowEditing: true,
      columnWidthMode: ColumnWidthMode.fill,
      source: widget.instance,
      columns: <GridColumn>[
        GridColumn(
            columnName: '',
            label: Container(
                // padding: EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: const Text(
                  '',
                ))),
        GridColumn(
          columnName: '$firstDay!.substring(0, 3)',
          label: Container(
            padding: const EdgeInsets.all(5.0),
            alignment: Alignment.center,
            child: Text('${now.day}\n${firstDay!.substring(0, 1)}'),
          ),
        ),
        GridColumn(
          columnName: '$secondDay!.substring(0, 3)',
          label: Container(
            padding: const EdgeInsets.all(5.0),
            alignment: Alignment.center,
            child: Text('${tomorrow.day}\n${secondDay!.substring(0, 1)}'),
          ),
        ),
        GridColumn(
          columnName: '$thirdDay!.substring(0, 3)',
          label: Container(
            padding: const EdgeInsets.all(5.0),
            alignment: Alignment.center,
            child: Text('${overmorrow.day}\n${thirdDay!.substring(0, 1)}'),
          ),
        ),
        GridColumn(
          columnName: '$fourthDay!.substring(0, 3)',
          label: Container(
            padding: const EdgeInsets.all(5.0),
            alignment: Alignment.center,
            child: Text('${nextOvermorrow.day}\n${fourthDay!.substring(0, 1)}'),
          ),
        ),
      ],
    );
  }
}

// class Employee {
//   Employee(
//     this.id,
//     this.day1,
//     this.day2,
//     this.day3,
//     this.day4,
//     // this.day5,
//     // this.day6,
//     // this.day7,
//     // this.day8,
//     // this.day9,
//     // this.day10,
//   );
//   final String id;
//   final String day1;
//   final String day2;
//   final String day3;
//   final String day4;
//   // final String day5;
//   // final String day6;
//   // final String day7;
//   // final String day8;
//   // final String day9;
//   // final String day10;
// }

class EmployeeDataSource extends DataGridSource {
  EmployeeDataSource({required List<Inventory> employees}) {
    _employees = employees.map<DataGridRow>((e) {
      // print(e.id);
      return DataGridRow(cells: [
        DataGridCell<String>(
          columnName: e.roomCategory,
          value: e.roomCategory,
        ),
        DataGridCell<int>(
          columnName: e.roomAvailable.toString(),
          value: e.roomAvailable,
        ),
        DataGridCell<int>(columnName: e.spare.toString(), value: e.spare),
        DataGridCell<String>(
          columnName: e.spare1.toString(),
          value: e.spare1.toString(),
        ),
        DataGridCell<String>(
            columnName: e.spare2.toString(), value: e.spare2.toString()),
      ]);
    }).toList();
  }

  List<DataGridRow> _employees = [];

  @override
  List<DataGridRow> get rows => _employees;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    print(row.getCells().length);
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
        alignment: (dataGridCell.columnName == 'id')
            ? Alignment.centerLeft
            : Alignment.center,
        padding: const EdgeInsets.all(5.0),
        child: CustomText(
          title: dataGridCell.value.toString(),
          color: dataGridCell.columnName == 'id' ? kPrimaryColor : greyColor,
        ),
      );
    }).toList());
  }
}
