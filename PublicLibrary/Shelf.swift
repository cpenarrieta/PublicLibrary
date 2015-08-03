import Foundation

class Shelf {
    
    var category: String
    var books = [Book]()
    
    init (category:String){
        self.category = category
    }
    
    func AddBook(book: Book){
        books.append(book)
    }
    
    func RemoveBook(bookToRemove: Book){
        var i = 0
        for book in books {
            //swicth to swift 2.0 indexOf capability
            if book.title.lowercaseString == bookToRemove.title.lowercaseString {
                books.removeAtIndex(i)
                break
            }
            i++
        }
    }
}