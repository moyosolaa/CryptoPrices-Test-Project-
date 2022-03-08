import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'spacing.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({
    Key? key,
    required this.title,
    this.description = 'We cant see any record from\nyour history',
    required this.fallBackAction,
  }) : super(key: key);

  final String title;
  final String description;
  final VoidCallback fallBackAction;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'No $title',
          style: textTheme.headline6?.copyWith(
            fontSize: 19,
          ),
        ),
        const Spacing.height(8),
        Text(
          description,
          textAlign: TextAlign.center,
        ),
        const Spacing.height(24),
      ],
    );
  }
}

class LoadingList extends StatelessWidget {
  const LoadingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) => Shimmer.fromColors(
        baseColor: Colors.grey.withOpacity(0.10),
        highlightColor: Colors.grey[300]!,
        child: ListView.builder(
          itemCount: constraint.maxHeight ~/ 65,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
