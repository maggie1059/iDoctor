//
//  nextViewController.swift
//  iDoctor2
//
//  Created by Maggie Wu on 1/27/18.
//
//

import UIKit

class NextViewController: UIViewController {
    
    var index:Int=1
    
    @IBOutlet weak var field: UILabel!
    
    func randomAlphaString(length: Int) -> String {
        let allowedChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let allowedCharsCount = UInt32(allowedChars.characters.count)
        var randomString = ""
        
        for _ in 0..<length {
            let randomNum = Int(arc4random_uniform(allowedCharsCount))
            let randomIndex = allowedChars.index(allowedChars.startIndex, offsetBy: randomNum)
            let newCharacter = allowedChars[randomIndex]
            randomString += String(newCharacter)
        }
        
        return randomString
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        if let sameVC = segue.destinationViewController as? NextViewController{
            
            if self.index==6{
                // create the alert
                let alert2 = UIAlertController(title: "Vision:", message: "20/20", preferredStyle: UIAlertControllerStyle.alert)
                
                // add an action (button)
                alert2.addAction(UIAlertAction(title: "Return Home", style: UIAlertActionStyle.default, handler: { action in self.performSegue(withIdentifier: "backHome", sender: self) }))
                
                // show the alert
                self.present(alert2, animated: true, completion: nil)
            }
            
                sameVC.loadViewIfNeeded()
                sameVC.index = self.index + 1
                sameVC.field.text = "\(randomAlphaString(length: 1))"
                let size = 170 - CGFloat(sameVC.index*22)
                sameVC.field.font =  UIFont(name: "Arial", size: size)
        }
    }
    
    @IBAction func moveOn(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "samePage", sender: self)
    }
    
    @IBAction func failTapped(_ sender: AnyObject) {
        // create the alert
        let alert = UIAlertController(title: "Vision:", message: "20/\(80-(self.index*10))", preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "Return Home", style: UIAlertActionStyle.default, handler: { action in self.performSegue(withIdentifier: "backHome", sender: self) }))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
