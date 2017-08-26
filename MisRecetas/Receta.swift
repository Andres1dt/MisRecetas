//
//  Receta.swift
//  MisRecetas
//
//  Created by Andres on 7/7/17.
//  Copyright © 2017 DstApp. All rights reserved.
//

import Foundation
import UIKit

class Receta : NSObject{

    var nombreReceta : String!
    var imagen : UIImage!
    var tiempoCoccion : Int!
    var ingredientes : [String]!
    var pasos: [String]!
    var rating : String = "rating"
    
    init(nombreReceta: String, imagen : UIImage, tiempo : Int, ingredientes :[String],pasos :[String]){
     self.nombreReceta = nombreReceta
     self.imagen = imagen
     self.tiempoCoccion = tiempo
     self.ingredientes = ingredientes
     self.pasos = pasos
        
        
    }
}
