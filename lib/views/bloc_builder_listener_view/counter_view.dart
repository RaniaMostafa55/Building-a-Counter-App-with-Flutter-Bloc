import 'package:counter_app/views/bloc_consumer_view/counter_view.dart';
import 'package:counter_app/widgets/counter_value_text.dart';
import 'package:counter_app/widgets/global_alert_dialog.dart';
import 'package:counter_app/widgets/global_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../counter_cubit/counter_cubit.dart';
import '../counter_cubit/counter_state.dart';

//This class uses bloc_builder & bloc_listener
class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GlobalButton(
                  onPressed: () {
                    context.read<CounterCubit>().decrement();
                  },
                  icon: Icons.remove),
              //To show a dialog when counter reaches -1
              BlocListener<CounterCubit, CounterState>(
                listener: (context, state) {
                  if (state is CounterNegative) {
                    createDialog(context, "You reached a negative value");
                  }
                },
                //To re-build UI when counter changes
                child: BlocBuilder<CounterCubit, CounterState>(
                  builder: (context, state) {
                    return CounterValueText(
                      text:
                          context.read<CounterCubit>().counterValue.toString(),
                    );
                  },
                ),
              ),
              GlobalButton(
                  onPressed: () {
                    context.read<CounterCubit>().increment();
                  },
                  icon: Icons.add),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          //To navigate to a counter page but with bloc_consumer
          GlobalButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return BlocProvider(
                      create: (context) => CounterCubit(),
                      child: CounterViewWithBlocConsumer(),
                    );
                  },
                ));
              },
              icon: Icons.navigate_next_outlined)
        ],
      ),
    );
  }
}
