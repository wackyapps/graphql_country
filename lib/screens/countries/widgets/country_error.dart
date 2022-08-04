import 'package:flutter/material.dart';

class GraphQLErrorMessage extends StatelessWidget {
  final String graphqlError;
  const GraphQLErrorMessage({Key? key, required this.graphqlError}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("GraphQLError: $graphqlError");
    return Text(graphqlError);
  }
}
