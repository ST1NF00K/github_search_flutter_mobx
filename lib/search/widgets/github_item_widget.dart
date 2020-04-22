import 'package:flutter/material.dart';

class GithubItemWidget extends StatelessWidget {
  final Widget projectDirectory;
  final Widget description;
  final Widget stars;
  final Widget language;
  final Widget updatedAt;

  const GithubItemWidget({Key key, this.projectDirectory, this.description, this.stars, this.language, this.updatedAt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
            projectDirectory,
            description,
          Row(
            children: <Widget>[
              stars, language, updatedAt
            ],
          )
        ],
      ),
    );
  }
}
