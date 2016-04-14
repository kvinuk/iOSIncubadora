//
//  TableViewControllerBeneficiarios.swift
//  ListasProyecto
//
//  Created by Arturo Gzz on 4/4/16.
//  Copyright © 2016 Arturo Gzz. All rights reserved.
//

import UIKit

class TableViewControllerBeneficiarios: UITableViewController {

    var listaBeneficiarios = [Beneficiario]()
    
    @IBAction func guardar(sender: AnyObject) {
        
        let alerta = UIAlertController(title: "Asistencia", message: "Hay 4 faltas", preferredStyle: UIAlertControllerStyle.Alert)
        alerta.addAction(UIAlertAction(title: "Guardar", style: UIAlertActionStyle.Cancel, handler: nil))
        presentViewController(alerta, animated: true, completion:  nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let a : Beneficiario = Beneficiario(nom: "Hector", ed: 16)
        let b : Beneficiario = Beneficiario(nom: "Arturo", ed: 15)
        let c : Beneficiario = Beneficiario(nom: "Juan", ed: 14)
        let x : Beneficiario = Beneficiario(nom: "Jose", ed: 15)
        let y : Beneficiario = Beneficiario(nom: "Gerardo", ed: 14)
        let z : Beneficiario = Beneficiario(nom: "Mario", ed: 16)
        listaBeneficiarios.append(a)
        listaBeneficiarios.append(b)
        listaBeneficiarios.append(c)
        listaBeneficiarios.append(x)
        listaBeneficiarios.append(y)
        listaBeneficiarios.append(z)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        self.title = "Beneficiarios"
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listaBeneficiarios.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CeldaBeneficiario", forIndexPath: indexPath) as! TableViewCellBeneficiarios

        cell.nombreLabel?.text = listaBeneficiarios[indexPath.row].nombre + " - " + String(listaBeneficiarios[indexPath.row].edad)

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
