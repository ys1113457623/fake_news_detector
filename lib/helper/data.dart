
import '../models/article.dart';
import '../models/categorie_model.dart';

List<CategorieModel> getCategories(){

  List<CategorieModel> myCategories = List<CategorieModel>();
  CategorieModel categorieModel;

  //1
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "Business";
  categorieModel.imageAssetUrl = "https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80";
  myCategories.add(categorieModel);

  //2
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "Entertainment";
  categorieModel.imageAssetUrl = "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  myCategories.add(categorieModel);

  //3
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "General";
  categorieModel.imageAssetUrl = "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
  myCategories.add(categorieModel);

  //4
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "Health";
  categorieModel.imageAssetUrl = "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";
  myCategories.add(categorieModel);

  //5
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "Science";
  categorieModel.imageAssetUrl = "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80";
  myCategories.add(categorieModel);

  //5
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "Sports";
  categorieModel.imageAssetUrl = "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
  myCategories.add(categorieModel);

  //5
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "Technology";
  categorieModel.imageAssetUrl = "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  myCategories.add(categorieModel);

  return myCategories;

}

class Utils{
  List<FakeNew> getFakeNews() {
    return [
      FakeNew(
          author: 'Harshdeep Singh',
          title:
              'Planet Nibiru is headed straight for Earth',
          description:
              'Sound the alarms and start digging your bunkers, everybody. Planet Nibiru (also known as Planet X and Planet Nine) ‘was’ to be on a direct collision course with Earth all the way back in March 2016',
          urlToImage:
              "https://th-i.thgim.com/public/newsletter/the-evening-wrap/vi9jpy/article65896465.ece/alternates/FREE_1200/Modi%20SCO%20meet.jfif"),
      FakeNew(
          author: 'Harshdeep Singh',
          title:
              '''On 20 Billion Plant For Gujarat, Sharad Pawar's Dig At Centre, Vedanta''',
          description:
              'Asked if potential investors fear political instability in Maharashtra, Sharad Pawar said a state has to create a conducive atmosphere for attracting investments and industries.',
          urlToImage:
              "https://c.ndtvimg.com/2022-09/lhbbombs_sharad-pawar-650_625x300_11_September_22.jpg"),
      FakeNew(
          author: 'Harshdeep Singh',
          title:
              'Can’t take Ukraine returnees in Indian colleges, Centre tells Supreme Court',
          description:
              'In an affidavit, the Union health ministry pointed out that there are no provisions allowing such transfers either under the Indian Medical Council Act, 1956 or the National Medical Commission Act, 2019.',
          urlToImage:
              "https://images.hindustantimes.com/img/2022/09/15/550x309/eb851582-351e-11ed-aaf6-899a59fb6c14_1663264612998.jpg"),
    ];
  }
}
