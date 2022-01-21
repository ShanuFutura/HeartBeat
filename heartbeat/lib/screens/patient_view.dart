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
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (!isLabtest)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                onPressed: () {},
                child: IconButton(onPressed: () {}, icon: Icon(Icons.add)),
              ),
            ),
          GestureDetector(
            onTap: () {
              setState(() {
                isLabtest = !isLabtest;
              });
            },
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  color: Colors.blue,
                ),
                height: 90,
                width: 90,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      isLabtest ? Icons.text_snippet : Icons.biotech,
                      size: 60,
                      color: Colors.white,
                    ),
                    Text(
                      isLabtest ? 'Prescriptions' : 'Lab results',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ],
                )
                // FittedBox(
                //   child: FloatingActionButton(
                //     onPressed: () {
                //       setState(() {
                //         isLabtest = !isLabtest;
                //       });
                //     },
                //     child: Center(
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           Icon(isLabtest ? Icons.text_snippet : Icons.biotech),
                //           Text(
                //             isLabtest ? 'Prescriptions' : 'Lab results',
                //             style: TextStyle(fontSize: 6),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                ),
          ),
        ],
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
