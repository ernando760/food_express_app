import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:food_express_app/app/modules/product/domain/entities/comment_entity.dart';
import 'package:food_express_app/app/modules/product/presenter/view_model/product_view_model.dart';
import 'package:food_express_app/app/modules/product/presenter/widgets/group_stars_widget.dart';
import 'package:food_express_app/app/modules/shared/constant/colors.dart';

class CustomerCommentWidget extends StatelessWidget {
  const CustomerCommentWidget({Key? key, required this.comment})
      : super(key: key);
  final CommentEntity comment;
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ProductViewModel>();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration:
          BoxDecoration(color: white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // username ,email and group stars components
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(comment.username,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: matteBlack)),
                Text(comment.email,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: matteBlack.withOpacity(.6)))
              ]),
              GroupStars(rating: comment.ratings, iconSize: 16)
            ],
          ),
          // description component
          Text(comment.comment,
              textScaler: comment.comment.length >= 50
                  ? const TextScaler.linear(.9)
                  : null,
              overflow: comment.comment.length >= 50 && !viewModel.showMore
                  ? TextOverflow.ellipsis
                  : TextOverflow.visible,
              style: const TextStyle(
                  fontSize: 16,
                  color: matteBlack,
                  fontWeight: FontWeight.w600)),
          comment.comment.length >= 50
              ? AnimatedBuilder(
                  animation: viewModel,
                  builder: (context, _) {
                    return Align(
                        alignment: Alignment.topLeft,
                        child: TextButton(
                          onPressed: viewModel.setShowMore,
                          child: Text(viewModel.textShowMore,
                              style: const TextStyle(
                                  color: green, fontWeight: FontWeight.w600)),
                        ));
                  })
              : Container()
        ],
      ),
    );
  }
}
