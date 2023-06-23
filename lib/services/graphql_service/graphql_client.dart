import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Config {
  static String? _token;

  static Future<GraphQLClient> initializeClient(String token) async {
      final HttpLink httpLink = HttpLink("https://YOUR_GRAPHQL_URL_HERE");
    final AuthLink authLink = AuthLink(
      getToken: () => _token,
    );
    final Link link = authLink.concat(httpLink);
    GraphQLClient client = GraphQLClient(
      cache: GraphQLCache(),
      link: link,
      defaultPolicies: DefaultPolicies(
        query: Policies(
          fetch: FetchPolicy.networkOnly,
          error: ErrorPolicy.none,
        ),
      ),
    );
    return client;
  }

  static ValueNotifier<GraphQLClient> initializeSubscriptionClient(
      String token) {
        print("Subscription Client Initializing");
    

    WebSocketLink webSocketLink = WebSocketLink(
      "ws://YOUR_GRAPHQL_URL_HERE",
      config: const SocketClientConfig(
        autoReconnect: true,
        inactivityTimeout: Duration(seconds: 30),
      ),
    );

    // link.split((request) => request.isSubscription, webSocketLink, link);
    // link.split((request) => request.isSubscription, webSocketLink, link);
    // final Link link = httpLink.split(
    //     (request) => request.isSubscription, httpLink, webSocketLink);

    ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
        cache: GraphQLCache(),
        link: webSocketLink,
        defaultPolicies: DefaultPolicies(
          query: Policies(
            fetch: FetchPolicy.networkOnly,
            error: ErrorPolicy.none,
          ),
        ),
      ),
    );
    return client;
  }
}
