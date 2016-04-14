//
//  ViewController.swift
//  Incubadora Login y Registro
//
//  Created by Axel Ramirez on 4/4/16.
//  Copyright © 2016 Axel Ramirez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        let login = NSUserDefaults.standardUserDefaults().boolForKey("Logged")
        
        if(!login){
        
        self.performSegueWithIdentifier("loginView", sender: self)
    }
    }

    @IBAction func cerrarSesion(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "Logged")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        self.performSegueWithIdentifier("loginView", sender: self)
        
    }

}

