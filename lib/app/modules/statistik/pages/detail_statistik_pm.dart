import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../views/statistik_pm.dart';

class Person {
  final int id;
  final String name;
  final String role;
  final int productify;
  final int contribution;

  Person({
    required this.id,
    required this.name,
    required this.role,
    required this.productify,
    required this.contribution,
  });
}

class DetailStatistikPm extends StatelessWidget {
  final String projectName;
  final String dateRange;
  final String completionPercentage;

  final List<Person> people = [
    Person(
        id: 1,
        name: "Rizki Hi Ibrahim",
        role: "Mobile Dev",
        productify: 80,
        contribution: 50),
    Person(
        id: 2,
        name: "Wahyu Jihad Umaternate",
        role: "Mobile Dev",
        productify: 70,
        contribution: 60),
    // Add more data as needed
  ];

  DetailStatistikPm({
    required this.projectName,
    required this.dateRange,
    required this.completionPercentage,
    Key? key,
    required Project project,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Menonaktifkan tombol kembali
        centerTitle: true, // Menempatkan judul di tengah
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          "Detail Project",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            height: 29.69,
            width: 28.48,
            decoration: BoxDecoration(
              color: Color(0XFFD9D9D9),
              borderRadius: BorderRadius.circular(5),
            ),
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                size: 20,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              projectName,
              softWrap: true,

              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
              // overflow: TextOver ,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Table(
              // border: TableBorder.all(),
              border: TableBorder.all(color: Colors.transparent),
              columnWidths: const <int, TableColumnWidth>{
                // 0: IntrinsicColumnWidth(),
                1: FlexColumnWidth(),
                2: FlexColumnWidth(),
                3: FlexColumnWidth(),
                4: FlexColumnWidth(),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: <TableRow>[
                TableRow(
                  children: <Widget>[
                    // TableCell(
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: Text(
                    //       "No",
                    //       style: TextStyle(
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Nama",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Role",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Productify",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Contribution",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                for (var person in people)
                  TableRow(
                    children: <Widget>[
                      // TableCell(
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child: Text(person.id.toString()),
                      //   ),
                      // ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(person.name),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(person.role),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(person.productify.toString() + '%'),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(person.contribution.toString() + '%'),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TableExample extends StatelessWidget {
  const TableExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      columnWidths: const <int, TableColumnWidth>{
        0: IntrinsicColumnWidth(),
        1: FlexColumnWidth(),
        2: FixedColumnWidth(64),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: <TableRow>[
        TableRow(
          children: <Widget>[
            Container(
              height: 32,
              color: Colors.green,
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.top,
              child: Container(
                height: 32,
                width: 32,
                color: Colors.red,
              ),
            ),
            Container(
              height: 64,
              color: Colors.blue,
            ),
          ],
        ),
        TableRow(
          decoration: const BoxDecoration(
            color: Colors.grey,
          ),
          children: <Widget>[
            Container(
              height: 64,
              width: 128,
              color: Colors.purple,
            ),
            Container(
              height: 32,
              color: Colors.yellow,
            ),
            Center(
              child: Container(
                height: 32,
                width: 32,
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ],
    );
  }
}