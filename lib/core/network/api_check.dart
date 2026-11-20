import 'dart:convert';

import 'package:http/http.dart' as http;

/// How an endpoint answered a connectivity check.
enum ApiCheckStatus {
  /// 2xx JSON: the DRF endpoint answered with data.
  ok,

  /// 401/403 JSON: DRF is up and the endpoint exists, it just needs a token.
  authRequired,

  /// Anything else: wrong URL, server down, not deployed, or not DRF.
  failed,
}

class ApiCheckResult {
  final ApiCheckStatus status;
  final int? statusCode;
  final String summary;

  const ApiCheckResult(this.status, this.summary, {this.statusCode});

  bool get isReachable => status != ApiCheckStatus.failed;
}

/// Checkpoint-only helper: sends one GET and describes the answer, to confirm
/// the Django REST Framework backend is reachable. It deliberately does not
/// parse payloads into models; that comes with the real module features.
class ApiCheck {
  /// Tests replace this to avoid real network calls.
  static http.Client Function() clientFactory = http.Client.new;

  static const Duration timeout = Duration(seconds: 10);

  static Future<ApiCheckResult> get(String url) async {
    final client = clientFactory();
    try {
      final response = await client
          .get(Uri.parse(url), headers: const {'Accept': 'application/json'})
          .timeout(timeout);
      return describe(response);
    } on Exception catch (error) {
      return ApiCheckResult(
        ApiCheckStatus.failed,
        'Could not connect (${error.runtimeType}). Is the backend running at '
        '${Uri.parse(url).origin}?',
      );
    } finally {
      client.close();
    }
  }

  static ApiCheckResult describe(http.Response response) {
    final code = response.statusCode;
    // DRF always answers in JSON; Django's own 404 page or a proxy error is HTML.
    final isJson = (response.headers['content-type'] ?? '').contains(
      'application/json',
    );

    if (!isJson) {
      return ApiCheckResult(
        ApiCheckStatus.failed,
        code == 404
            ? 'HTTP 404: this API route is not available on that server '
                  '(not deployed yet?).'
            : 'HTTP $code: the server did not answer with JSON.',
        statusCode: code,
      );
    }

    if (code == 401 || code == 403) {
      return ApiCheckResult(
        ApiCheckStatus.authRequired,
        'DRF is reachable. HTTP $code: sign in with a token to see data.',
        statusCode: code,
      );
    }

    if (code >= 200 && code < 300) {
      return ApiCheckResult(
        ApiCheckStatus.ok,
        _summarize(response.body),
        statusCode: code,
      );
    }

    return ApiCheckResult(
      ApiCheckStatus.failed,
      'HTTP $code from the API.',
      statusCode: code,
    );
  }

  static String _summarize(String body) {
    try {
      final data = jsonDecode(body);
      if (data is List) return 'HTTP 200: ${data.length} item(s) returned.';
      if (data is Map && data['results'] is List) {
        final total = data['count'] ?? (data['results'] as List).length;
        return 'HTTP 200: $total item(s) in total.';
      }
      return 'HTTP 200: JSON object returned.';
    } on FormatException {
      return 'HTTP 200, but the body was not valid JSON.';
    }
  }
}
