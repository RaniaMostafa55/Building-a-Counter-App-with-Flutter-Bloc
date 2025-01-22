import 'package:counter_app/widgets/counter_value_text.dart';
import 'package:counter_app/widgets/global_alert_dialog.dart';
import 'package:counter_app/widgets/global_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../counter_cubit/counter_cubit.dart';
import '../counter_cubit/counter_state.dart';

//This class uses bloc_consumer
class CounterViewWithBlocConsumer extends StatefulWidget {
  const CounterViewWithBlocConsumer({super.key});

  @override
  State<CounterViewWithBlocConsumer> createState() =>
      _CounterViewWithBlocConsumerState();
}

class _CounterViewWithBlocConsumerState
    extends State<CounterViewWithBlocConsumer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App (Consumer)"),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GlobalButton(
                onPressed: () {
                  context.read<CounterCubit>().decrement();
                },
                icon: Icons.remove),
            BlocConsumer<CounterCubit, CounterState>(
              //To show a dialog when the counter reaches 10 or -10
              listener: (context, state) {
                if (state is CounterTen) {
                  createDialog(context, "You reached value 10");
                }
              },
              builder: (context, state) {
                return CounterValueText(
                  text: context.read<CounterCubit>().counterValue.toString(),
                );
              },
            ),
            GlobalButton(
                onPressed: () {
                  context.read<CounterCubit>().increment();
                },
                icon: Icons.add),
          ],
        ),
      ),
    );
  }
}
