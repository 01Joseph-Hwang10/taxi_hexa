import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:taxi_hexa/add_party/bloc/add_party_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_hexa/app/components/components.dart';

class SelectDeparture extends StatelessWidget {
  const SelectDeparture({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<AddPartyBloc>();
    final departure = bloc.state.departure;
    final text = departure == null
        ? "출발 시간을 설정해주세요"
        : "출발 시간: ${departure.hour}시 ${departure.minute}분";
    return FullWidthButton(
      text,
      onPressed: () => _onPressed(context),
    );
  }

  void _onPressed(BuildContext context) {
    final bloc = context.read<AddPartyBloc>();
    DatePicker.showDateTimePicker(
      context,
      minTime: DateTime.now(),
      locale: LocaleType.ko,
      onConfirm: (datetime) {
        bloc.add(SetDeparture(departure: datetime));
      },
    );
  }
}
