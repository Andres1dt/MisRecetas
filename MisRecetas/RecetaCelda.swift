//
//  RecetaCelda.swift
//  MisRecetas
//
//  Created by Andres on 7/10/17.
//  Copyright © 2017 DstApp. All rights reserved.
//

import UIKit

class RecetaCelda: UITableViewCell {

    
    @IBOutlet var CellImageView: UIImageView!
    @IBOutlet var LblNombreReceta: UILabel!
    @IBOutlet var LblTiempoCoccion: UILabel!
    @IBOutlet var LblIngredientes: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
