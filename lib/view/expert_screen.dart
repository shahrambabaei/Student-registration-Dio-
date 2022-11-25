import 'package:flutter/material.dart';
import 'package:test_http/data.dart';
import 'package:test_http/view/add_student_screen.dart';

class ExpertScreen extends StatefulWidget {
  const ExpertScreen({super.key});

  @override
  State<ExpertScreen> createState() => _ExpertScreenState();
}

class _ExpertScreenState extends State<ExpertScreen> {
  final student = getStudent();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Android Expert'),
      ),
      body: FutureBuilder<List<StudentData>>(
        future: getStudent(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(15, 5, 15, 80),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final StudentData studentdata = snapshot.data![index];
                return SizedBox(
                  height: 110,
                  child: Card(
                    margin: const EdgeInsets.only(top: 10),
                    child: Row(children: [
                      Expanded(
                          flex: 1,
                          child: Center(
                            child: Container(
                              width: 65,
                              height: 65,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(.1),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                studentdata.firstName.characters.first,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                          )),
                      Expanded(
                          flex: 2,
                          child: SizedBox(
                            height: 65,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${studentdata.firstName} ${studentdata.lastName}',
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                                const SizedBox(height: 7),
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(7, 2, 7, 2),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      color: Colors.blue.withOpacity(.2)),
                                  child: Text(studentdata.course),
                                )
                              ],
                            ),
                          )),
                      Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.bar_chart_rounded),
                              const SizedBox(height: 4),
                              Text(studentdata.score.toString())
                            ],
                          )),
                    ]),
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            var result = await Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const AddStudentScreen(),
            ));
            setState(() {});
          },
          label: Row(
            children: const [Icon(Icons.add), Text('Add Student')],
          )),
    );
  }
}
