

import UIKit
import SkyFloatingLabelTextField
class BookTicketViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var totalFarelbl: UILabel!
    
    
    let movies = ["Padmaavat","Sanju","Race 3","Parmanu: The Story of Pokhran","Gold","Avengers: Infinity War","Mission: Impossible – Fallout","Ant-Man and the Wasp","Black Panther"]
    let seatNumbers = ["1","2","3","4","5"]
    let timeSchedule = ["9:30 AM","12:30 AM","4:00 PM","9:30 PM","10:30 PM"]
    var username = String()
    
    @IBOutlet weak var timeTxt: SkyFloatingLabelTextField!
    @IBOutlet weak var seatTxt: SkyFloatingLabelTextField!
    let moviePickerView = UIPickerView()
    let seatPickerView = UIPickerView()
    let timePicker = UIPickerView()
    @IBOutlet weak var movieTxt: SkyFloatingLabelTextField!
    @IBOutlet weak var usernamelbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        moviePickerView.delegate = self
        moviePickerView.dataSource = self
        seatPickerView.delegate = self
        seatPickerView.dataSource = self
        timePicker.delegate = self
        timePicker.dataSource = self
        moviePickerView.tag = 1
        seatPickerView.tag = 2
        timePicker.tag = 3
        //usernamelbl.text = "Welcome \(username)!!"
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: self.view.frame.size.height/6, width: self.view.frame.size.width, height: 40.0))
        toolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        
        toolBar.barStyle = UIBarStyle.blackTranslucent
        
        toolBar.tintColor = UIColor.white
        
        toolBar.backgroundColor = UIColor.black
        
        
        let defaultButton = UIBarButtonItem(title: "Default", style: UIBarButtonItemStyle.plain, target: self, action: #selector(tappedToolBarBtn))
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(donePressed))
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: self, action: nil)
        toolBar.setItems([defaultButton,flexSpace,flexSpace,doneButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        movieTxt.inputAccessoryView = toolBar
        movieTxt.inputView = moviePickerView
        seatTxt.inputView = seatPickerView
        seatTxt.inputAccessoryView = toolBar
        timeTxt.inputView = timePicker
        timeTxt.inputAccessoryView = toolBar
        navigationItem.title = "Welcome \(username)!!"
    }
    @objc func donePressed(sender: UIBarButtonItem) {
        
        movieTxt.resignFirstResponder()
        seatTxt.resignFirstResponder()
        timeTxt.resignFirstResponder()
    }
    @objc func tappedToolBarBtn(sender: UIBarButtonItem) {
        
        movieTxt.text = "one"
        seatTxt.resignFirstResponder()
        movieTxt.resignFirstResponder()
        timeTxt.resignFirstResponder()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func booktktbtn(_ sender: Any) {
        
        if (movieTxt.text?.isEmpty)! || (timeTxt.text?.isEmpty)! || (totalFarelbl.text?.isEmpty)! || (seatTxt.text?.isEmpty)!
        {
            let alertController = UIAlertController(title: "Something Wrong!!", message: "All fields are mandatory!!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
               
            }
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion:nil)
        }
        
        
        
   let vc = self.getViewControllerFromStoryBoard(storyBoardName: "Main", identifier: "SummeryViewController") as! SummeryViewController
        vc.filmName = self.movieTxt.text!
        vc.timeLb = self.timeTxt.text!
        vc.totalFare = self.totalFarelbl.text!
        vc.totalPerson = self.seatTxt.text!
        vc.usrname = self.username
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == moviePickerView{
            return movies.count
        }else if pickerView == seatPickerView{
            return seatNumbers.count
        }
        else if pickerView == timePicker{
            return timeSchedule.count
        }
       return 1
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        if pickerView == moviePickerView {
            self.movieTxt.text = movies[row]
            self.view.endEditing(false)
        } else if pickerView == seatPickerView{
            seatTxt.text = seatNumbers[row]
            let ttt:Int = Int(seatTxt.text!)!
            let b:Int = ttt*200
            totalFarelbl.text = String(b) + "₹"
            self.view.endEditing(false)
        }
        else if pickerView == timePicker{
            timeTxt.text = timeSchedule[row]
            self.view.endEditing(false)
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        if pickerView == moviePickerView {
            return movies[row]
            
        } else if pickerView == seatPickerView{
            return seatNumbers[row]
        }
        else if pickerView == timePicker{
            return timeSchedule[row]
        }
        return ""
       
    }
    func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func multiplication(totalSeat:Int,totalFare:Int)->Int  {
     
        return totalFare*totalSeat
    }
}


