import 'package:flutter/material.dart';

class CategoryImageService{

  String setCategoryImage(String category){
    switch(category){
      case 'Drama':
        return 'https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg';

      case 'Action':
        return 'https://assets-prd.ignimgs.com/2021/08/09/dune-insta-vert-main-dom-1638x2048-1628522913715.jpg';

      default:
        return 'https://cdn.europosters.eu/image/750/posters/lord-of-the-rings-fellowship-i11723.jpg';

    }
  }

}