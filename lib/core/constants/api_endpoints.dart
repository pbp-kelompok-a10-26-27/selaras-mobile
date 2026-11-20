import 'package:flutter/foundation.dart';

/// Django REST Framework API endpoints for the SELARAS backend.
/// Corresponds to backend routing defined in selaras-web (config/urls.py).
class ApiEndpoints {
  // Base URLs for development and deployment environments
  static const String localBaseUrl = "http://127.0.0.1:8000";
  static const String androidEmulatorBaseUrl = "http://10.0.2.2:8000";
  static const String productionBaseUrl =
      "https://steven-dyanizha-selaras-web.pws.cs.ui.ac.id";

  /// Override at build time, e.g.
  /// `flutter run --dart-define=API_BASE_URL=https://example.com`
  static const String _override = String.fromEnvironment('API_BASE_URL');

  /// Active base URL. Defaults to the local Django server (the emulator's alias
  /// for the host machine on Android, localhost elsewhere) until the DRF API is
  /// deployed to production.
  static String get baseUrl {
    if (_override.isNotEmpty) return _override;
    if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
      return androidEmulatorBaseUrl;
    }
    return localBaseUrl;
  }

  static String get _v1 => "$baseUrl/api/v1";

  // Module Endpoints (DRF v1 API)
  static String get articles => "$_v1/articles/";
  static String get challenges => "$_v1/challenges/";
  static String get donations => "$_v1/donations/";
  static String get donationCampaigns => "$_v1/donations/campaigns/";
  static String get feeds => "$_v1/feeds/";
  static String get feedPosts => "$_v1/feeds/posts/";
  static String get helpdesk => "$_v1/helpdesk/";
  static String get helpdeskTickets => "$_v1/helpdesk/tickets/";

  // Token-protected modules (answer 401 without an `Authorization: Token` header)
  static String get accountProfile => "$_v1/accounts/me/";
  static String get notifications => "$_v1/notifications/";
  static String get dashboardOverview => "$_v1/dashboard/overview/";

  // Authentication endpoints (DRF, token based)
  static String get login => "$_v1/accounts/login/";
  static String get register => "$_v1/accounts/register/";
  static String get logout => "$_v1/accounts/logout/";
}
