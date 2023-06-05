import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learning/logic/cubit/counter_cubit.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({
    super.key,
    required this.color,
  });
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Screen'),
        backgroundColor: color,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<CounterCubit, CounterState>(
            listener: (context, state) {
              if (state.wasIncremented ?? false) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Incremented!'),
                  ),
                );
              } else if (state.wasIncremented == false) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Decremented!'),
                  ),
                );
              }
            },
            builder: (context, state) {
              return Text(
                state.counterValue.toString(),
                style: const TextStyle(fontSize: 30),
              );
            },
          ),
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  child: const Icon(Icons.remove),
                ),
                TextButton(
                  onPressed: () {
                    context.read<CounterCubit>().increment();
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
