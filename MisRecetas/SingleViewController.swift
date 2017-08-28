//
//  SingleViewController.swift
//  MisRecetas
//
//  Created by Andres on 7/10/17.
//  Copyright © 2017 DstApp. All rights reserved.
//

import UIKit

class SingleViewController: UIViewController {

    var recetas : [Receta] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var receta = Receta(nombreReceta: "Quesadillas", imagen: #imageLiteral(resourceName: "quesadilla"), tiempo : 20, ingredientes:  ["Tortillas", "Queso", "Chorizo","Salsa"], pasos: ["Hacer la tortilla", "Poner el queso y el chorizo en la tortilla", "cocinar la quesadillas"])
        recetas.append(receta)
        
        receta = Receta(nombreReceta: "Pastel de Queso", imagen: #imageLiteral(resourceName: "pastelQueso"), tiempo: 120, ingredientes :["Queso", "Harina", "Huevos", "Leche"], pasos: ["Revolver todo", "Moldear", "Hornear"])
        recetas.append(receta)
        
        receta = Receta(nombreReceta: "Pizza al pastor", imagen: #imageLiteral(resourceName: "pizza"), tiempo: 30, ingredientes :["Pan", "Queso", "Jamon", "Chorizo", "Cebolla", "Chiles Jalapaños", "Salsa"], pasos: ["Echar la salsa en el pan", "poner el resto de los ingredientes sobre el pan con la salsa dejando al último al queso", "Hornear"])
        recetas.append(receta)
        
        receta = Receta(nombreReceta: "Caldo de pollo con verduras", imagen: #imageLiteral(resourceName: "caldoPollo") , tiempo :60, ingredientes: ["Pollo", "Agua", "Sal", "Verduras"], pasos: ["Lavar el pollo", "Hervir el pollo en el agua", "echar verduras y sal"])
        recetas.append(receta)
        
        
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}


extension SingleViewController :UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recetas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let receta = recetas[indexPath.row]
        let cellID = "RecetaCelda"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = receta.nombreReceta
        cell.imageView?.image = receta.imagen
        return cell
    }
}
