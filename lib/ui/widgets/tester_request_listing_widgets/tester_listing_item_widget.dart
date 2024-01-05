import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:tr_app/utils/constants.dart';

class TesterListingItemWidget extends StatelessWidget {
  final String productName;
  final String productDescription;
  final DateTime requestDateTime;
  final String imageUrl;
  final StatusState status;

  const TesterListingItemWidget({
    Key? key,
    required this.productName,
    required this.productDescription,
    required this.requestDateTime,
    required this.imageUrl,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final requestDateTimeText =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(requestDateTime);
    String statusText = status.name.toString();
    statusText = statusText[0].toUpperCase() + statusText.substring(1);

    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(
                imageUrl,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return const Icon(Icons.error, color: Colors.red, size: 75);
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    productDescription,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    requestDateTimeText,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    statusText,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: status == StatusState.pending
                          ? Colors.orange
                          : status == StatusState.approved
                              ? Colors.green
                              : Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
