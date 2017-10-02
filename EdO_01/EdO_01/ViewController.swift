//
//  ViewController.swift
//  EdO_01
//
//  Created by Luiz on 2017-09-28.
//  Copyright © 2017 Luiz Venesi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var senadoresButtom: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
            
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func senadoresTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "goToSenadores", sender: self)
    }
}

