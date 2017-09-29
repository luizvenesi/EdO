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
    var senadorImage = ["http://www.senado.gov.br/senadores/img/fotos-oficiais/senador4981.jpg","http://www.senado.gov.br/senadores/img/fotos-oficiais/senador5140.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador945.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador4988.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador4697.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador5529.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador3.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador715.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador5164.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador3823.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador5197.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador5108.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador739.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador3398.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador5132.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador5537.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador3830.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador16.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador4721.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador4994.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador4767.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador5531.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador612.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador3713.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador5540.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador4525.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador3634.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador87.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador4558.jpg","http://www.senado.gov.br/senadores/img/fotos-oficiais/senador5006.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador5100.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador5008.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador5004.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador35.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador950.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador3394.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador4990.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador40.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador3361.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador5112.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador615.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador90.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador1249.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador5533.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador4575.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador3695.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador643.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador631.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador61023.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador5000.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador5525.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador5523.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador3741.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador825.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador374.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador5116.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador2207.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador5012.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador5182.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador5236.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador70.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador635.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador5052.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador72.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador677.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador5322.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador73.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador456.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador2331.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador4560.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador5527.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador3396.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador5535.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador3372.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador558.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador4763.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador1176.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador1173.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador5070.jpg", "http://www.senado.gov.br/senadores/img/fotos-oficiais/senador5144.jpg"]
    
    var senadorID = ["4981", "5140", "391", "4988", "4697", "5529", "3","715", "5164", "3823", "5197", "5108", "739", "3398", "5132", "5537", "3830", "16", "4721", "4994", "4767", "5531", "612", "3713", "5540", "4525", "3634", "87", "4558", "5006", "5100", "5008", "5004", "35", "950", "3394", "4990", "40", "3361", "5112", "615", "90", "1249", "5533", "4575", "3695", "643", "631", "1023", "5000", "5525", "5523", "3741", "825", "374", "5116", "2207", "5012", "5182", "5236", "70", "635", "5052", "72", "677", "5322", "73", "456", "2331", "4560", "5527", "3396", "5535", "3372", "558", "4763", "1176", "1173", "5070", "5144"]
    
    let senadorName = ["Acir Gurgacz", "Airton Sandoval", "Alvaro Dias","Ana Amélia", "Ângela Portela", "Antonio Anastasia", "Antonio Carlos Valadares", "Armando Monteiro", "Ataídes Oliveira", "Benedito de Lira", "Cássio Cunha Lima", "Cidinho Santos", "Ciro Nogueira", "Cristovam Buarque", "Dalirio Beber", "Dário Berger", "Davi Alcolumbre", "Edison Lobão", "Eduardo Amorim", "Eduardo Braga", "Eduardo Lopes", "Elmano Férrer", "Eunício Oliveira", "Fátima Bezerra", "Fernando Bezerra Coelho", "Fernando Collor", "Flexa Ribeiro", "Garibaldi Alves Filho", "Gladson Cameli", "Gleisi Hoffmann", "Hélio José", "Humberto Costa", "Ivo Cassol", "Jader Barbalho", "João Alberto Souza", "João Capiberibe", "Jorge Viana", "José Agripino", "José Maranhão", "José Medeiros", "José Pimentel", "José Serra", "Kátia Abreu", "Lasier Martins", "Lídice da Mata", "Lindbergh Farias", "Lúcia Vânia", "Magno Malta", "Maria do Carmo Alves", "Marta Suplicy", "Omar Aziz", "Otto Alencar", "Paulo Bauer", "Paulo Paim", "Paulo Rocha", "Pedro Chaves", "Raimundo Lira", "Randolfe Rodrigues", "Regina Sousa", "Reguffe", "Renan Calheiros", "Ricardo Ferraço", "Roberto Muniz", "Roberto Requião", "Roberto Rocha", "Romário", "Romero Jucá", "Ronaldo Caiado", "Rose de Freitas", "Sérgio Petecão", "Simone Tebet", "Tasso Jereissati", "Telmário Mota", "Valdir Raupp", "Vanessa Grazziotin", "Vicentinho Alves", "Waldemir Moka", "Waldemir Moka", "Wilder Morais", "Zeze Perrella" ]
    
    
    
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



