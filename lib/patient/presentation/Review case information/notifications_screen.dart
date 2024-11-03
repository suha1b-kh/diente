import 'package:diente/patient/data/database%20services/get_Notifications.dart';
import 'package:diente/patient/presentation/widgets/Notification_widget.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: FutureBuilder<String>(
        future: getStudentId(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return FutureBuilder<String>(
              future: getStudentName(snapshot.data!),
              builder: (context, studentNameSnapshot) {
                if (studentNameSnapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (studentNameSnapshot.hasError) {
                  return Center(
                      child: Text('Error: ${studentNameSnapshot.error}'));
                } else if (studentNameSnapshot.hasData) {
                  return ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      final studentName = studentNameSnapshot.data!;
                      return NotificationWidget(studentName: studentName);
                    },
                  );
                } else {
                  return const Center(child: Text('No Data'));
                }
              },
            );
          } else {
            return const Center(child: Text('No Data'));
          }
        },
      ),
    );
  }
}
