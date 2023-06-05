import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc_learning/logic/cubit/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CouterCubit', () {
    CounterCubit counterCubit = CounterCubit();
    setUp(() {
      counterCubit = CounterCubit();
    });
    tearDown(() {
      counterCubit.close();
    });
    test('The initial state of the counter cubit is CounterState(counterValue: 0)', () {
      expect(CounterCubit().state, const CounterState(counterValue: 0));
    });

    blocTest(
      'The cubit should emit a current state with CounterState(counterValue: 1, wasIncremented: true)',
      build: () => counterCubit,
      act: (cubit) {
        cubit.increment();
      },
      expect: () => [const CounterState(counterValue: 1, wasIncremented: true)],
    );

    blocTest(
      'The cubit should emit a current state with CounterState(counterValue: -1, wasIncremented: false)',
      build: () => counterCubit,
      act: (cubit) {
        cubit.decrement();
      },
      expect: () => [const CounterState(counterValue: -1, wasIncremented: false)],
    );
  });
}
