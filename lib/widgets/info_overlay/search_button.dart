import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/index.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/search');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0x99575757),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            AppConstant.searchAyah,
            style: TextStyle(color: Color(0xff8F8F8F)),
          ),
          SvgPicture.asset(AppAsset.search),
        ],
      ),
    );
  }
}
