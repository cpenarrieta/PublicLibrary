import Foundation

class Library {
    
    var name: String
    var address: String
    var shelfs = [Shelf]()
    
    init(name:String, address:String){
        self.name = name
        self.address = address
    }
    
    func AddShelf(shelf: Shelf){
        shelfs.append(shelf)
    }
    
    func ReportAllBooks(){
        var i = 1
        for shelf in shelfs {
            for book in shelf.books {
                println("Shelf \(i) | Title: \(book.title) | Author: \(book.author) | Description: \(book.description)")
            }
            i++
        }
    }
}