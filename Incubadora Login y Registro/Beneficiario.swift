//
//  Beneficiario.swift
//  ListasProyecto
//
//  Created by Arturo Gzz on 4/4/16.
//  Copyright © 2016 Arturo Gzz. All rights reserved.
//

import UIKit

class Beneficiario: NSObject {
    
    var nombre : String = ""
    var edad : Int = 0
    
    init(nom : String, ed : Int) {
        nombre = nom
        edad = ed
    }

}
