//
//  ViewController.swift
//  iDoctor2
//
//  Created by Maggie Wu on 1/27/18.
//
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func visionPressed(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "goToNext", sender: self)
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

