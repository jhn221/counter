// import 'dart:async';

// import 'package:flutter/material.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   late Timer timer;
//   int totalSeconds = 1500;
//   int breakTime = 5;
//   bool isRunning = false;
//   bool isBreakTime = false;
//   int totalRound = 0;
//   int totalGoal = 0;

//   void onTick(Timer timer) => {
//         setState(() => {
//               if (totalSeconds == 0)
//                 {
//                   timer.cancel(),
//                   totalSeconds = 10,
//                   isRunning = false,
//                   if (totalRound == 4)
//                     {
//                       totalGoal = totalGoal + 1,
//                       totalRound = 0,
//                     }
//                   else
//                     {
//                       totalRound = totalRound + 1,
//                     },
//                   breaktimestart(),
//                 }
//               else
//                 {totalSeconds = totalSeconds - 1}
//             })
//       };
//   void onbreakTick(Timer timer) => {
//         setState(() => {
//               if (breakTime == 0)
//                 {
//                   timer.cancel(),
//                   isBreakTime = false,
//                   breakTime = 5,
//                 }
//               else
//                 {
//                   breakTime = breakTime - 1,
//                 },
//             })
//       };

//   void breaktimestart() => {
//         timer = Timer.periodic(const Duration(seconds: 1), onbreakTick),
//         setState(() => {isBreakTime = true})
//       };

//   void onStartPressed() => {
//         timer = Timer.periodic(const Duration(seconds: 1), onTick),
//         setState(() => {isRunning = true})
//       };

//   void onPausePressed() => {
//         timer.cancel(),
//         setState(() => {isRunning = false})
//       };

//   void onResetPressed() => {totalSeconds = 10};

//   String format(int seconds) {
//     var duration = Duration(seconds: seconds);
//     return duration.toString().split('.').first.substring(2);
//     // return '$seconds';
//   }

//   void changeSeconds(int? seletedValue) => {
//         if (seletedValue is int)
//           {
//             setState(() => {totalSeconds = seletedValue}),
//             print(seletedValue)
//           }
//       };

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.background,
//       body: Column(
//         children: [
//           Flexible(
//               flex: 1,
//               child: Container(
//                 alignment: Alignment.bottomCenter,
//                 child: Text(
//                   format(totalSeconds),
//                   style: TextStyle(
//                       color: Theme.of(context).cardColor,
//                       fontSize: 89,
//                       fontWeight: FontWeight.w600),
//                 ),
//               )),
//           Flexible(
//               flex: 3,
//               child: Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     DropdownButton(items: const [
//                       DropdownMenuItem(value: 9, child: Text('15')),
//                       DropdownMenuItem(value: 1200, child: Text('20')),
//                       DropdownMenuItem(value: 1500, child: Text('25')),
//                       DropdownMenuItem(value: 1800, child: Text('30')),
//                       DropdownMenuItem(value: 2100, child: Text('35')),
//                     ], onChanged: changeSeconds),
//                     IconButton(
//                         iconSize: 98,
//                         color: Theme.of(context).cardColor,
//                         onPressed: isRunning ? onPausePressed : onStartPressed,
//                         icon: Icon(isRunning
//                             ? Icons.pause_circle_filled_outlined
//                             : Icons.play_circle_fill_outlined)),
//                     IconButton(
//                         onPressed: onResetPressed,
//                         icon: const Icon(Icons.refresh_outlined))
//                   ],
//                 ),
//               )),
//           Flexible(
//               flex: 1,
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Spacer(),
//                         Column(
//                           children: [
//                             Text(
//                               '$totalRound/4',
//                               style: TextStyle(
//                                   color: Theme.of(context).cardColor,
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 35),
//                             ),
//                             Text('ROUND',
//                                 style: TextStyle(
//                                     color: Theme.of(context).cardColor,
//                                     fontWeight: FontWeight.w700,
//                                     fontSize: 20)),
//                             const SizedBox(
//                               height: 40,
//                             ),
//                           ],
//                         ),
//                         const Spacer(),
//                         Column(
//                           children: [
//                             Text('$totalGoal/12',
//                                 style: TextStyle(
//                                     color: Theme.of(context).cardColor,
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 35)),
//                             Text('GOAL',
//                                 style: TextStyle(
//                                     color: Theme.of(context).cardColor,
//                                     fontWeight: FontWeight.w700,
//                                     fontSize: 20)),
//                           ],
//                         ),
//                         const Spacer(),
//                       ],
//                     ),
//                   )
//                 ],
//               )),
//           isBreakTime
//               ? Text(
//                   format(breakTime),
//                   style: TextStyle(
//                       color: Theme.of(context).cardColor,
//                       fontSize: 40,
//                       fontWeight: FontWeight.w600),
//                 )
//               : const Text('각 ROUND 가 종료된 뒤 breaktime은 5분입니다'),
//           const Spacer(),
//         ],
//       ),
//     );
//   }
// }
