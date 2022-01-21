import 'package:flutter/material.dart';
import 'package:heartbeat/models/labtest_report.dart';
import 'package:heartbeat/models/prescriptions.dart';

class PatientView extends StatefulWidget {
  // const PatientView({ Key? key }) : super(key: key);

  static const String routeName = 'patientView';

  @override
  State<PatientView> createState() => _PatientViewState();
}

class _PatientViewState extends State<PatientView> {
  var isLabtest = false;

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isLabtest = !isLabtest;
          });
        },
        child: Icon(isLabtest ? Icons.text_snippet : Icons.biotech),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            snap: true,
            floating: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              // centerTitle: true,
              background: Stack(
                alignment: Alignment.topRight,
                children: [
                  // Image.asset(
                  //   'assets/images/wallpaper.jpg',
                  //   fit: BoxFit.fitHeight,
                  // ),
                  Container(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 70, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'gender',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'age',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              title: Text(arg),
            ),
          ),
          SliverFillRemaining(
            child: Column(
              children: [
                if (!isLabtest)
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: Prescriptions.prescriptionsList.length,
                    itemBuilder: (ctx, index) {
                      return Column(
                        children: [
                          ListTile(
                            leading: Text(Prescriptions.prescriptionsList[index]
                                ['PrescriptionId']!),
                            subtitle: Text(Prescriptions
                                .prescriptionsList[index]['PrescriptionDate']!),
                            trailing: Text(Prescriptions
                                .prescriptionsList[index]['contents']!),
                          ),
                          const Divider(
                            thickness: 2,
                          ),
                        ],
                      );
                    },
                  ),
                if (isLabtest)
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: LabtestReport.labtestReportsList.length,
                    itemBuilder: (ctx, index) {
                      return Column(
                        children: [
                          ListTile(
                            title: Text(LabtestReport.labtestReportsList[index]
                                ['content']!),
                            subtitle: Text(LabtestReport
                                .labtestReportsList[index]['date']!),
                            // trailing: Text(Prescriptions
                            //     .prescriptionsList[index]['contents']!),
                          ),
                          const Divider(
                            thickness: 2,
                          ),
                        ],
                      );
                    },
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
