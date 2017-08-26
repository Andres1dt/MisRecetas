//
//  ViewController.swift
//  MisRecetas
//
//  Created by Andres on 7/7/17.
//  Copyright © 2017 DstApp. All rights reserved.
//

import UIKit

class ViewController: UITableViewController{
 
    var recetas : [Receta] = []
    
    @IBOutlet var tblListadoRecetas: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.hidesBarsOnSwipe = true
        navigationItem.backBarButtonItem = UIBarButtonItem (title: "", style: .plain, target: nil, action: nil)
        
        var receta = Receta(nombreReceta: "Quesadillas el cuñao", imagen: #imageLiteral(resourceName: "quesadilla"), tiempo : 20, ingredientes:  ["Tortillas", "Queso", "Chorizo", "Quisados","Cebolla", "Chorizo", "Chile Jalapeño", "Salsa"], pasos: ["Hacer la tortilla", "Poner el queso y el chorizo en la tortilla", "cocinar la quesadillas"])
        recetas.append(receta)
        
        receta = Receta(nombreReceta: "Corte de Res", imagen: #imageLiteral(resourceName: "meat"), tiempo : 20, ingredientes:  ["1.- 4 pzas. Corte New York", "2.- 2 pzas. Papas laminadas", "3.- 1 barra Mantequilla", "4.- ½ taza Vino blanco","5.- Cebolla", "6.- Pimienta triturada (al gusto)", "7.- Sal (al gusto)", "8.- Papel aluminio"], pasos: ["1.- Salpimentar los cortes de New York.", "2.- Llevar los cortes a la plancha o al grill por un espacio de 15 minutos aproximadamente.", "3.- En un recipiente para hornear, colocar una cama de papas, agregar sal, pimienta, tomillo y un poco de mantequilla.", "4.- Agregar el vino blanco y cubrir con papel aluminio.", "5.- Hornear a 18ºC por 20 minutos aproximadamente."])
        recetas.append(receta)
        
        receta = Receta(nombreReceta: "Pastel de Queso", imagen: #imageLiteral(resourceName: "pastelQueso"), tiempo: 120, ingredientes :["Queso", "Harina", "Huevos", "Leche", "Galleta", "Crema Carnation"], pasos: ["Revolver todo", "Moldear", "Hornear"])
        recetas.append(receta)
        
        receta = Receta(nombreReceta: "Pizza al pastor", imagen: #imageLiteral(resourceName: "pizza"), tiempo: 30, ingredientes :["Pan", "Queso", "Jamon", "Chorizo", "Cebolla", "Chiles Jalapaños", "Salsa"], pasos: ["Echar la salsa en el pan", "Hornear"])
        recetas.append(receta)
        
        receta = Receta(nombreReceta: "Caldo de pollo con verduras", imagen: #imageLiteral(resourceName: "caldoPollo") , tiempo :60, ingredientes: ["Pollo", "Agua", "Sal", "Verduras"], pasos: ["Lavar el pollo", "Hervir el pollo en el agua", "echar verduras y sal"])
        recetas.append(receta)
        self.tblListadoRecetas.backgroundColor = UIColor(red:0.98, green:0.97, blue:0.71, alpha:1.0)
        self.tblListadoRecetas.tableFooterView = UIView(frame: CGRect.zero)
        self.tblListadoRecetas.separatorColor =  UIColor(red: 0.9, green: 0.9, blue:0.9, alpha: 0.25)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
       return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recetas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let receta = recetas[indexPath.row]
            let cellID = "RecetaCelda"
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! RecetaCelda
            cell.backgroundColor = UIColor(red:1.00, green:0.98, blue:0.56, alpha:1.0)
            cell.LblNombreReceta.text = receta.nombreReceta
            cell.CellImageView.image = receta.imagen
            cell.LblTiempoCoccion.text = "\(receta.tiempoCoccion!) min."
            cell.LblIngredientes.text = "Ingredientes: \(receta.ingredientes.count)"
            cell.CellImageView.layer.cornerRadius = 45.0
            cell.CellImageView.clipsToBounds = true
          
            return cell
      }
    
    //DAR LIKE, ME ENCANTA, O MIS FAVORITOS
    override func  tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
//        let receta = self.recetas[indexPath.row]
//        let alertController = UIAlertController(title: receta.nombreReceta, message: "Valora este plato", preferredStyle : .actionSheet)
//        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
//        alertController.addAction(cancelAction)
//        var TituloMeEncanta = "Me encanta"
//        var favoritoEstilo = UIAlertActionStyle.default
//        if receta.favorita{
//            TituloMeEncanta = "Ya no me encanta"
//            favoritoEstilo = UIAlertActionStyle.destructive
//        }
//        
//        let favoriteAction = UIAlertAction(title : TituloMeEncanta, style: favoritoEstilo ){(action) in
//            let receta = self.recetas [indexPath.row]
//            receta.favorita =  !receta.favorita
//            self.tableView.reloadData()
//        }
//        alertController.addAction(favoriteAction)
//        
//        
//        self.present(alertController, animated: true, completion: nil)
    }
     //ELIMINAR RECETA
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.recetas.remove(at: indexPath.row)
        }
        self.tableView.deleteRows(at: [indexPath], with: .middle)
    }
    
    //COMPARTIR EN REDES SOCIALES
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
       
        //COMPARTIR
        let compartirAccion = UITableViewRowAction(style: .default, title: "Compartir"){ (action, indexPath) in
        let shareDefualtText = "Estoy mirando la receta de \(self.recetas[indexPath.row].nombreReceta!) en la App del curso de iOS 10 con Juan Gabriel"
        
            let activityController = UIActivityViewController(activityItems : [shareDefualtText, self.recetas[indexPath.row].imagen!], applicationActivities : nil)
            self.present(activityController, animated: true, completion: nil)
        }
        compartirAccion.backgroundColor = UIColor(red:30.0/255.0, green: 164.0/255.0, blue: 253.0/255.0, alpha:1.0)
        
        //ELIMINAR
        let deleteAction = UITableViewRowAction(style: .default, title: "Borrar"){( action, indexPath) in
            self.recetas.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .middle)
        }
        deleteAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 202.0/255.0, alpha:1.0)
        return [compartirAccion, deleteAction]
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowMostrarDetalle"{
            if let indexPath = self.tableView.indexPathForSelectedRow{
                let RecetaSeleccionada = self.recetas[indexPath.row]
                let destinationViewController = segue.destination as! DetalleRecetaController
                destinationViewController.receta = RecetaSeleccionada
            }
        }
    }
}
















