import 'package:flutter/cupertino.dart';
import 'package:food_express_app/app/modules/product/domain/entities/comment_entity.dart';
import 'package:food_express_app/app/modules/product/presenter/widgets/product_comment_list_widget.dart';
import 'package:food_express_app/app/modules/shared/constant/colors.dart';

class ProductCommentDraggableScrollableSheetWidget extends StatelessWidget {
  const ProductCommentDraggableScrollableSheetWidget(
      {super.key, this.comments = const []});

  final List<CommentEntity> comments;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.078,
        maxChildSize: 0.5,
        minChildSize: 0.078,
        builder: (context, scrollController) {
          return Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 50),
                decoration: const BoxDecoration(color: white),
                child: comments.isEmpty
                    ? const EmptyProductCommentWidget()
                    : ProductCommentListWidget(
                        scrollController: scrollController,
                        comments: comments,
                      ),
              ),
              SingleChildScrollView(
                controller: scrollController,
                child: Container(
                  constraints: const BoxConstraints.expand(height: 50),
                  decoration: const BoxDecoration(
                      color: iceWhite,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: matteBlack,
                            borderRadius: BorderRadius.circular(10)),
                        height: 12,
                        width: 50,
                      ),
                      Container(
                          alignment: Alignment.center,
                          child: Text(
                            "(${comments.length}) comentários",
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: red),
                          )),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }
}

class EmptyProductCommentWidget extends StatelessWidget {
  const EmptyProductCommentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text("Nenhum comentário",
            style: TextStyle(
                fontSize: 18, color: matteBlack, fontWeight: FontWeight.w600)));
  }
}
