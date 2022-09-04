import 'package:flutter/material.dart';
import 'package:taxi_hexa/add_party/bloc/add_party_bloc.dart';
import 'package:taxi_hexa/app/app.dart';
import 'package:taxi_hexa/app/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FindAddressButton extends StatelessWidget {
  const FindAddressButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AddPartyBloc>().state;
    final text = state.destination?.result?.name ?? "도착지를 설정해주세요";
    return FullWidthButton(
      text,
      onPressed: () => gotoFindAddress(context),
    );
  }

  void gotoFindAddress(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.findAddress);
  }
}
