//
//  ViewController.swift
//  ListasProyecto
//
//  Created by Arturo Gzz on 4/4/16.
//  Copyright © 2016 Arturo Gzz. All rights reserved.
//

import UIKit

class ViewControllerListas: UIViewController {
    
    var nomProyecto : String!
    
    @IBOutlet var btnAlumnos: UIButton!
    @IBOutlet var btnBeneficiarios: UIButton!

    @IBAction func cerrarSesion(sender: UIBarButtonItem) {
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "Logged")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        self.performSegueWithIdentifier("loginView", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = nomProyecto
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if sender as! UIButton == btnAlumnos
        {
            let view = segue.destinationViewController as! TableViewControllerAlumnos
            view.nomProyecto = self.nomProyecto
        
        }else if sender as! UIButton == btnBeneficiarios {
            let view = segue.destinationViewController as! TableViewControllerBeneficiarios
            view.nomProyecto = self.nomProyecto
        }
    }




}

