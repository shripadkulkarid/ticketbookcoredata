

import UIKit
import SkyFloatingLabelTextField
import CoreData
class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var nameText: SkyFloatingLabelTextField!
    
    @IBOutlet weak var addressText: SkyFloatingLabelTextField!
    @IBOutlet weak var mobileText: SkyFloatingLabelTextField!
    
    @IBOutlet weak var emailText: SkyFloatingLabelTextField!
    
    @IBOutlet weak var usernameText: SkyFloatingLabelTextField!
    
    @IBOutlet weak var passwordText: SkyFloatingLabelTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        
    }
    
    @IBAction func registerBtn(_ sender: Any) {
        
        if (nameText.text?.isEmpty)! || (addressText.text?.isEmpty)! || (mobileText.text?.isEmpty)! || (emailText.text?.isEmpty)! || (usernameText.text?.isEmpty)! || (passwordText.text?.isEmpty)!{
            let alertController = UIAlertController(title: "Something Wrong!!", message: "All fields are mandatory!!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                print("you have pressed Yes button");
                //Call another alert here
            }
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion:nil)
        }
        
        if isPasswordValid(passwordText.text!)
        {
            if isValidEmail(testStr: emailText.text!)
            {
                let appDelegate:AppDelegate = (UIApplication.shared.delegate as! AppDelegate)
                let context = appDelegate.persistentContainer.viewContext
                let entity = NSEntityDescription.entity(forEntityName: "Users", in: context)
                
                let newUser = NSManagedObject(entity: entity!, insertInto: context)
                newUser.setValue(nameText.text, forKey: "name")
                newUser.setValue(addressText.text, forKey: "address")
                newUser.setValue(mobileText.text, forKey: "mobile")
                newUser.setValue(emailText.text, forKey: "email")
                newUser.setValue(usernameText.text, forKey: "username")
                newUser.setValue(passwordText.text, forKey: "password")
                do {
                    try context.save()
                } catch {}
                let alertController = UIAlertController(title: "Register Successful", message: "Registration successful Please sign in!!", preferredStyle: .alert)
                let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                    let vc = self.getViewControllerFromStoryBoard(storyBoardName: "Main", identifier: "SignInViewController") as! SignInViewController
                    self.navigationController?.pushViewController(vc, animated: true)
                    print("you have pressed Yes button");
                    //Call another alert here
                }
                alertController.addAction(OKAction)
                self.present(alertController, animated: true, completion:nil)
                
            }else
            {
                print("mail check")
                let alertController1 = UIAlertController (title: "Fill Email id", message: "Enter valid email", preferredStyle: UIAlertControllerStyle.alert)
                
                alertController1.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alertController1, animated: true, completion: nil)
            }
        }
        else
        {
            print("pswd check")
            let alertController1 = UIAlertController (title: "Fill the password ", message: "Enter valid password", preferredStyle: UIAlertControllerStyle.alert)
            alertController1.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController1, animated: true, completion: nil)
        }
        
        
        
    }
    
}

extension SignUpViewController{
    
    func isValidInput(Input:String) -> Bool
    {
        let RegEx = "\\A\\w{3,18}\\z"
        let Test = NSPredicate(format:"SELF MATCHES %@", RegEx)
        return Test.evaluate(with: Input)
    }
    func isPasswordValid(_ password : String) -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{3,}")
        return passwordTest.evaluate(with: password)
    }
    func isValidEmail(testStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
}

