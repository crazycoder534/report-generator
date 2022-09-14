import 'package:book/report_list_screen.dart';
import 'package:book/report_model.dart';
import 'package:book/widgets.dart';
import 'package:flutter/material.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  String? myValidator(value) {
    if (value == null || value.isEmpty || value == '') {
      return 'Field is required';
    }
    return null;
  }

  final _formKey = GlobalKey<FormState>();
  Report report = Report('', '', '', '', '');
  bool male = true;
  bool feMale = false;
  String? name;
  String? address;
  String? phoneNumber;
  String? cnic;
  String? gender;
  generateReport() {
    setState(() {
      report.name = name!;
      report.address = address!;
      report.phoneNumber = phoneNumber!;
      report.cnic = cnic!;
      report.gender = gender ?? 'Male';
      reports.add(Report(name!, address!, phoneNumber!, cnic!, gender!));
      print('${report.address} <===============================');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Generate report'),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Name'),
              validator: myValidator,
              onSaved: (value) {
                name = value;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Address'),
              validator: myValidator,
              onSaved: (value) {
                address = value;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Phone Number'),
              validator: myValidator,
              onSaved: (value) {
                phoneNumber = value;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(labelText: 'CNIC'),
              validator: myValidator,
              onSaved: (value) {
                cnic = value;
              },
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Checkbox(
                    value: male,
                    onChanged: (value) {
                      setState(() {
                        male = value!;
                        feMale = false;
                        gender = 'Male';
                      });
                    }),
                Checkbox(
                    value: feMale,
                    onChanged: (value) {
                      setState(() {
                        feMale = value!;
                        male = false;
                        gender = 'Female';
                      });
                    })
              ],
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    generateReport();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ReportListScreen()));
                  }
                  null;
                },
                child: Text('Submit'.toUpperCase())),
          ],
        ),
      ),
    );
  }
}
