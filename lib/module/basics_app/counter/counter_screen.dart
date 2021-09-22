import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cuibt.dart';
import 'cubit/states.dart';

// class CounterScreen extends StatelessWidget {
//   int counter = 1;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Counter',
//         ),
//       ),
//       body: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextButton(
//               onPressed: () {
//                 counter--;
//                 print(counter);
//               },
//               child: Text(
//                 'M',
//                 style: TextStyle(
//                   fontSize: 30.0,
//                   fontWeight: FontWeight.w900,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 20.0,
//               ),
//               child: Text(
//                 '$counter',
//                 style: TextStyle(
//                   fontSize: 50.0,
//                   fontWeight: FontWeight.w900,
//                 ),
//               ),
//             ),
//             TextButton(
//               onPressed: () {
//                 counter++;
//                 print(counter);
//               },
//               child: Text(
//                 'P',
//                 style: TextStyle(
//                   fontSize: 30.0,
//                   fontWeight: FontWeight.w900,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // create object of the bloc
      create: (BuildContext context) {
        return CounterCubit();
      },
      // allows the object to listen for changes
      child: BlocConsumer<CounterCubit, CounterStates>(
        builder: (context, state) {
          // function to rebuild something that depends on the listener
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Counter',
              ),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      CounterCubit.get(context).minus();
                    },
                    child: Text(
                      'M',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    child: Text(
                      '${CounterCubit.get(context).counter}',
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      CounterCubit.get(context).plus();
                    },
                    child: Text(
                      'P',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        listener: (context, state) {
          // if (state is CounterPlusState) {
          //   print('Plus State ${state.counter}');
          // }
          // if (state is CounterMinusState) {
          //   print('Minus State ${state.counter}');
          // }
        },
      ),
    );
  }
}
