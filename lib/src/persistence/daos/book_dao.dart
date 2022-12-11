import 'package:hive/hive.dart';
import 'package:jams/src/data/vos/book_vo.dart';
import 'package:jams/src/persistence/hive_constants.dart';
import 'package:rxdart/rxdart.dart';

class BookDao {
  void deleteAllBooks() {
    openBookBox().clear();
  }

  void addBook(BookVO book) {
    openBookBox().put(book.name, book);
  }

  Stream<List<BookVO>> getLiveBookList() {
    return openBookBox()
    .watch()
    .map((event) => openBookBox().values.toList())
    .startWith(openBookBox().values.toList());
  }

  Box<BookVO> openBookBox() {
    return Hive.box<BookVO>(HiveConstants.BOX_NAME_BOOK);
  }
}
