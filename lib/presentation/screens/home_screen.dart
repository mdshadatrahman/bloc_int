import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learning/constants/enums.dart';
import 'package:flutter_bloc_learning/logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_learning/logic/cubit/internet_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        backgroundColor: color,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<InternetCubit, InternetState>(
            builder: (context, state) {
              if (state is InternetConnected && state.connectionType == ConnectionType.wifi) {
                return const Text('WIFI');
              } else if (state is InternetConnected && state.connectionType == ConnectionType.mobile) {
                return const Text('Mobile');
              } else if (state is InternetDisconnected) {
                return const Text('Disconnected');
              }
              return const CircularProgressIndicator();
            },
          ),
          const SizedBox(height: 24),
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
          const SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/second');
            },
            child: const Text('Go to second screen'),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/third');
            },
            child: const Text('Go to third screen'),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellowAccent,
            ),
            onPressed: () => Navigator.of(context).pushNamed('/fourth'),
            child: const Text(
              'Go to fourth screen',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
