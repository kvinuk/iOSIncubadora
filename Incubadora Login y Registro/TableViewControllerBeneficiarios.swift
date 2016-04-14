//
//  TableViewControllerBeneficiarios.swift
//  ListasProyecto
//
//  Created by Arturo Gzz on 4/4/16.
//  Copyright © 2016 Arturo Gzz. All rights reserved.
//

import UIKit
import Firebase

class TableViewControllerBeneficiarios: UITableViewController {
    
    var nomProyecto : String!
    var ref = Firebase(url:"https://resplendent-inferno-89.firebaseio.com/proyectos/")
    var refBeneficiarios = Firebase(url:"https://resplendent-inferno-89.firebaseio.com/proyectos/")
    
    var beneficiarios = [String]()
    var edades = [String]()
    var numBeneficiarios : Int = 0
    
    @IBAction func guardar(sender: AnyObject) {
        print("guardar")
    }
    
    @IBAction func agregar(sender: AnyObject) {
        let alert = UIAlertController(title: "Nombre del beneficiario y edad", message: "", preferredStyle: .Alert)
        
        alert.addTextFieldWithConfigurationHandler({ (textField) -> Void in
            textField.text = ""
        })
        
        alert.addTextFieldWithConfigurationHandler({ (textField) -> Void in
            textField.text = ""
        })
        alert.addAction(UIAlertAction(title: "Guardar", style: .Default, handler: { (action) -> Void in
            let textField = alert.textFields![0] as UITextField
            let textField2 = alert.textFields![1] as UITextField
            let BeneficiarioNuevo = [textField.text!: textField2.text!]
            self.refBeneficiarios.updateChildValues(BeneficiarioNuevo)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
        beneficiarios = []
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refBeneficiarios = ref.childByAppendingPath("\(nomProyecto)" + "/beneficiarios")
        print(String(refBeneficiarios))
        refBeneficiarios.observeEventType(.Value, withBlock: { snapshot in
            let enumerator = snapshot.children
            self.numBeneficiarios = Int(snapshot.childrenCount)
            while let rest = enumerator.nextObject() as? FDataSnapshot {
                self.beneficiarios.append(String(rest.key))
                self.edades.append(String(rest.value))
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
        self.title = "Beneficiarios"
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return beneficiarios.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CeldaBeneficiario", forIndexPath: indexPath) as! TableViewCellBeneficiarios
        
        cell.nombreLabel?.text = beneficiarios[indexPath.row]
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
