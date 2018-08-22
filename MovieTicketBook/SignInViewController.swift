

import UIKit
import SkyFloatingLabelTextField
import CoreData
class SignInViewController: UIViewController {
    var result = NSArray()
    @IBOutlet weak var passwordText: SkyFloatingLabelTextField!
    
    @IBOutlet weak var usernameText: SkyFloatingLabelTextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated:true)
        backGroundImage()
    }
    
    @IBAction func signinBtn(_ sender: Any) {
        CheckForUserNameAndPasswordMatch(username: usernameText.text!, password: passwordText.text!)
    }
    func backGroundImage(){
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "tkt")
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
        backgroundImage.clipsToBounds = true
        backgroundImage.center = view.center
        self.view.insertSubview(backgroundImage, at: 0)
    }
    @IBAction func signUpacion(_ sender: Any) {
        let vc = self.getViewControllerFromStoryBoard(storyBoardName: "Main", identifier: "SignUpViewController") as! SignUpViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func CheckForUserNameAndPasswordMatch( username: String, password : String)
    {
        let app = UIApplication.shared.delegate as! AppDelegate
        
        let context = app.persistentContainer.viewContext
        
        let fetchrequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        let predicate = NSPredicate(format: "username = %@", username)
        
        fetchrequest.predicate = predicate
        do
        {
            result = try context.fetch(fetchrequest) as NSArray
            
            if result.count>0
            {
                let objectentity = result.firstObject as! Users
                
                if objectentity.username == username && objectentity.password == password
                {
                    let vc = self.getViewControllerFromStoryBoard(storyBoardName: "Main", identifier: "BookTicketViewController") as! BookTicketViewController
                    vc.username = objectentity.username!
                    self.navigationController?.pushViewController(vc, animated: true)
                }
                else
                {
                    let alertController = UIAlertController(title: "OOPS!!!", message: "Your credential is wrong!!", preferredStyle: .alert)
                    let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                        
                        print("you have pressed Yes button");
                        //Call another alert here
                    }
                    alertController.addAction(OKAction)
                    self.present(alertController, animated: true, completion:nil)
                }
            }
        }
            
        catch
        {
            let fetch_error = error as NSError
            print("error", fetch_error.localizedDescription)
        }
        
    }
    
    
    
}
