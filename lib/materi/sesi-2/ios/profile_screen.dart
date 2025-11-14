import 'package:flutter/cupertino.dart';

class CupertinoProfileScreen extends StatelessWidget {
  const CupertinoProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data - you can replace with actual user data
    const String username = 'John Doe';
    const String email = 'john.doe@example.com';

    // Get initials from username
    String getInitials(String name) {
      List<String> names = name.split(' ');
      String initials = '';
      if (names.isNotEmpty) {
        initials = names[0][0];
        if (names.length > 1) {
          initials += names[1][0];
        }
      }
      return initials.toUpperCase();
    }

    void handleLogout() {
      showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: const Text('Logout'),
            content: const Text('Apakah Anda yakin ingin logout?'),
            actions: [
              CupertinoDialogAction(
                child: const Text('Batal'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              CupertinoDialogAction(
                isDestructiveAction: true,
                child: const Text('Logout'),
                onPressed: () {
                  Navigator.pop(context);
                  // Navigate back to login or perform logout
                  showCupertinoDialog(
                    context: context,
                    builder: (context) => CupertinoAlertDialog(
                      title: const Text('Success'),
                      content: const Text('Logout berhasil'),
                      actions: [
                        CupertinoDialogAction(
                          child: const Text('OK'),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          );
        },
      );
    }

    void handleEdit() {
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('Edit Profile'),
          content: const Text('Fitur edit profile'),
          actions: [
            CupertinoDialogAction(
              child: const Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    }

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Profile'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: handleEdit,
          child: const Icon(CupertinoIcons.pencil),
        ),
      ),
      child: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // CircleAvatar with user initials
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    color: CupertinoColors.systemBlue,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      getInitials(username),
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: CupertinoColors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Username
                Text(
                  username,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                // Email
                Text(
                  email,
                  style: const TextStyle(
                    fontSize: 16,
                    color: CupertinoColors.systemGrey,
                  ),
                ),
                const SizedBox(height: 40),
                // Logout Button
                CupertinoButton.filled(
                  onPressed: handleLogout,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        CupertinoIcons.square_arrow_right,
                        color: CupertinoColors.white,
                      ),
                      SizedBox(width: 8),
                      Text('Logout'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
