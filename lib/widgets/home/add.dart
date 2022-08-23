import 'package:flutter/material.dart';
import 'package:taxi_hexa/models/taxi_party.dart';
import 'package:taxi_hexa/themes/colors.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:firebase_database/firebase_database.dart';

class AddParty extends StatefulWidget {
  AddParty({Key? key}) : super(key: key);

  @override
  State<AddParty> createState() => _AddPartyState();
}

class _AddPartyState extends State<AddParty> {
  String? id;

  String? name;

  String? destinationAddress;

  List<String>? members;

  DateTime? departure;

  String? description;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.all(12),
                height: 20,
                width: 100,
                decoration: const BoxDecoration(
                  color: AppColors.col3,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            Row(
              children: const [
                SizedBox(width: 20),
                Text(
                  "택시팟 생성",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'name',
              ),
              onSaved: (value) {
                name = value!;
              },
              onChanged: (value) {
                name = value;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'destinationAddress',
              ),
              onSaved: (value) {
                destinationAddress = value!;
              },
              onChanged: (value) {
                destinationAddress = value;
              },
            ),
            ElevatedButton(
              onPressed: () {
                DatePicker.showDateTimePicker(context,
                    minTime: DateTime.now(),
                    locale: LocaleType.ko, onConfirm: (datetime) {
                  setState(() {
                    departure = datetime;
                  });
                });
              },
              child: Text("출발 시간: " + departure.toString()),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'description',
              ),
              onSaved: (value) {
                description = value!;
              },
              onChanged: (value) {
                description = value;
              },
            ),
            ElevatedButton(
              onPressed: () async {
                DatabaseReference ref = FirebaseDatabase.instance
                    .ref("taxi_party" + count.toString());
                await ref.set({
                  "asd": "i think i dont like this",
                  "departure": departure.toString(),
                  "name": name
                });
                count++;
              },
              child: const Text("submit"),
            )
          ],
        ),
      ),
    );
  }

  int count = 0;
}
