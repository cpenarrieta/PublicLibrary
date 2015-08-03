import Foundation

class Book {
    var title:String
    var author:String
    var description:String
    var currentShelf:Shelf?
    
    init(title:String, author:String, description:String){
        self.title = title
        self.author = author
        self.description = description
    }
    
    func enshelf(shelf: Shelf) {
        shelf.AddBook(self)
        currentShelf = shelf
    }
    
    func unshelf() {
        if let shelf = currentShelf {
            shelf.RemoveBook(self)
        }
    }
}