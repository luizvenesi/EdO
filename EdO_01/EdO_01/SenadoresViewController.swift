//
//  SenadoresViewController.swift
//  EdO_01
//
//  Created by Luiz on 2017-09-28.
//  Copyright © 2017 Luiz Venesi. All rights reserved.
//

import UIKit

class SenadoresViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var myIndex = 0
    var senadorImage = ["http://www.senado.gov.br/senadores/img/fotos-oficiais/senador4981.jpg","http://www.senado.gov.br/senadores/img/fotos-oficiais/senador5140.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador945.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador4988.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador4697.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador5529.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador3.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador715.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador5164.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador3823.jpg" ]
    var senadorID = ["4981", "5140", "391", "4988", "4697", "5529", "3","715", "5164", "3823"]
    let senadorName = ["Acir Gurgacz", "Airton Sandoval", "Alvaro Dias","Ana Amélia", "Ângela Portela", "Antonio Anastasia", "Antonio Carlos Valadares", "Armando Monteiro", "Ataídes Oliveira", "Benedito de Lira"]
    
    
    
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
            let secondVC = segue.destination as! SenadorViewController
            secondVC.senadorNumber = senadorID[myIndex]
            secondVC.senadorImage = senadorImage[myIndex]
        }
    }
    
}



