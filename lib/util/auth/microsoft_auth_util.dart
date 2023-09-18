import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:gais/util/navigation/navigation_util.dart';

class MicrosoftAuthUtil{
  AadOAuth getConfig(){
    Map<String, dynamic> env = FlavorConfig.instance.variables;
    final Config config = Config(
        tenant: env['tenant'],
        clientId: env['client_id'],
        scope: 'offline_access openid profile User.Read Calendars.ReadWrite OnlineMeetings.ReadWrite',
        navigatorKey: NotificationUtil.navigationKey,
        webUseRedirect: false,
        loader: const Center(child: CircularProgressIndicator())
    );
    AadOAuth oauth = AadOAuth(config);

    return oauth;
  }
}