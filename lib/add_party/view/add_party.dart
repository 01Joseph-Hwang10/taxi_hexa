import 'package:flutter/material.dart';
import 'package:taxi_hexa/add_party/bloc/add_party_bloc.dart';
import 'package:taxi_hexa/add_party/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_hexa/add_party/view/widgets/widgets.dart';
import 'package:taxi_hexa/app/components/components.dart';

class AddParty extends StatelessWidget {
  const AddParty({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.read<AddPartyBloc>().state;
    return BottomModal(
      children: [
        const DragBar(),
        const SizedBox(height: 5),
        const ModalTitle(),
        const SizedBox(height: 15),
        CupertinoTextField(
          fieldName: '팟 이름',
          controller: state.nameTextController,
          required: true,
        ),
        const SizedBox(height: 5),
        const FindAddressButton(),
        const SizedBox(height: 5),
        const SelectDeparture(),
        const SizedBox(height: 5),
        CupertinoTextField(
          fieldName: '팟 설명',
          controller: state.descriptionTextController,
        ),
        const SizedBox(height: 10),
        const Submit(),
        const SizedBox(height: 20),
      ],
    );
  }
}
