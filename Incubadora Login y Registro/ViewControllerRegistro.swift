//
//  ViewControllerRegistro.swift
//  Incubadora Login y Registro
//
//  Created by Axel Ramirez on 4/4/16.
//  Copyright © 2016 Axel Ramirez. All rights reserved.
//

import UIKit
import Firebase

class ViewControllerRegistro: UIViewController {
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtRepitepw: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func RegistrarCuenta(sender: AnyObject) {
        //Declaramos las variables
        let sEmail = txtEmail.text
        let sPassword = txtPassword.text
        let sRepitepw = txtRepitepw.text
        
        //Revisamos si hay campos en blanco
        //Nota: Revisar por que marca error con == nil   --Axel
        
        if(sEmail == "" || sPassword == "" || sRepitepw == ""){
            //Mostramos una alerta
            MostrarAlerta()
        }
        
        //Revisamos si las contrasenias coninciden
        
        if(sPassword != sRepitepw){
            //Mostramos una alerta
            MostrarAlerta()
        }
        
        //Guardamos los datos de la nueva cuenta
        //Nota: Debemos de buscar en que base de datos vamos a guardar esta info.
        
        if(sPassword == sRepitepw){
            let ref = Firebase(url: "https://resplendent-inferno-89.firebaseio.com")
            ref.createUser(sEmail, password: sPassword,
                withValueCompletionBlock: { error, result in
                
                    if error != nil {
                        self.MostrarAlerta()
                    } else {
                        let uid = result["uid"] as? String
                        print("Successfully created user account with uid: \(uid)")
                    }
            })
        }
        
        //Mostrar Alerta de confirmacion
        AlertaConfirmacion()
    }
    
    @IBAction func quitaTeclado(){
        
        self.view.endEditing(true)
    }

    func MostrarAlerta(){
        let alerta = UIAlertController(title: "Advertencia", message: "Los datos son incorrectos.", preferredStyle: UIAlertControllerStyle.Alert)
        
        alerta.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        
        presentViewController(alerta, animated: true, completion: nil)
        
        
    }
    
    func AlertaConfirmacion(){
        let alerta = UIAlertController(title: "Registro exitoso.", message: "Sus datos se han guardado con éxito.", preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default){
            action in self.dismissViewControllerAnimated(true, completion: nil)
        }
        alerta.addAction(okAction)
        self.presentViewController(alerta, animated: true, completion: nil)
        

        
        
    }


}
