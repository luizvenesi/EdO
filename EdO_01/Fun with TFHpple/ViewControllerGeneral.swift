//
//  ViewControllerGeneral.swift
//  Fun with TFHpple
//
//  Created by Luiz on 2017-09-28.
//  Copyright © 2017 Epic Loot. All rights reserved.
//

import UIKit

class ViewControllerGeneral: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    
    var myIndex = 0
    var senadorImage = ["http://www.senado.gov.br/senadores/img/fotos-oficiais/senador4981.jpg","http://www.senado.gov.br/senadores/img/fotos-oficiais/senador5140.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador945.jpg"]
    var senadorID = ["4981", "5140", "391"]
    let senadorName = ["Acir Gurgacz", "Airton Sandoval", "Alvaro Dias"]
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return(senadorName.count)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = senadorName[indexPath.row]
        return(cell)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "goToSenador", sender: self)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSenador" {
            let secondVC = segue.destination as! ViewController
            secondVC.senadorNumber = senadorID[myIndex]
            secondVC.senadorImage = senadorImage[myIndex]
        }
    }

}


