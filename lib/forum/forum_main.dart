import 'package:flutter/material.dart';
import 'custom_widgets/forum_card.dart';

class ForumMain extends StatelessWidget {
  const ForumMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 10,
            right: 10,
            bottom: 10,
          ),
          child: TextField(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.orange),
                borderRadius: BorderRadius.circular(30),
              ),
              labelStyle: const TextStyle(color: Colors.orange),
              constraints:
                  BoxConstraints.tight(const Size(double.infinity, 40)),
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.orange,
              ),
              labelText: 'Search Post / پوسٹ تلاش کریں',
              focusColor: Colors.orange,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView(
            children: const [
              ForumCard(
                title: 'Title/عنوان',
                description:
                    'Description ikjegfLIGflegsiufkg  seiufghilesUGF iesghfIUegsfigfeSIUgu eufghiuesfgh/تم ایک کتیا گدی کے بیٹے بھاڑ میں جاؤ، اپنی ماں کو بھاڑ میں جاؤ',
              ),
              ForumCard(
                title: 'Title/عنوان',
                description:
                    'Description ikjegfLIGflegsiufkg  seiufghilesUGF iesghfIUegsfigfeSIUgu eufghiuesfgh/تم ایک کتیا گدی کے بیٹے بھاڑ میں جاؤ، اپنی ماں کو بھاڑ میں جاؤ',
              ),
              ForumCard(
                title: 'Title/عنوان',
                description:
                    'Description ikjegfLIGflegsiufkg  seiufghilesUGF iesghfIUegsfigfeSIUgu eufghiuesfgh/تم ایک کتیا گدی کے بیٹے بھاڑ میں جاؤ، اپنی ماں کو بھاڑ میں جاؤ',
              ),
              ForumCard(
                title: 'Title/عنوان',
                description:
                    'Description ikjegfLIGflegsiufkg  seiufghilesUGF iesghfIUegsfigfeSIUgu eufghiuesfgh/تم ایک کتیا گدی کے بیٹے بھاڑ میں جاؤ، اپنی ماں کو بھاڑ میں جاؤ',
              ),
              ForumCard(
                title: 'Title/عنوان',
                description:
                    'Description ikjegfLIGflegsiufkg  seiufghilesUGF iesghfIUegsfigfeSIUgu eufghiuesfgh/تم ایک کتیا گدی کے بیٹے بھاڑ میں جاؤ، اپنی ماں کو بھاڑ میں جاؤ',
              ),
              ForumCard(
                title: 'Title/عنوان',
                description:
                    'Description ikjegfLIGflegsiufkg  seiufghilesUGF iesghfIUegsfigfeSIUgu eufghiuesfgh/تم ایک کتیا گدی کے بیٹے بھاڑ میں جاؤ، اپنی ماں کو بھاڑ میں جاؤ',
              ),
              ForumCard(
                title: 'Title/عنوان',
                description:
                    'Description ikjegfLIGflegsiufkg  seiufghilesUGF iesghfIUegsfigfeSIUgu eufghiuesfgh/تم ایک کتیا گدی کے بیٹے بھاڑ میں جاؤ، اپنی ماں کو بھاڑ میں جاؤ',
              ),
              ForumCard(
                title: 'Title/عنوان',
                description:
                    'Description ikjegfLIGflegsiufkg  seiufghilesUGF iesghfIUegsfigfeSIUgu eufghiuesfgh/تم ایک کتیا گدی کے بیٹے بھاڑ میں جاؤ، اپنی ماں کو بھاڑ میں جاؤ',
              ),
              ForumCard(
                title: 'Title/عنوان',
                description:
                    'Description ikjegfLIGflegsiufkg  seiufghilesUGF iesghfIUegsfigfeSIUgu eufghiuesfgh/تم ایک کتیا گدی کے بیٹے بھاڑ میں جاؤ، اپنی ماں کو بھاڑ میں جاؤ',
              ),
              ForumCard(
                title: 'Title/عنوان',
                description:
                    'Description ikjegfLIGflegsiufkg  seiufghilesUGF iesghfIUegsfigfeSIUgu eufghiuesfgh/تم ایک کتیا گدی کے بیٹے بھاڑ میں جاؤ، اپنی ماں کو بھاڑ میں جاؤ',
              ),
              ForumCard(
                title: 'Title/عنوان',
                description:
                    'Description ikjegfLIGflegsiufkg  seiufghilesUGF iesghfIUegsfigfeSIUgu eufghiuesfgh/تم ایک کتیا گدی کے بیٹے بھاڑ میں جاؤ، اپنی ماں کو بھاڑ میں جاؤ',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
