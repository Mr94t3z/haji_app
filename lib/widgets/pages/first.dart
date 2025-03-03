import 'package:flutter/material.dart';
import 'package:hajj_app/helpers/styles.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:analog_clock/analog_clock.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class FirstWidget extends StatelessWidget {
  const FirstWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    tz.initializeTimeZones(); // Initialize time zones
    tz.setLocalLocation(tz.getLocation('UTC')); // Set the local time zone

    HijriCalendar today = HijriCalendar.now(); // Get current date in Hijri

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    '${today.fullDate()} H.',
                    style: textStyle(fontSize: 18.0, color: ColorSys.darkBlue),
                  ),
                ),
              ),
              const SizedBox(height: 50.0),
              Center(
                child: AnalogClock(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    border: Border.all(width: 4.0, color: ColorSys.primary),
                    color: ColorSys.lightPrimary,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 7,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  datetime: DateTime.now(),
                  isLive: true,
                  hourHandColor: Colors.white,
                  minuteHandColor: Colors.white,
                  numberColor: Colors.white,
                  secondHandColor: Colors.red,
                  showSecondHand: true,
                  showNumbers: true,
                  showTicks: false,
                  textScaleFactor: 1.2,
                  showDigitalClock: false,
                  digitalClockColor: Colors.white,
                ),
              ),
              const SizedBox(height: 70.0),
              _buildCountryWidget(
                country: 'Saudi Arabia',
                city: 'Mecca',
                timeZone: 'Asia/Riyadh',
              ),
              const SizedBox(height: 25.0),
              _buildCountryWidget(
                country: 'Indonesia',
                city: 'Bandung',
                timeZone: 'Asia/Jakarta',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCountryWidget({
    required String country,
    required String city,
    required String timeZone,
  }) {
    final now = tz.TZDateTime.now(tz.getLocation(timeZone));
    final formattedTime = DateFormat('h:mm a').format(now);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(22.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  country,
                  style: textStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: ColorSys.darkBlue,
                  ),
                ),
                Text(
                  city,
                  style: textStyle(fontSize: 18, color: ColorSys.darkBlue),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                formattedTime,
                style: textStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: ColorSys.darkBlue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
