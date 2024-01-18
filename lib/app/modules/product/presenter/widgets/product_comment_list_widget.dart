// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:food_express_app/app/modules/product/domain/entities/comment_entity.dart';
import 'package:food_express_app/app/modules/product/presenter/widgets/customer_comment_widget.dart';

class ProductCommentListWidget extends StatelessWidget {
  const ProductCommentListWidget(
      {Key? key, this.comments = const [], required this.scrollController})
      : super(key: key);
  final List<CommentEntity> comments;
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: scrollController,
        itemCount: comments.length,
        itemBuilder: (_, index) {
          return CustomerCommentWidget(comment: comments[index]);
        });
  }
}
