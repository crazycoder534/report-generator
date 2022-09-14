import 'package:book/report_model.dart';
import 'package:book/report_to_sho.dart';
import 'package:flutter/material.dart';

class ReportListScreen extends StatefulWidget {
  const ReportListScreen({super.key});

  @override
  State<ReportListScreen> createState() => _ReportListScreenState();
}

class _ReportListScreenState extends State<ReportListScreen> {
  final List<Report> recievedreports = reports;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report List'),
      ),
      body: ListView.builder(
        itemCount: reports.length,
        itemBuilder: (context, index) {
          var repo = recievedreports[index];
          return Card(
            child: ListTile(
              title: Text(repo.name),
              subtitle: Text(repo.cnic),
              leading: Text(repo.gender),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SHOReport(
                            name: repo.name,
                            address: repo.address,
                            gender: repo.gender,
                            cnic: repo.cnic,
                            phoneNumber: repo.phoneNumber,
                          ))),
            ),
          );
        },
      ),
    );
  }
}
