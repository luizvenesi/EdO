//
//  TableViewCell.swift
//  EdO_01
//
//  Created by Luiz on 2017-09-30.
//  Copyright © 2017 Luiz Venesi. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelCustom: UILabel!
    @IBOutlet weak var imageCellText: UILabel!
    @IBOutlet weak var imageCustom: UIImageView!
    @IBOutlet weak var total2017: UILabel!
    @IBOutlet weak var senadorID: UILabel!
    @IBOutlet weak var senadorPartido: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    var senadorNumber = ""
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        //Convert URL in Image
        get_image(String(imageCellText.text!), imageCustom)
        //load DataWebSite
        loadDataWebSite()
        //Hide Info ID and Name
        senadorID.isHidden = true
        imageCellText.isHidden = true
    }
    
    func loadDataWebSite(){
        //Load Data Website
        
       //Load ID value
       senadorNumber = String(senadorID.text!)
        //External URL
        let data = NSData(contentsOf: NSURL(string: "http://www6g.senado.leg.br/transparencia/sen/\(senadorNumber)/?ano=2017")! as URL)
        let tutorialsParser = TFHpple(htmlData: data as Data!)
        //Total 2017
        let tutorialsXPathString = "//div[@id=\"collapse-ceaps\"]/div/table/tfoot/tr/td[@class=\"valor\"]"
        let tutorialNodes1 = tutorialsParser?.search(withXPathQuery: tutorialsXPathString) as AnyObject! as! NSArray
            for element in tutorialNodes1
            {
                let elementTwo: TFHppleElement = element as! TFHppleElement
                total2017.text = "R$ " + elementTwo.content
            }
    }

    
    //Func Convert URL in Image
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
                        UIView.animate(withDuration: 0.5, animations: {
                            imageView.alpha = 1.0
                        })
                    })
                }
            }
        })
        task.resume()
    }
}
