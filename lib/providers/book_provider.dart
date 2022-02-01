import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:booksella/models/book.dart';

// dummy books for testing
class BookData with ChangeNotifier {
  final booksList = [
    // engenering books
    Book(
      bookId: "foihfjkwhfuo",
      category: "Engineering",
      subCategory: "1-year",
      bookName: "Engieneering Mathematics - I",
      price: 310,
      imageUrl:
          "https://www.schandpublishing.com/uploads/bookimages/schand-books/9789352834747.jpg",
    ),
    Book(
      bookId: "afuofnjoifjii",
      category: "Engineering",
      subCategory: "2-year",
      bookName: "Digital Design",
      price: 250,
      imageUrl:
          "https://images-na.ssl-images-amazon.com/images/I/51JEKC1uRtL.jpg",
    ),
    Book(
      bookId: "jnvnjrjrogop",
      category: "Engineering",
      subCategory: "3-year",
      bookName: "Information Theory and Coding",
      price: 845,
      imageUrl: "https://www.e-booksdirectory.com/imglrg/1404.jpg",
    ),
    Book(
      bookId: "lkgshgjsigsd",
      category: "Engineering",
      subCategory: "4-year",
      bookName: "VLSI",
      price: 745,
      imageUrl:
          "https://rukminim1.flixcart.com/image/1664/1664/book/6/8/1/cmos-vlsi-design-original-imadg4yt2bnah4by.jpeg?q=90",
    ),
    Book(
      bookId: "jfuiwehhfewh",
      category: "Engineering",
      subCategory: "1-year",
      bookName: "Engieneering Physics",
      price: 849,
      imageUrl:
          "https://www.oreilly.com/library/view/engineering-physics/9789332524064/images/cover.jpg",
    ),
    Book(
      bookId: "urgjksfutntu",
      category: "Engineering",
      subCategory: "2-year",
      bookName: "Data Strcutures and Algorithms",
      price: 2500,
      imageUrl:
          "https://www.careerdrill.com/blog/wp-content/uploads/2015/11/careerdrill_datastructure_algorithm_book4.jpg",
    ),
    Book(
      bookId: "hduauihdbdue",
      category: "Engineering",
      subCategory: "3-year",
      bookName: "Digital Image Processing",
      price: 975,
      imageUrl:
          "https://images-na.ssl-images-amazon.com/images/I/51N%2BxAZKXzL.jpg",
    ),
    Book(
      bookId: "743h4rjfwjfo",
      category: "Engineering",
      subCategory: "4-year",
      bookName: "Deep Learning",
      price: 745,
      imageUrl:
          "https://ebook4expert.org/wp-content/uploads/2016/12/Deep-Learning-Ian-Goodfellow-e1480935423443.jpg",
    ),
    Book(
      bookId: "qiowqiiqowioj",
      category: "Engineering",
      subCategory: "4-year",
      bookName: "Mechatronics",
      price: 9299,
      imageUrl:
          "https://images-na.ssl-images-amazon.com/images/I/51NB920bYaL.jpg",
    ),
    Book(
      bookId: "48uhrnnjcn737",
      category: "Engineering",
      subCategory: "2-year",
      bookName: "Strength of Materials",
      price: 746,
      imageUrl:
          "https://imgv2-2-f.scribdassets.com/img/document/251849133/original/b3f71d8be6/1584548668?v=1",
    ),

    // medical books
    Book(
      bookId: "40uhrjrhhuirh",
      category: "Medical",
      subCategory: "1-year",
      bookName: "Practical Physiology",
      price: 746,
      imageUrl:
          "https://fccmansfield.org/img/physiology-practical-book-for-mbbs-pdf-4.jpg",
    ),
    Book(
      bookId: "kkjwchroqwr",
      category: "Medical",
      subCategory: "1-year",
      bookName: "Microbiology",
      price: 930,
      imageUrl: "https://i.ebayimg.com/images/g/DOEAAOSwe79fBB1r/s-l640.jpg",
    ),
    Book(
      bookId: "ndsfbsjdfnj",
      category: "Medical",
      subCategory: "1-year",
      bookName: "Ophthalmology",
      price: 330,
      imageUrl:
          "https://i.pinimg.com/originals/b6/27/65/b627651653bc996f9a49fe0429fa6455.jpg",
    ),
    Book(
      bookId: "basdhasbdhad",
      category: "Medical",
      subCategory: "1-year",
      bookName: "Principles of clinical genetics",
      price: 4300,
      imageUrl:
          "https://www.jaypeebrothers.com/Images/highres/B9789352701889.jpg",
    ),
    Book(
      bookId: "jduasdbasdun",
      category: "Medical",
      subCategory: "2-year",
      bookName: "Human Anatomy",
      price: 455,
      imageUrl: "http://d.gr-assets.com/books/1178682308l/821821.jpg",
    ),
    Book(
      bookId: "jfhiuaefhiejo",
      category: "Medical",
      subCategory: "2-year",
      bookName: "Pedritic Success",
      price: 675,
      imageUrl:
          "https://www.medicosrepublic.com/wp-content/uploads/2019/05/Cover.jpg",
    ),
    Book(
      bookId: "rwuwehhbwiuiwf",
      category: "Medical",
      subCategory: "3-year",
      bookName: "Histology",
      price: 835,
      imageUrl:
          "https://thumbor.kenhub.com/9ywCbMgwm8LgDqttHHZoTaOT25o=/fit-in/800x1600/filters:watermark(/images/logo_url.png,-10,-10,0):background_color(FFFFFF):format(jpeg)/images/library/9189/Front_cover.jpg",
    ),
    Book(
      bookId: "fggfywgehfweiuh",
      category: "Medical",
      subCategory: "3-year",
      bookName: "Clinical Anesthesia",
      price: 734,
      imageUrl:
          "https://i.pinimg.com/474x/53/56/60/5356606c906dfac6eb560ec76fe5b84c.jpg",
    ),
    Book(
      bookId: "jdfhuiwfhidw",
      category: "Medical",
      subCategory: "4-year",
      bookName: "Biochemistry",
      price: 4790,
      imageUrl:
          "https://lib-ebooks.com/wp-content/uploads/2020/04/Satyanarayana-Biochemistry-PDF.jpg",
    ),
    Book(
      bookId: "fhowehweyr8q",
      category: "Medical",
      subCategory: "5-year",
      bookName: "Surgery",
      price: 674,
      imageUrl:
          "https://medchrome.com/wp-content/uploads/2016/01/bailey-love-s-short-practice-of-surgery-original-imadhgc4axgpgwwe.jpeg",
    ),
    // competetive exams
    // 1. jee mains / advance
    Book(
      bookId: "qwhqowueei",
      category: "Competitive Exams",
      subCategory: "JEE and NEET",
      bookName: "Concepts of physics - H.C.Verma",
      price: 467,
      imageUrl:
          "http://img6a.flixcart.com/image/book/8/7/8/concepts-of-physics-vol-1-400x400-imad8jsydgdawgwd.jpeg",
    ),
    Book(
      bookId: "oiqhfqodqoiwd",
      category: "Competitive Exams",
      subCategory: "JEE and NEET",
      bookName: "Inorganic Chemistry",
      price: 782,
      imageUrl:
          "https://www.schandpublishing.com/uploads/bookimages/schand-books/9789352830176.jpg",
    ),
    Book(
      bookId: "jafhuoeohfouae",
      category: "Competitive Exams",
      subCategory: "JEE and NEET",
      bookName: "Organic Chemistry",
      price: 325,
      imageUrl:
          "https://shribalajibooks.com/wp-content/uploads/2020/05/Solution-Advanced-Problems-in-Organic-Chemistry-JEE-MS-Chouhan-768x985.jpg",
    ),
    Book(
      bookId: "sgorghouhgpowo",
      category: "Competitive Exams",
      subCategory: "JEE and NEET",
      bookName: "Biology",
      price: 734,
      imageUrl:
          "https://cdn.shopify.com/s/files/1/2707/1762/products/CB146_4_1024x1024.jpg?v=1571758606",
    ),
    Book(
      bookId: "wejfhowehfoweh",
      category: "Competitive Exams",
      subCategory: "UPSC",
      bookName: "Chronicle",
      price: 125,
      imageUrl:
          "https://www.chronicleindia.in/pro_img/preview/9092_CSC%20English%20August_Cover-page-001.jpg",
    ),
    Book(
      bookId: "fowhefhwefj",
      category: "Competitive Exams",
      subCategory: "UPSC",
      bookName: "Indian History",
      price: 550,
      imageUrl:
          "https://n3.sdlcdn.com/imgs/f/f/5/UPSC-Civil-Services-Indian-Histroy-SDL122078071-1-bdda5.jpg",
    ),
    Book(
      bookId: "jahfhaufuefuh",
      category: "Competitive Exams",
      subCategory: "GATE and IES",
      bookName: "Circuit Theory",
      price: 476,
      imageUrl:
          "https://learnengineering.in/wp-content/uploads/2020/04/EE8251-Circuit-Theory.jpg",
    ),
    Book(
      bookId: "jsfdhfjkfowehhof",
      category: "Competitive Exams",
      subCategory: "GATE and IES",
      bookName: "Solved Paper IES",
      price: 870,
      imageUrl:
          "http://img7.flixcart.com/image/book/9/5/6/u-p-s-c-ies-engineering-services-examination-electronics-telecommunication-engineering-solved-papers-275x275-imadbzaghfhfyffu.jpeg",
    ),
  ];
  List<Book> get booksdata {
    return [...booksList];
  }

  String count = 'HomeScreen';
  List<Book> get engineeringData {
    return booksdata
        .where((element) => element.category == "Engineering")
        .toList();
  }

  List<Book> categoryData(String yearnumber) {
    return engineeringData
        .where((element) => element.subCategory == yearnumber)
        .toList();
  }

  List<Book> categoryyData(String categoryName) {
    return booksdata
        .where((element) => element.category == categoryName)
        .toList();
  }

  List<Book> categoryData2(String yearName, String categoryName) {
    return categoryyData(categoryName)
        .where((element) => element.subCategory == yearName)
        .toList();
  }

// function changes count values
  func1(
    String keys,
  ) {
    count = keys;
    print(count);
    notifyListeners();
  }

  setcount() {
    count = 'HomeScreen';
    notifyListeners();
  }

  List<Book> filterbyid(String bookId) {
    return booksdata.where((element) => element.bookId == bookId).toList();
  }
}


// void printFunction() {
//   print(booksList[0].category);
// }
