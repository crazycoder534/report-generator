import 'package:book/widgets.dart';
import 'package:flutter/material.dart';

class SHOReport extends StatelessWidget {
  final String name;
  final String address;
  final String phoneNumber;
  final String cnic;
  final String gender;
  const SHOReport(
      {super.key,
      required this.name,
      required this.address,
      required this.phoneNumber,
      required this.cnic,
      required this.gender});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(cnic),
      body: Center(
        child: SizedBox(
          // width: double.maxFinite,
          // height: MediaQuery.of(context).size.height * 0.7,
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Report Details', style: TextStyle(fontSize: 36)),
                const SizedBox(height: 20),
                ListTile(
                  title: const Text('Name'),
                  trailing: Text(name),
                ),
                ListTile(
                  title: const Text('Address'),
                  trailing: Text(address),
                ),
                ListTile(
                  title: const Text('Phone number'),
                  trailing: Text(phoneNumber),
                ),
                ListTile(
                  title: const Text('CNIC'),
                  trailing: Text(cnic),
                ),
                ListTile(
                  title: const Text('Gender'),
                  trailing: Text(gender),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
