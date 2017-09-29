//
//  ViewController.swift
//  Fun with TFHpple
//
//  Created by John Pavley on 5/21/16.
//  Copyright © 2016 Epic Loot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var catPictureURL: UIImageView!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var labelValor: UILabel!
    @IBOutlet weak var partido: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    @IBOutlet weak var senadorID: UILabel!
  
    var senadorNumber = ""
    var senadorImage = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Load Image
        get_image(senadorImage, catPictureURL)
        loadDataWebSite()
        senadorID.text = "ID do Senador \(senadorNumber)"
        senadorID.text = senadorNumber
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        
        //2016
        let data1 = NSData(contentsOf: NSURL(string: "http://www6g.senado.leg.br/transparencia/sen/\(senadorNumber)/?ano=2016")! as URL)
        let tutorialsParser1 = TFHpple(htmlData: data1 as Data!)
        let tutorialsXPathString2016 = "//div[@id=\"collapse-ceaps\"]/div/table/tfoot/tr/td[@class=\"valor\"]"
        
        
        let data = NSData(contentsOf: NSURL(string: "http://www6g.senado.leg.br/transparencia/sen/\(senadorNumber)/?ano=2017")! as URL)
        let tutorialsParser = TFHpple(htmlData: data as Data!)
        let tutorialsXPathString = "//div[@id=\"collapse-ceaps\"]/div/table/tfoot/tr/td[@class=\"valor\"]"
        let tutorialsXPathStringName = "//div[@class=\"span8 margin_ajust\"]/h1/span"
        let tutorialNodes = tutorialsParser?.search(withXPathQuery: tutorialsXPathStringName) as AnyObject! as! NSArray
        let tutorialNodes1 = tutorialsParser?.search(withXPathQuery: tutorialsXPathString) as AnyObject! as! NSArray
        let tutorialNodes2016 = tutorialsParser1?.search(withXPathQuery: tutorialsXPathString2016) as AnyObject! as! NSArray
        if(tutorialNodes.count == 0)
            {
                print("empty here")
            }
        else
        {
    
            for element in tutorialNodes
            {
                let elementTwo: TFHppleElement = element as! TFHppleElement
                labelValor.text = elementTwo.content
    
            }
            for element in tutorialNodes1
            {
                let elementTwo: TFHppleElement = element as! TFHppleElement
                label2.text = elementTwo.content
    
            }
            for element in tutorialNodes2016
            {
                let elementTwo: TFHppleElement = element as! TFHppleElement
                label3.text = elementTwo.content
                
            }
    
        }
    }
}


