//
//  Review.swift
//  MisRecetas
//
//  Created by Andres on 8/20/17.
//  Copyright © 2017 DstApp. All rights reserved.
//

import UIKit

class Review: UIViewController {
    var ratingSelected : String?
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var Imagenfondo: UIImageView!
    @IBOutlet var firstButton: UIButton!
    @IBOutlet var secondButton: UIButton!
    @IBOutlet var thirdButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let blurEffect  = UIBlurEffect(style : .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        Imagenfondo.addSubview(blurEffectView)
        let scale = CGAffineTransform(scaleX: 0.0, y: 0.0)
        let translation = CGAffineTransform(translationX: 0.0, y: 500.0)
        
        self.firstButton.transform = scale.concatenating(translation)
        self.secondButton.transform = scale.concatenating(translation)
        self.thirdButton.transform = scale.concatenating(translation)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
            self.firstButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: { (success) in
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
                self.secondButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }, completion: { (success) in
                UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
                    self.thirdButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                }, completion: nil)
            })
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    override var prefersStatusBarHidden: Bool {
        return true
    }

   
    @IBAction func SeleccionReaccion(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            ratingSelected = "dislike"
        case 2:
            ratingSelected = "good"
        case 3:
            ratingSelected = "great"
        default:
            break
        }

        performSegue(withIdentifier: "unwindToDetailView", sender: sender)
    }
    
}






