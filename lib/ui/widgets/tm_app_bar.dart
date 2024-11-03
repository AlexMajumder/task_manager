import 'package:flutter/material.dart';
import 'package:task_manager/ui/controller/auth_controller.dart';
import 'package:task_manager/ui/screen/profile_screen.dart';
import 'package:task_manager/ui/screen/sign_in_screen.dart';
import '../utils/app_colors.dart';

class TMAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TMAppBar({
    super.key,
    this.isProfileScreenOpen = false,
  });

  final bool isProfileScreenOpen ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(isProfileScreenOpen == true){
          return;
        }
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfileScreen()),
        );
      },
      child: AppBar(
        backgroundColor: AppColors.themeColor,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
            ),
            const SizedBox(
              width: 16,
            ),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Alex Majumder',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'test@gmail.com',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  )
                ],
              ),
            ),
            IconButton(
                onPressed: () async {

                  await AuthController.clearUserData();

                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInScreen()),
                      (value) => false);
                },
                icon: const Icon(Icons.logout))
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight); // for appbar or Tool ber proper size
}
