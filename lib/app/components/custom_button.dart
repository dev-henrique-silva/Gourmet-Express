// import 'package:flutter/material.dart';

// class CustomButton extends StatelessWidget {
//   final String text;
//   final VoidCallback? onPressed;
//   final bool isLoading;

//   const CustomButton({
//     super.key,
//     required this.text,
//     required this.onPressed,
//     this.isLoading = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       child: Container(
//         padding: const EdgeInsets.all(25),
//         margin: const EdgeInsets.symmetric(horizontal: 25),
//         decoration: BoxDecoration(
//           color: Theme.of(context).colorScheme.secondary,
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Center(
//           child: Text(
//             text,
//             style: TextStyle(
//               color: Theme.of(context).colorScheme.inversePrimary,
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onPressed,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: isLoading
              ? SizedBox(
                  width: 23,
                  height: 23,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                )
              : Text(
                  text,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}
