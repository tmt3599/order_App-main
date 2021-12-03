import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:order_app/config/palette.dart';
import 'package:order_app/models/models.dart';
import 'package:order_app/services/category_service.dart';

class CategoryModal extends StatefulWidget {
  const CategoryModal({Key? key}) : super(key: key);

  @override
  _CategoryModalState createState() => _CategoryModalState();
}

class _CategoryModalState extends State<CategoryModal> {
  final categoryService = CategoryService();
  List<Category> categoris = [];
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    _getCategory();
  }

  void _getCategory() async {
    setState(() => _isLoading = true);
    categoris = await categoryService.getCategory();
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Container(
      width: _width,
      height: _height - 250,
      decoration: const BoxDecoration(
        color: Palette.scaffold,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Stack(
        children: [
          Container(
            height: 50,
            decoration: const BoxDecoration(
              color: Palette.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: const Center(
              child: Text(
                'Thực đơn',
                style: TextStyle(
                  color: Palette.textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          _isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Positioned(
                  top: 70,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15.0,
                        mainAxisSpacing: 15.0,
                        mainAxisExtent: 80,
                      ),
                      itemCount: categoris.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 70,
                          decoration: BoxDecoration(
                            color: Palette.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    '${categoris[index].imageUrl}',
                                    fit: BoxFit.cover,
                                    width: 60,
                                    height: 60,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  '${categoris[index].name}',
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
          Positioned(
            top: 15,
            right: 15,
            child: InkWell(
                child: Icon(
                  CupertinoIcons.clear,
                  size: 20,
                  color: Colors.grey.shade700,
                ),
                onTap: () => {
                      Navigator.pop(context),
                    }),
          ),
        ],
      ),
    );
  }
}
