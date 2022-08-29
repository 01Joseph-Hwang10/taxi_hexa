import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_hexa/models/taxi_party.dart';
import 'package:taxi_hexa/themes/colors.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:uuid/uuid.dart';
import 'package:geocoding/geocoding.dart';
import 'package:address_search_field/address_search_field.dart';

var uuid = const Uuid();
LatLng current_LatLng = new LatLng(1.10, 45.50);
LatLng dest_LatLng = new LatLng(37.498326, 126.998452);

class AddParty extends StatefulWidget {
  AddParty({Key? key}) : super(key: key);

  @override
  State<AddParty> createState() => _AddPartyState();
}

String? id;

String? name;

String? destinationAddress;

DateTime? departure;

String? description;

class _AddPartyState extends State<AddParty> {
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
              initialValue: name,
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
            Text((dest_addresses != null) //주소
                ? dest_addresses!.first.name!
                : 'Address is not found'),
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
              initialValue: description,
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
              onPressed:
                  (name != '' && destinationAddress != '' && departure != null)
                      ? () async {
                          String the_uuid = uuid.v1();
                          DatabaseReference ref = FirebaseDatabase.instance
                              .ref("taxi_party" + the_uuid.toString());
                          await ref.set(TaxiPartyModel(
                            id: the_uuid,
                            name: name!,
                            destination: dest_LatLng,
                            destinationAddress: await setde(dest_LatLng), // 주소
                            currentPosition: current_LatLng,
                            members: [],
                            departure: departure!,
                            description: description,
                          ).toJson());
                        }
                      : null,
              child: const Text("submit"),
            )
          ],
        ),
      ),
    );
  }

  List<Placemark>? dest_addresses; //좌표->주소. 처음부터 주소를 찍는 방식으로 변경되면 다 지워도 됨.

  Future<String> setde(LatLng latlng) async {
    print('aa');
    bool err = false;
    try {
      dest_addresses = await placemarkFromCoordinates(
          dest_LatLng.latitude, dest_LatLng.longitude);
    } catch (e) {
      dest_addresses = [];
      err = true;
      print(e);
    }
    setState(() {
      destinationAddress = dest_addresses!.first.toString();
    });
    print(latlng);
    return (err) ? "Address is not found" : destinationAddress!;
  }
}
