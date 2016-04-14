//
//  TableViewControllerAlumnos.swift
//  ListasProyecto
//
//  Created by Arturo Gzz on 4/4/16.
//  Copyright © 2016 Arturo Gzz. All rights reserved.
//

import UIKit

class TableViewControllerAlumnos: UITableViewController {

    var listaAlumnos = [Alumno]()
    
    @IBAction func guardar(sender: AnyObject) {
        
        let alerta = UIAlertController(title: "Asistencia", message: "Hay 4 faltas", preferredStyle: UIAlertControllerStyle.Alert)
        alerta.addAction(UIAlertAction(title: "Guardar", style: UIAlertActionStyle.Cancel, handler: nil))
        presentViewController(alerta, animated: true, completion:  nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let a : Alumno = Alumno(nom: "Hector", mat: 1191385)
        let b : Alumno = Alumno(nom: "Arturo", mat: 1191385)
        let c : Alumno = Alumno(nom: "Juan", mat: 1191385)
        let x : Alumno = Alumno(nom: "Jose", mat: 1191385)
        let y : Alumno = Alumno(nom: "Gerardo", mat: 1191385)
        let z : Alumno = Alumno(nom: "Mario", mat: 1191385)
        listaAlumnos.append(a)
        listaAlumnos.append(b)
        listaAlumnos.append(c)
        listaAlumnos.append(x)
        listaAlumnos.append(y)
        listaAlumnos.append(z)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        self.title = "Alumnos Tec"
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listaAlumnos.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CeldaAlumno", forIndexPath: indexPath) as! TableViewCellAlumnos

        cell.nombreLabel?.text = listaAlumnos[indexPath.row].nombre + " - " + String(listaAlumnos[indexPath.row].matricula)
        //cell.textLabel?.frame.size.width = 5;

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
