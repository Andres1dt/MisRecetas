//
//  DetalleRecetaController.swift
//  MisRecetas
//
//  Created by Andres on 8/26/17.
//  Copyright © 2017 DstApp. All rights reserved.
//

import UIKit

class DetalleRecetaController: UIViewController {
    
    @IBOutlet weak var tblReceta: UITableView!
    @IBOutlet weak var ImagenDetalle: UIImageView!
    @IBOutlet var ratingButton: UIButton!
    
    var receta: Receta!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     self.title = receta.nombreReceta
     self.ImagenDetalle.image = self.receta.imagen
     self.tblReceta.backgroundColor = UIColor(red:0.98, green:0.97, blue:0.71, alpha:1.0)
     self.tblReceta.tableFooterView = UIView(frame: CGRect.zero)
     self.tblReceta.separatorColor =  UIColor(red: 0.9, green: 0.9, blue:0.9, alpha: 0.25)
     self.tblReceta.estimatedRowHeight = 44.0
     self.tblReceta.rowHeight = UITableViewAutomaticDimension
     let image = UIImage(named: self.receta.rating)
     self.ratingButton.setImage(image, for: .normal)

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    @IBAction func close(segue: UIStoryboardSegue){
        
        if let reivewVC = segue.source as? Review {
            
            if let rating = reivewVC.ratingSelected {
                print(rating)
                self.receta.rating = rating
                let image = UIImage(named: self.receta.rating)
                self.ratingButton.setImage(image, for: .normal)
            }
            
        }
        
    }
   
}

extension DetalleRecetaController : UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return 2;
        case 1:
            return self.receta.ingredientes.count;
        case 2:
            return self.receta.pasos.count;
        default:
            return 0;
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IdCellPizza", for: indexPath) as! RecetaCeldaCompleta
        cell.backgroundColor = UIColor(red:1.00, green:0.98, blue:0.56, alpha:1.0)
        switch indexPath.section{
        case 0:
            switch indexPath.row{
            case 0:
                cell.lblKey.text = "Nombre: "
                cell.lblValue.text = self.receta.nombreReceta
                break;
            case 1:
                cell.lblKey.text = "Tiempo: "
                cell.lblValue.text = "\(self.receta.tiempoCoccion!) min."
                break;
           default:
                break;
            }
        case 1:
            if indexPath.row == 0 {
                cell.lblKey.text = "Ingredientes: "
            }
            else{
                cell.lblKey.text = ""
            }
            cell.lblValue.text = self.receta.ingredientes[indexPath.row]
            break;
        case 2:
            if indexPath.row == 0 {
                cell.lblKey.text = "Pasos: "
            }
            else{
                cell.lblKey.text = ""
            }

            cell.lblValue.text = self.receta.pasos[indexPath.row]
            break;
        default:
            break;
        }
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var titulo  = ""
        switch section {
        case 1:
            titulo = "INGREDIENTES";
            break;
        case 2:
            titulo = "PROCEDIMIENTO A SEGUIR";
            break;
        default:
            break;
        }
        return titulo;
    }
}

extension DetalleRecetaController : UITableViewDelegate{

}
