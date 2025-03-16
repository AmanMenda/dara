import 'package:dara/helpers/product_analysis.dart';
import 'package:dara/theme/colors.dart';
import 'package:dara/theme/sizes.dart';
import 'package:dara/viewmodels/product_details_viewmodel.dart';
import 'package:dara/views/shared/underlined_text.dart';
import 'package:flutter/material.dart';
import 'package:dara/views/base.view.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<ProductDetailsViewModel>(
      builder: (context, model, _) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.black)),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(Spacing.small),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Image du produit
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          model.product.imageUrl,
                          width: 100,
                          height: 100,
                          fit: BoxFit.contain,
                          errorBuilder: (_, __, ___) => Container(
                            width: 100,
                            height: 100,
                            color: Colors.grey[200],
                            child: const Icon(Icons.image_not_supported),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        model.product.productName,
                        style: TextStyle(
                          fontSize: FontSizes.bodyLarge,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      
                      
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            model.product.brand,
                            style: TextStyle(
                              fontSize: FontSizes.bodyMedium,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: getRatingColor(rating: model.product.rating),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '${getRatingComment(rating: model.product.rating)} • ${model.product.rating.toInt()}/100',
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ), // TODO: create a widget for this row
  
                    ],
                  ),
                
                ),

                const SizedBox(height: 24),

                // Boutons Défauts/Qualités
                Row(
                  children: [
                    UnderlinedText(
                      text: "Défauts",
                      onPressed: () {
                        model.selectDefects();
                      },
                      textColor: model.showDefects 
                          ? AppColors.red 
                          : Colors.grey,
                      underlineColor: model.showDefects 
                          ? AppColors.red 
                          : Colors.transparent,
                    ),
                    UnderlinedText(
                      text: "Qualités",
                      onPressed: () {
                        model.selectQualities();
                      },
                      textColor: model.showDefects 
                          ? Colors.grey 
                          : AppColors.red,
                      underlineColor: model.showDefects
                          ? Colors.transparent
                          : AppColors.red,
                    ),
                  ],
                ),

                // Liste des éléments
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: model.showDefects 
                      ? model.product.defects.length 
                      : model.product.qualities.length,
                  itemBuilder: (context, index) {
                    final item = model.showDefects
                        ? model.product.defects[index]
                        : model.product.qualities[index];
                    
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 6),
                            width: 4,
                            height: 4,
                            decoration: BoxDecoration(
                              color: model.showDefects 
                                  ? AppColors.red 
                                  : Colors.green,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                                height: 1.4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}