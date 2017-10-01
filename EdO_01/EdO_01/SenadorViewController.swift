//
//  SenadorViewController.swift
//  EdO_01
//
//  Created by Luiz on 2017-09-28.
//  Copyright © 2017 Luiz Venesi. All rights reserved.
//

import UIKit

class SenadorViewController: UIViewController {

    @IBOutlet weak var senadorNome: UILabel!
    @IBOutlet weak var imageSenador: UIImageView!
    @IBOutlet weak var total2017: UILabel!
    @IBOutlet weak var total2016: UILabel!
    @IBOutlet weak var senadorID: UILabel!
    @IBOutlet weak var dValeu1: UILabel!
    @IBOutlet weak var dValeu2: UILabel!
    @IBOutlet weak var dValeu3: UILabel!
    @IBOutlet weak var dValeu4: UILabel!
    @IBOutlet weak var dValue5: UILabel!
    @IBOutlet weak var dValue6: UILabel!
    @IBOutlet weak var dValue7: UILabel!
    
    var myIndex = 0
    var senadorNumber = ""
    var senadorImage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        get_image(senadorImage, imageSenador)
        loadDataWebSite()
        senadorID.text = "ID do Senador \(senadorNumber)"
        senadorID.text = senadorNumber
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(userDidTapLabel(tapGestureRecognizer:)))
        dValeu1.isUserInteractionEnabled = true
        dValeu1.addGestureRecognizer(tapGesture)
       
       
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
        
    
        
   
   
    @objc func userDidTapLabel(tapGestureRecognizer: UITapGestureRecognizer) {
       
        performSegue(withIdentifier: "next", sender: self)
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "next" {
            let secondVC = segue.destination as! SenadorGastosMesViewController
            secondVC.senadorNumberGM = senadorNumber
          
        }
    }

    //Function Load Image
    func get_image(_ url_str:String, _ imageView:UIImageView)
    {
        
        let url:URL = URL(string: url_str)!
        let session = URLSession.shared
        
        let task = session.dataTask(with: url, completionHandler: {
            (
            data, response, error) in
            
            if data != nil
            {
                let image = UIImage(data: data!)
                
                if(image != nil)
                {
                    
                    DispatchQueue.main.async(execute: {
                        
                        imageView.image = image
                        imageView.alpha = 0
                        
                        UIView.animate(withDuration: 2.5, animations: {
                            imageView.alpha = 1.0
                        })
                        
                    })
                    
                }
                
            }
            
            
        })
        
        task.resume()
    }
    func loadDataWebSite(){
        //Load Data Website
        
        
        //Total 2016
        let data1 = NSData(contentsOf: NSURL(string: "http://www6g.senado.leg.br/transparencia/sen/\(senadorNumber)/?ano=2016")! as URL)
        let tutorialsParser1 = TFHpple(htmlData: data1 as Data!)
        let tutorialsXPathString2016 = "//div[@id=\"collapse-ceaps\"]/div/table/tfoot/tr/td[@class=\"valor\"]"
        
        
        let data = NSData(contentsOf: NSURL(string: "http://www6g.senado.leg.br/transparencia/sen/\(senadorNumber)/?ano=2017")! as URL)
        let tutorialsParser = TFHpple(htmlData: data as Data!)
        
        //Total 2017
        let tutorialsXPathString = "//div[@id=\"collapse-ceaps\"]/div/table/tfoot/tr/td[@class=\"valor\"]"
        //Name Senador
        let tutorialsXPathStringName = "//div[@class=\"span8 margin_ajust\"]/h1/span"
        
        //Details
        let tutorialsXPathStringDetails = "//div[@id=\"accordion-ceaps\"]/div/div/div/table/tbody/tr/td/a/span"
        
        
        //let tutorialsXPathString2016 = "//div[@id=\"collapse-ceaps\"]/div/table/tfoot/tr/td[@class=\"valor\"]"
        let tutorialNodes = tutorialsParser?.search(withXPathQuery: tutorialsXPathStringName) as AnyObject! as! NSArray
        let tutorialNodes1 = tutorialsParser?.search(withXPathQuery: tutorialsXPathString) as AnyObject! as! NSArray
        let tutorialNodes2016 = tutorialsParser1?.search(withXPathQuery: tutorialsXPathString2016) as AnyObject! as! NSArray
        let tutorialNodesDetails = tutorialsParser?.search(withXPathQuery: tutorialsXPathStringDetails) as AnyObject! as! NSArray
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
            for element in tutorialNodes1
            {
                let elementTwo: TFHppleElement = element as! TFHppleElement
                total2017.text = "R$ " + elementTwo.content
                
            }
            for element in tutorialNodes2016
            {
                let elementTwo: TFHppleElement = element as! TFHppleElement
                total2016.text = "R$ " + elementTwo.content
            }
            for (index, element) in tutorialNodesDetails.enumerated()
            {
                
                let elementTwo: TFHppleElement = element as! TFHppleElement
               
                if index == 0 {
                    dValeu1.text = "R$ " + elementTwo.content
                    
                }
                if index == 1 {
                    dValeu2.text = "R$ " + elementTwo.content
                    
                }
                if index == 2 {
                    dValeu3.text = "R$ " + elementTwo.content
                    
                }
                if index == 3 {
                    dValeu4.text = "R$ " + elementTwo.content
                    
                }
                if index == 4 {
                    dValue5.text = "R$ " + elementTwo.content
                    
                }
                if index == 5 {
                    dValue6.text = "R$ " + elementTwo.content
                    
                }
                if index == 6 {
                    dValue7.text = "R$ " + elementTwo.content
                    
                }
              
            }
            
        }
    }

}
