import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsController extends GetxController {
  void openWebsite(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  void launchEmail(String toEmail, String subject, String body) async {
    // Encode email subject and body to be URL safe
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: toEmail,
      queryParameters: {
        'subject': Uri.encodeFull(subject),
        'body': Uri.encodeFull(body),
      },
    );

    // Check if the device can open the URL
    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      throw 'Could not launch $emailLaunchUri';
    }
  }


  Future<void> launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  // Future<void> launchPhoneDialer(String phoneNumber) async {
  //   if (await canLaunchUrl(Uri.parse(phoneNumber))) {
  //     await launchUrl(Uri.parse(phoneNumber));
  //   } else {
  //     throw 'Could not launch $phoneNumber';
  //   }
  // }

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
}
