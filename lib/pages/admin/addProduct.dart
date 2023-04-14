import 'dart:io';

import 'Package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_app/Elements/alert.dart';
import 'package:flutter_app/Elements/toast.dart';
import 'package:flutter_app/pages/admin/adminProducts.dart';
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';

class AddProduct extends StatefulWidget {
  final bool edit;
  final AdminProduct product;
  AddProduct({Key key, @required this.edit, this.product}) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productCategoryController = TextEditingController();
  final imagePicker = ImagePicker();
  XFile productPhoto;
  Widget photoContainerChild;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    if (widget.edit) {
      productNameController.text = widget.product.name;
      productPriceController.text = widget.product.price.toString();
      productCategoryController.text = widget.product.category;
      photoContainerChild = Image.network(widget.product.picture);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var productsCollection = FirebaseFirestore.instance.collection("products");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.edit ? "Edit Product" : "Add Product"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                    child: photoContainerChild != null
                        ? Column(
                            children: [
                              photoContainerChild,
                              ElevatedButton(
                                onPressed: () async {
                                  try {
                                    productPhoto = await imagePicker.pickImage(
                                        source: ImageSource.gallery);
                                  } catch (e, s) {
                                    alert(context, '$e:$s');
                                  }
                                  if (productPhoto != null) {
                                    setState(() {
                                      photoContainerChild =
                                          Image.file(File(productPhoto.path));
                                    });
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Theme.of(context).primaryColor),
                                child: Text("Change"),
                              )
                            ],
                          )
                        : IconButton(
                            onPressed: () async {
                              try {
                                productPhoto = await imagePicker.pickImage(
                                    source: ImageSource.gallery);
                              } catch (e, s) {
                                alert(context, '$e:$s');
                              }
                              if (productPhoto != null) {
                                setState(() {
                                  photoContainerChild =
                                      Image.file(File(productPhoto.path));
                                });
                              }
                            },
                            iconSize: 60,
                            icon: Icon(
                              Icons.add_a_photo,
                              color: Theme.of(context).primaryColor,
                            ))),
              ),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: productNameController,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.shopping_cart),
                    labelText: "Product Name",
                    border: OutlineInputBorder()),
                validator: (value) {
                  if (value.isEmpty) return "Please enter product name";
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: productPriceController,
                decoration: InputDecoration(
                    prefix: Text("GHS "),
                    labelText: "Product Price",
                    border: OutlineInputBorder()),
                validator: (value) {
                  if (value.isEmpty) return "Please enter product price";
                  if (!value.contains(RegExp(r'^[0-9]*$'))) {
                    return "Price should be a number";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: productCategoryController,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.bar_chart),
                    labelText: "Product Category",
                    border: OutlineInputBorder()),
                validator: (value) {
                  if (value.isEmpty) return "Please enter product category";
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    if (!widget.edit) {
                      var imagePath = await uploadproductImage(
                          productNameController.text,
                          productCategoryController.text.toLowerCase(),
                          File(productPhoto.path));
                      await productsCollection.doc().set({
                        "name": productNameController.text,
                        "price": double.parse(productPriceController.text),
                        "category":
                            productCategoryController.text.toLowerCase(),
                        "pictue": imagePath
                      });
                      showToastMessage("Product addition successful");
                      Navigator.pop(context);
                    }
                    if (widget.edit) {
                      var imagePath;
                      if (productPhoto != null) {
                        imagePath = await uploadproductImage(
                            productNameController.text,
                            productCategoryController.text.toLowerCase(),
                            File(productPhoto.path));
                      }
                      await productsCollection
                          .doc(widget.product.productId)
                          .update({
                        "name": productNameController.text,
                        "price": double.parse(productPriceController.text),
                        "category":
                            productCategoryController.text.toLowerCase(),
                        "pictue": imagePath ?? widget.product.picture
                      });
                      showToastMessage("Product edit successful");
                      Navigator.pop(context);
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor),
                child: Text("Submit"),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<String> uploadproductImage(
      String productName, String productCategory, File image) async {
    String returnURL;
    if (productPhoto != null) {
      String returnURL;
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('$productCategory/productName/${path.basename(image.path)}');
      UploadTask uploadTask = storageReference.putFile(image);

      await uploadTask.whenComplete(() async {
        await storageReference.getDownloadURL().then((fileURL) async {
          returnURL = fileURL;

          return returnURL;
        });
      });
    }
    return returnURL;
  }
}
