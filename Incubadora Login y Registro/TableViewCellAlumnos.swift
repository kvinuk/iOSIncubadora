//
//  TableViewCellAlumnos.swift
//  ListasProyecto
//
//  Created by Arturo Gzz on 4/4/16.
//  Copyright © 2016 Arturo Gzz. All rights reserved.
//

import UIKit

class TableViewCellAlumnos: UITableViewCell {

    @IBOutlet weak var nombreLabel : UILabel!
    @IBOutlet weak var matriculaLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
