import 'package:flutter/material.dart';
import 'package:flutter_earthquake_detector/src/shared/style/text_style.dart';
import 'package:flutter_earthquake_detector/src/shared/style/theme_style.dart';
import 'package:flutter_earthquake_detector/src/shared/style/variant_style.dart';

class EarthquakeCard extends StatelessWidget {
  final int index;
  final double? latitude;
  final double? longitude;
  final String dateTime;
  final double magnitude;
  final String locationName;
  final VoidCallback? onClick;


  const EarthquakeCard({
    super.key,
    required this.index,
    this.latitude,
    this.longitude,
    required this.dateTime,
    required this.magnitude,
    required this.locationName,
    this.onClick,    
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          splashColor: SystemColors.secondNeutralGreyColor,
          onTap: onClick,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ลำดับ
                CircleAvatar(
                  backgroundColor: SystemColors.primaryBlueColor,
                  radius: 20,
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 12),

                // ข้อมูลแผ่นดินไหว
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        locationName,
                        style: sarabunBody.copyWith(
                          color: magnitudeColor(magnitude),
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text("Date: $dateTime", style: sarabunBody),
                    ],
                  ),
                ),
                const SizedBox(width: 12),

                // Magnitude Indicator
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                  decoration: BoxDecoration(
                    color: magnitudeColor(magnitude),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    magnitude.toStringAsFixed(1),
                    style: buttonSemiBold.copyWith(
                      color: SystemColors.firstNeutralWhiteColor,
                    ),
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
