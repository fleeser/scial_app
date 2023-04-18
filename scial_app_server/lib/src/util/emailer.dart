import 'package:sendgrid_mailer/sendgrid_mailer.dart';
import 'package:serverpod/serverpod.dart';

class Emailer {

  static Future<bool> sendEmail(String toAddress, String templateId, { Map<String, dynamic>? templateData }) async {
    try {
      Personalization personalization = Personalization([ Address(toAddress) ], dynamicTemplateData: templateData);
      Address fromAddress = Address('noreply@scial.app');
      Email mail = Email([ personalization ], fromAddress, '', templateId: templateId);

      Mailer mailer = Mailer(_apiKey);

      await mailer.send(mail);
      return true;
    } catch (_) {
      return false;
    }
  }

  static Future<bool> sendVerificationEmail(String toAddress, String verificationCode) async {
    String templateId = Serverpod.instance!.getPassword('sendgridVerificationTemplateId')!;
    Map<String, dynamic> templateData = { 'verificationCode' : verificationCode };
    return await sendEmail(toAddress, templateId, templateData: templateData);
  }

  static String get _apiKey => Serverpod.instance!.getPassword('sendgridApiKey')!;
}