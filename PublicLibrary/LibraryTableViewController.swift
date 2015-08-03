import UIKit

class LibraryTableViewController: UITableViewController {

    var libraries = [Library]()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadTempData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return libraries.count
    }
    
    private struct StoryBoard {
        static let CellReuseIdentifier = "Library"
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(StoryBoard.CellReuseIdentifier, forIndexPath: indexPath) as! UITableViewCell
        
        let library = libraries[indexPath.row]
        cell.textLabel?.text = library.name
        cell.detailTextLabel?.text = library.address
        
        return cell
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowShelfs" {
            let shelfViewController = segue.destinationViewController as! ShelfTableViewController
            if let selectedRow = tableView.indexPathForSelectedRow()?.row {
                shelfViewController.shelfs = libraries[selectedRow].shelfs
            }
        }
    }

    func loadTempData(){
        libraries.append(Library(name: "Seattle Public Library-Central Library", address: "1000 4th Ave, Seattle, WA"))
        libraries.append(Library(name: "Douglass-Truth Library", address: "2300 E Yesler Way , Seattle, WA"))
        libraries.append(Library(name: "West Seattle Tool Library", address: "4408 Delridge Way SW , Seattle, WA"))
        libraries.append(Library(name: "White Center Library", address: "11220 16th Ave SW , Seattle, WA"))
        libraries.append(Library(name: "Rainier Beach Public Library", address: "9125 Rainier Ave S , Seattle, WA"))
        
        for library in libraries {
            var shelf1 = Shelf(category: "Arts")
            library.shelfs.append(shelf1)
            addArtBooks(library.shelfs.last!)
            
            var shelf2 = Shelf(category: "Business")
            library.shelfs.append(shelf2)
            addBusinessBooks(library.shelfs.last!)
            
            var shelf3 = Shelf(category: "Children's")
            library.shelfs.append(shelf3)
            addChildrensBooks(library.shelfs.last!)
            
            var shelf4 = Shelf(category: "Education")
            library.shelfs.append(shelf4)
            addEducationBooks(library.shelfs.last!)
            
            var shelf5 = Shelf(category: "Science")
            library.shelfs.append(shelf5)
            addScienceBooks(library.shelfs.last!)
        }
    }
    
    func addArtBooks(shelf: Shelf){
        var book1 = Book(title: "Secret Garden", author: "Johanna Basford", description: "This beautiful and interactive coloring book features delicate and highly detailed pen-and-ink illustrations—all waiting to be brought to life with color. As added entertainment, tiny garden creatures are hidden on the pages, waiting to be found, and a key and index are included in the back. The book's cover and jacket are also colorable.")
        var book2 = Book(title: "Art That Changed the World", author: "DK Publishing", description: "Art That Changed the World tells the story of every major art style, movement by movement, giving art lovers a visual timeline showing key paintings that sparked each transition and explaining major events that shaped their evolution.")
        
        book1.enshelf(shelf)
        book2.enshelf(shelf)
    }
    
    func addBusinessBooks(shelf: Shelf){
        var book1 = Book(title: "The Entrepreneur Mind", author: "Kevin D. Johnson", description: "To achieve unimaginable business success and financial wealth—to reach the upper echelons of entrepreneurs, where you’ll find Mark Zuckerberg of Facebook, Sara Blakely of Spanx, Mark Pincus of Zynga, Kevin Plank of Under Armour, and many others—you have to change the way you think. In other words, you must develop the Entrepreneur Mind, a way of thinking that comes from learning the vital lessons of the best entrepreneurs.")
        var book2 = Book(title: "The Personal MBA: Master the Art of Business", author: "Josh Kaufman", description: "Getting an MBA is an expensive choice-one almost impossible to justify regardless of the state of the economy. Even the elite schools like Harvard and Wharton offer outdated, assembly-line programs that teach you more about PowerPoint presentations and unnecessary financial models than what it takes to run a real business. You can get better results (and save hundreds of thousands of dollars) by skipping business school altogether. ")
        
        book1.enshelf(shelf)
        book2.enshelf(shelf)
    }
    
    func addChildrensBooks(shelf: Shelf){
        var book1 = Book(title: "What Pet Should I Get?", author: "Dr. Seuss", description: "This never-ever-before-seen picture book by Dr. Seuss about making up one’s mind is the literary equivalent of buried treasure! What happens when a brother and sister visit a pet store to pick a pet? Naturally, they can’t choose just one! The tale captures a classic childhood moment—choosing a pet—and uses it to illuminate a life lesson: that it is hard to make up your mind, but sometimes you just have to do it!")
        var book2 = Book(title: "Rude Cakes", author: "Rowboat Watkins", description: "Who knew that cakes were so rude?! In this deliciously entertaining book, a not-so-sweet cake—who never says please or thank you or listens to its parents—gets its just desserts. Mixing hilarious text and pictures, Rowboat Watkins, a former Sendak fellow, has cooked up a laugh-out- loud story that can also be served up as a delectable discussion starter about manners or bullying, as it sweetly reminds us all that even the rudest cake can learn to change its ways.")
        
        book1.enshelf(shelf)
        book2.enshelf(shelf)
    }
    
    func addEducationBooks(shelf: Shelf){
        var book1 = Book(title: "How Children Succeed", author: "Paul Tough", description: "Why do some children succeed while others fail? The story we usually tell about childhood and success is the one about intelligence: success comes to those who score highest on tests, from preschool admissions to SATs. But in How Children Succeed, Paul Tough argues that the qualities that matter more have to do with character: skills like perseverance, curiosity, optimism, and self-control.")
        var book2 = Book(title: "What Great Teachers Do Differently", author: "Todd Whitaker", description: "This book describes the beliefs, behaviors, attitudes, and interactions that form the fabric of life in our best classrooms and schools. It focuses on the specific things that great teachers do ... that others do not. Readers of author Todd Whitaker's best-selling WHAT GREAT PRINCIPALS DO DIFFERENTLY asked him for a companion volume focusing on great teachers and their classrooms. This book is his response to those requests.This book focuses on the specific things that great teachers do ... that others do not.")
        
        book1.enshelf(shelf)
        book2.enshelf(shelf)
    }
    
    func addScienceBooks(shelf: Shelf){
        var book1 = Book(title: "Science: The Definitive Visual Guide", author: "Robert Dinwiddie", description: "Encompassing everything from ancient Greek geometry and quantum physics to the wedge and the World Wide Web, Science is a remarkable reference book that tells the story of science from earliest times to the present day")
        var book2 = Book(title: "Origins: Fourteen Billion Years of Cosmic Evolution", author: "Neil deGrasse Tyson", description: "Our true origins are not just human, or even terrestrial, but in fact cosmic. Drawing on recent scientific breakthroughs and the current cross-pollination among geology, biology, astrophysics, and cosmology, ?Origins? explains the soul-stirring leaps in our understanding of the cosmos. From the first image of a galaxy birth to Spirit Rover's exploration of Mars, to the discovery of water on one of Jupiter's moons, coauthors Neil deGrasse Tyson and Donald Goldsmith conduct a galvanizing tour of the cosmos with clarity and exuberance. 32 pages of color illustrations")
        
        book1.enshelf(shelf)
        book2.enshelf(shelf)
    }
}
