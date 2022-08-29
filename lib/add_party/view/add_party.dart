import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_hexa/home/models/taxi_party.dart';
import 'package:taxi_hexa/themes/colors.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:uuid/uuid.dart';
import 'package:geocoding/geocoding.dart';

var _uuid = const Uuid();
LatLng current_LatLng = new LatLng(1.10, 45.50);
LatLng dest_LatLng = new LatLng(37.498326, 126.998452);

class AddParty extends StatefulWidget {
  const AddParty({Key? key}) : super(key: key);

  @override
  State<AddParty> createState() => _AddPartyState();
}

class _AddPartyState extends State<AddParty> {
  TextEditingController nameTextController = TextEditingController();
  TextEditingController descriptionTextController = TextEditingController();
  String get name => nameTextController.text;
  String get description => descriptionTextController.text;

  String? destinationAddress;
  DateTime? departure;

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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.all(12),
                height: 10,
                width: 100,
                decoration: const BoxDecoration(
                  color: AppColors.col3,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "택시팟 생성",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              decoration: buildInputDecoration('팟 이름'),
              controller: nameTextController,
            ),
            Text(
              (destAddresses != null) //주소
                  ? destAddresses!.first.name!
                  : 'Address is not found',
            ),
            ElevatedButton(
              onPressed: () {
                DatePicker.showDateTimePicker(
                  context,
                  minTime: DateTime.now(),
                  locale: LocaleType.ko,
                  onConfirm: (datetime) {
                    setState(() {
                      departure = datetime;
                    });
                  },
                );
              },
              child: Text(
                "출발 시간: ${departure?.hour}시 ${departure?.minute}분",
              ),
            ),
            TextFormField(
              decoration: buildInputDecoration('팟 설명'),
              controller: descriptionTextController,
            ),
            ElevatedButton(
              onPressed: () async {
                if (name == '' ||
                    destinationAddress == '' ||
                    departure == null) {
                  return;
                }
                String id = _uuid.v1();
                DatabaseReference ref =
                    FirebaseDatabase.instance.ref("taxi_party${id.toString()}");
                await ref.set(
                  TaxiPartyModel(
                    id: id,
                    name: name,
                    destination: dest_LatLng,
                    destinationAddress: await setde(dest_LatLng), // 주소
                    currentPosition: current_LatLng,
                    members: [],
                    departure: departure!,
                    description: description,
                  ).toJson(),
                );
              },
              child: const Text("Submit"),
            )
          ],
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
    );
  }

  List<Placemark>? destAddresses; //좌표->주소. 처음부터 주소를 찍는 방식으로 변경되면 다 지워도 됨.

  Future<String> setde(LatLng latlng) async {
    print('aa');
    bool err = false;
    try {
      destAddresses = await placemarkFromCoordinates(
          dest_LatLng.latitude, dest_LatLng.longitude);
    } catch (e) {
      destAddresses = [];
      err = true;
      print(e);
    }
    setState(() {
      destinationAddress = destAddresses!.first.toString();
    });
    print(latlng);
    return (err) ? "Address is not found" : destinationAddress!;
  }
}
