//
//  SenadorGastosMesViewController.swift
//  EdO_01
//
//  Created by Luiz on 2017-10-01.
//  Copyright © 2017 Luiz Venesi. All rights reserved.
//

import UIKit

class SenadorGastosMesViewController: UIViewController {

    @IBOutlet weak var senadorNome: UILabel!
    @IBOutlet weak var ano: UILabel!
    @IBOutlet weak var despesa: UILabel!
    @IBOutlet weak var janeiro: UILabel!
    @IBOutlet weak var fevereiro: UILabel!
    @IBOutlet weak var marco: UILabel!
    @IBOutlet weak var abril: UILabel!
    @IBOutlet weak var maio: UILabel!
    @IBOutlet weak var junho: UILabel!
    @IBOutlet weak var julho: UILabel!
    @IBOutlet weak var agosto: UILabel!
    @IBOutlet weak var setembro: UILabel!
    @IBOutlet weak var outubro: UILabel!
    @IBOutlet weak var novembro: UILabel!
    @IBOutlet weak var dezembro: UILabel!
    
    
    var senadorNumberGM = ""
    var tipoDespesa = 3
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDataWebSite()
        //senadorNome.text = senadorNumberGM
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func loadDataWebSite(){
        //Load Data Website
        
        
        
      

        //Name
        let data = NSData(contentsOf: NSURL(string: "http://www6g.senado.leg.br/transparencia/sen/\(senadorNumberGM)/?ano=2017")! as URL)
        let tutorialsParser = TFHpple(htmlData: data as Data!)
        let tutorialsXPathStringName = "//div[@class=\"span8 margin_ajust\"]/h1/span"
        let tutorialNodes = tutorialsParser?.search(withXPathQuery: tutorialsXPathStringName) as AnyObject! as! NSArray
        
        //Nome Despesa
        let data1 = NSData(contentsOf: NSURL(string: "http://www6g.senado.leg.br/transparencia/sen/\(senadorNumberGM)/ceaps/\(tipoDespesa)/?ano=2017")! as URL)
        let tutorialsParser1 = TFHpple(htmlData: data1 as Data!)
        let tutorialsXPathStringDespesa = "//div[@id=\"conteudo_transparencia\"]/h1[@class=\"sen-conteudo-interno\"]"
        let tutorialNodesDespesa = tutorialsParser1?.search(withXPathQuery: tutorialsXPathStringDespesa) as AnyObject! as! NSArray
        
        //Despesas mes
        
        let tutorialsXPathStringMes = "//div[@id=\"conteudo_transparencia\"]/div/div/div/table/tbody/tr/td[@class=\"valor\"]/a/span"
        let tutorialNodesMes = tutorialsParser1?.search(withXPathQuery: tutorialsXPathStringMes) as AnyObject! as! NSArray
        
        
        if(tutorialNodes.count == 0)
        {
            print("empty here")
        }
        else
        {
            
            for element in tutorialNodes
            {
                let elementTwo: TFHppleElement = element as! TFHppleElement
                senadorNome.text = elementTwo.content
                
                
            }
            for element in tutorialNodesDespesa
            {
                let elementTwo: TFHppleElement = element as! TFHppleElement
                despesa.text = elementTwo.content
                
                
            }
           
            for (index, element) in tutorialNodesMes.enumerated()
            {
                
                let elementTwo: TFHppleElement = element as! TFHppleElement
                
                if index == 0 {
                    janeiro.text = "R$ " + elementTwo.content
                    
                }
                if index == 1 {
                    fevereiro.text = "R$ " + elementTwo.content
                    
                }
                if index == 2 {
                    marco.text = "R$ " + elementTwo.content
                    
                }
                if index == 3 {
                    abril.text = "R$ " + elementTwo.content
                    
                }
                if index == 4 {
                    maio.text = "R$ " + elementTwo.content
                    
                }
                if index == 5 {
                    junho.text = "R$ " + elementTwo.content
                    
                }
                if index == 6 {
                    julho.text = "R$ " + elementTwo.content
                    
                }
                if index == 7 {
                    agosto.text = "R$ " + elementTwo.content
                    
                }
                if index == 8 {
                    setembro.text = "R$ " + elementTwo.content
                    
                }
                if index == 9 {
                    outubro.text = "R$ " + elementTwo.content
                    
                }
                if index == 10 {
                    novembro.text = "R$ " + elementTwo.content
                    
                }
                
                if index == 11 {
                    dezembro.text = "R$ " + elementTwo.content
                    
                }
                
            }
            
       }
    }
}
