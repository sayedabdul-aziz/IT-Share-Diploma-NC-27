import 'package:counter_app/cubit/cubit.dart';
import 'package:counter_app/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (c) => CounterCubit(),
      child:
          BlocBuilder<CounterCubit, CounterStates>(builder: ((context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            elevation: 0.0,
            centerTitle: true,
            title: const Text('Counter App With Cubit'),
            backgroundColor: Colors.black,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.read<CounterCubit>().counter.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      backgroundColor: Colors.deepOrange,
                      onPressed: () {
                        context.read<CounterCubit>().remove();
                      },
                      mini: true,
                      child: const Icon(Icons.remove),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.deepOrange,
                      onPressed: () {
                        context.read<CounterCubit>().add();
                      },
                      mini: true,
                      child: const Icon(Icons.add),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      })),
    );
  }
}
