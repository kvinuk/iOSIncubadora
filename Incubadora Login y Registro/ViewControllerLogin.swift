//
//  ViewControllerLogin.swift
//  Incubadora Login y Registro
//
//  Created by Axel Ramirez on 4/4/16.
//  Copyright © 2016 Axel Ramirez. All rights reserved.
//Hola amigos

import UIKit
import Firebase

class ViewControllerLogin: UIViewController {
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet var cargando: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func quitaTeclado(){
        
        self.view.endEditing(true)
    }
    
    @IBAction func IniciarSesion(sender: AnyObject) {
        cargando.startAnimating()
        let sCorreo = txtEmail.text
        let sPassword = txtPassword.text
        let ref = Firebase(url: "https://resplendent-inferno-89.firebaseio.com")
        
        ref.authUser(sCorreo, password: sPassword,
            withCompletionBlock: { error, authData in
                
                if error != nil {
                    // There was an error logging in to this account
                    self.cargando.stopAnimating()
                    self.AlertaLogin()
                } else {
                    // We are now logged in
                    self.performSegueWithIdentifier("logIn", sender: self)
                }
        })
        
    }
    
    
    func AlertaLogin(){
        let alerta = UIAlertController(title: "Error al iniciar sesion.", message: "El email o password no coinciden.", preferredStyle: UIAlertControllerStyle.Alert)
        
        alerta.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        
        presentViewController(alerta, animated: true, completion: nil)
        
    }
    
    func Alerta2(){
        let alerta = UIAlertController(title: "TEST", message: "INICIO EXITOSO", preferredStyle: UIAlertControllerStyle.Alert)
        
        alerta.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        
        presentViewController(alerta, animated: true, completion: nil)
        
        
    }
    
    
}


