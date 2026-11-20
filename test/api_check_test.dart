import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:selaras_mobile/core/network/api_check.dart';

http.Response _json(String body, [int code = 200]) =>
    http.Response(body, code, headers: {'content-type': 'application/json'});

Future<ApiCheckResult> _check(http.Response response) {
  ApiCheck.clientFactory = () => MockClient((_) async => response);
  return ApiCheck.get('http://test.local/api/v1/x/');
}

void main() {
  tearDown(() => ApiCheck.clientFactory = http.Client.new);

  test('a JSON list counts as ok', () async {
    final result = await _check(_json('[{"id":1},{"id":2}]'));
    expect(result.status, ApiCheckStatus.ok);
    expect(result.summary, contains('2 item(s)'));
  });

  test('a paginated DRF response reports its total count', () async {
    final result = await _check(_json('{"count":41,"results":[{"id":1}]}'));
    expect(result.status, ApiCheckStatus.ok);
    expect(result.summary, contains('41 item(s)'));
  });

  test('401 JSON means DRF is up and a token is needed', () async {
    final result = await _check(_json('{"detail":"no token"}', 401));
    expect(result.status, ApiCheckStatus.authRequired);
    expect(result.isReachable, isTrue);
    expect(result.statusCode, 401);
  });

  test('403 JSON also counts as reachable', () async {
    final result = await _check(_json('{"detail":"admins only"}', 403));
    expect(result.status, ApiCheckStatus.authRequired);
  });

  test('an HTML 404 means the route is not on that server', () async {
    final result = await _check(
      http.Response(
        '<h1>Not Found</h1>',
        404,
        headers: {'content-type': 'text/html'},
      ),
    );
    expect(result.status, ApiCheckStatus.failed);
    expect(result.summary, contains('404'));
    expect(result.summary, contains('not deployed'));
  });

  test('a JSON 500 is a failure, not a success', () async {
    final result = await _check(_json('{"detail":"boom"}', 500));
    expect(result.status, ApiCheckStatus.failed);
    expect(result.statusCode, 500);
  });

  test('a 200 that is not JSON is a failure', () async {
    final result = await _check(
      http.Response(
        '<html></html>',
        200,
        headers: {'content-type': 'text/html'},
      ),
    );
    expect(result.status, ApiCheckStatus.failed);
  });

  test('a connection error is reported, not thrown', () async {
    ApiCheck.clientFactory = () => MockClient(
      (_) async => throw http.ClientException('connection refused'),
    );
    final result = await ApiCheck.get('http://test.local:8000/api/v1/x/');

    expect(result.status, ApiCheckStatus.failed);
    expect(result.statusCode, isNull);
    expect(result.summary, contains('http://test.local:8000'));
  });
}
