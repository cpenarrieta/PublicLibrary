import UIKit

class ShelfTableViewController: UITableViewController {

    var shelfs = [Shelf]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shelfs.count
    }

    private struct StoryBoard {
        static let CellReuseIdentifier = "Shelf"
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(StoryBoard.CellReuseIdentifier, forIndexPath: indexPath) as! UITableViewCell
        
        let shelf = shelfs[indexPath.row]
        cell.textLabel?.text = shelf.category
        
        return cell
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowBooks" {
            let bookViewController = segue.destinationViewController as! BookTableViewController
            if let selectedRow = tableView.indexPathForSelectedRow()?.row {
                bookViewController.books = shelfs[selectedRow].books
                bookViewController.shelf = shelfs[selectedRow]
            }
        }
    }
}
