/// Django REST Framework API endpoints for the SELARAS backend.
/// Corresponds to backend routing defined in selaras-web (config/urls.py).
class ApiEndpoints {
  // Base URLs for development and deployment environments
  static const String localBaseUrl = "http://127.0.0.1:8000";
  static const String androidEmulatorBaseUrl = "http://10.0.2.2:8000";
  static const String productionBaseUrl =
      "https://steven-dyanizha-selaras-web.pws.cs.ui.ac.id";

  // Active base URL (defaulted to production server)
  static const String baseUrl = productionBaseUrl;

  // Module Endpoints (DRF v1 API)
  static const String articles = "$baseUrl/api/v1/articles/";
  static const String challenges = "$baseUrl/api/v1/challenges/";
  static const String donations = "$baseUrl/api/v1/donations/";
  static const String donationCampaigns =
      "$baseUrl/api/v1/donations/campaigns/";
  static const String feeds = "$baseUrl/api/v1/feeds/";
  static const String feedPosts = "$baseUrl/api/v1/feeds/posts/";
  static const String helpdesk = "$baseUrl/api/v1/helpdesk/";
  static const String helpdeskTickets = "$baseUrl/api/v1/helpdesk/tickets/";

  // Authentication endpoints
  static const String login = "$baseUrl/accounts/login/";
  static const String register = "$baseUrl/accounts/register/";
  static const String logout = "$baseUrl/accounts/logout/";
}
