import UIKit

class BookDetailViewController: UIViewController, UITextFieldDelegate {

    var book: Book?
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        titleTextField.text = book?.title
        authorTextField.text = book?.author
        descriptionTextField.text = book?.description
    }
    
    override func viewWillDisappear(animated: Bool) {
        book?.title = titleTextField.text
        book?.author = authorTextField.text
        book?.description = descriptionTextField.text
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
