//
//  Alumno.swift
//  ListasProyecto
//
//  Created by Arturo Gzz on 4/4/16.
//  Copyright © 2016 Arturo Gzz. All rights reserved.
//  Arturo Gonzalez 

import UIKit

class Alumno: NSObject {
    
    var nombre : String = ""
    var matricula : Int = 0
    
    init(nom : String, mat : Int) {
        nombre = nom
        matricula = mat
    }

}
