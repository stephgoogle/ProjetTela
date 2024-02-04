import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tzn;

class TelaNotification implements InitializableDependency {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  TelaNotification();

  @override
  Future<void> init() async {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings();
    const LinuxInitializationSettings initializationSettingsLinux =
        LinuxInitializationSettings(defaultActionName: 'Open notification');
    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsDarwin,
            macOS: initializationSettingsDarwin,
            linux: initializationSettingsLinux);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
    flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    tz.initializeTimeZones();
    await remiderNotification();
  }

  Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime date,
    Priority priority = Priority.high,
    Importance importance = Importance.high,
  }) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        tzn.TZDateTime.from(date, tzn.local),
        NotificationDetails(
            android: AndroidNotificationDetails(
          '1',
          'pyra_main_channel',
          channelDescription: 'The main channel of the application',
          priority: priority,
          importance: importance,
        )),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  Future<void> remiderNotification() async {
    print('********************** REMINEER************************');
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('2626', 'reminder-chanel',
            channelDescription:
                'repeating the message every day at the same hour to remind to the user to do is part');
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.periodicallyShow(
        260,
        'Hello don\'t forget to report',
        'It has been a long day! \n Don\'t forget to report your transactions ',
        RepeatInterval.daily,
        notificationDetails,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle);
  }

  Future<void> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }
}
