import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final IconData icon;
  final Color color;

  const SocialButton({required this.icon, required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: color ?? Colors.grey[200],
        borderRadius: BorderRadius.circular(25),
      ),
      child: Icon(
        icon,
        color: color != null ? Colors.white : Colors.blue,
      ),
    );
  }
}

class FacebookButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SocialButton(
      icon: Icons.facebook,
      color: Colors.blue,
    );
  }
}

// class GoogleButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SocialButton(
//       icon: Icons.google,
//       color: Colors.red,
//     );
//   }
// }