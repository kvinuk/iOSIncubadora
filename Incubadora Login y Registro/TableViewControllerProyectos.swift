//
//  TableViewControllerProyectos.swift
//  Incubadora Login y Registro
//
//  Created by Arturo Gzz on 4/11/16.
//  Copyright © 2016 Axel Ramirez. All rights reserved.
//

import UIKit
import Firebase


class TableViewControllerProyectos: UITableViewController {
    
    var ref = Firebase(url:"https://resplendent-inferno-89.firebaseio.com/proyectos")
    var nombre : String = ""
    var proyectos = [String]()
    var numProyectos : Int = 0
    let datos = ["alumnos": "", "beneficiarios": ""]
    let beneficiarios = ["beneficiarios": ""]
    
    //--------Funcion para agregar proyecto---------------
    @IBAction func agregarProyecto(sender: AnyObject) {
        let alert = UIAlertController(title: "Escribe el nombre del nuevo proyecto", message: "", preferredStyle: .Alert)
        
        alert.addTextFieldWithConfigurationHandler({ (textField) -> Void in
            textField.text = ""
        })
        alert.addAction(UIAlertAction(title: "Guardar", style: .Default, handler: { (action) -> Void in
            let textField = alert.textFields![0] as UITextField
            //print(textField.text!)
            let nuevoProyecto = [textField.text!: self.datos]
            self.ref.updateChildValues(nuevoProyecto)
        }))
        proyectos = []
        self.presentViewController(alert, animated: true, completion: nil)
    }
    //-------------------------------Fin de funcion de agregar proyecto ---------------
    
    
    
    @IBAction func reload(sender: AnyObject) {
        self.tableView.reloadData()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        ref.observeEventType(.Value, withBlock: { snapshot in
            self.numProyectos = Int(snapshot.childrenCount)
            let enumerator = snapshot.children
            while let rest = enumerator.nextObject() as? FDataSnapshot {
                self.proyectos.append(rest.key)
                //print(rest.value)
                self.tableView.reloadData()
            }            }, withCancelBlock: { error in
                print(error.description)
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return numProyectos
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("celdaProyectos", forIndexPath: indexPath)

        // Configure the cell...
        cell.textLabel?.text = proyectos[indexPath.row]
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "proyecto"
        {
            let view = segue.destinationViewController as! ViewControllerListas
            let indexPath = tableView.indexPathForSelectedRow
            view.nomProyecto = proyectos[indexPath!.row]
        }
        
    }

    
    
}
