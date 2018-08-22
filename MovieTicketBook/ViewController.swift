

import UIKit
import SkyFloatingLabelTextField
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func signup(_ sender: Any) {
         let vc = self.getViewControllerFromStoryBoard(storyBoardName: "Main", identifier: "SignUpViewController") as! SignUpViewController
//        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController
      // self.navigationController?.pushViewController(vc!, animated: true)
        self.present(vc, animated: true, completion: nil)
    }
    

    @IBAction func signIn(_ sender: Any) {
        let vc = self.getViewControllerFromStoryBoard(storyBoardName: "Main", identifier: "SignInViewController") as! SignInViewController
         self.present(vc, animated: true, completion: nil)
    }
}

