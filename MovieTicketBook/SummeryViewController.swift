

import UIKit
import SkyFloatingLabelTextField
class SummeryViewController: UIViewController {
    var filmName = String()
    var totalPerson = String()
    var totalFare = String()
    var timeLb = String()
    var usrname = String()
    @IBOutlet weak var viewSummery: UIView!
    @IBOutlet weak var movieTxt: SkyFloatingLabelTextField!
    @IBOutlet weak var timeTxt: SkyFloatingLabelTextField!
    
    @IBOutlet weak var totalFareTxt: SkyFloatingLabelTextField!
    @IBOutlet weak var totalSeatsTxt: SkyFloatingLabelTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewSummery.viewDropShadow()
        self.navigationItem.title = "Hey \(usrname)  see your booking summary!!"
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
        movieTxt.text = filmName
        timeTxt.text = timeLb
        totalFareTxt.text = totalFare
        totalSeatsTxt.text = totalPerson
    }
    
    
    
}
