// ignore_for_file: prefer_function_declarations_over_variables

import 'package:food_express_app/app/modules/product/domain/entities/comment_entity.dart';
import 'package:food_express_app/app/modules/product/domain/entities/product_entity.dart';
import 'package:food_express_app/app/modules/product/errors/i_product_exceptions.dart';

final List<CommentEntity> comments = [
  CommentEntity(
    id: "id1",
    username: "username1",
    email: "email@email1.com",
    comment: "comment1",
  ),
  CommentEntity(
    id: "id2",
    username: "username2",
    email: "email@email2.com",
    comment: "comment2",
  ),
  CommentEntity(
    id: "id3",
    username: "username3",
    email: "email@email3.com",
    comment: "comment3",
  ),
];

final List<ProductEntity> mockProducts = [
  ProductEntity(
      id: "id1",
      name: "name1",
      description: "description1",
      price: 10,
      comments: comments),
  ProductEntity(
    id: "id2",
    name: "name2",
    description: "description2",
    price: 20,
  ),
  ProductEntity(
      id: "id3",
      name: "name3",
      description: "description3",
      comments: comments,
      price: 30),
  ProductEntity(
      id: "id4",
      name: "name4",
      description: "description4",
      comments: comments,
      price: 40),
  ProductEntity(
      id: "id5", name: "name5", description: "description5", price: 50),
];

final productException = (String messageError) =>
    ProductUnknowException(messageError: messageError, label: "label");
