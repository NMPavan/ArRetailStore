//
//  ProductDescriptionController.swift
//  ArRetailStore
//
//  Created by eClerx_Digital on 12/03/20.
//  Copyright © 2020 eClerx_Digital. All rights reserved.
//

import UIKit

class ProductDescriptionController: UISliderNavigationController {
    
   
    //var listObject  = jsonBasedModel.self
   var selectedPost: ProductModel!
    
 
    
    
    @IBOutlet weak var ProductName: UILabel!
    @IBOutlet weak var ProductPrice: UILabel!
    @IBOutlet weak var ProductImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ProductName.text = selectedPost.ProductName
        self.ProductImage.image = UIImage(named: selectedPost.ProductImage)
        self.ProductPrice.text = selectedPost.ProductPrice
        title = selectedPost.ProductName
     
     
       

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func ScallingWindow(_ sender: Any) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "Scalling") as? Scalling360ViewModel
        self.navigationController?.pushViewController(vc!, animated: true)
        print("it is inside scenekit")
        
    }
    
    
    @IBAction func ThreeDView(_ sender: Any) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SceneKit") as? SceneViewController
        vc?.selectedPost = selectedPost
                     self.navigationController?.pushViewController(vc!, animated: true)
                     print("it is inside scenekit")
    }
    
    
    @IBAction func RotationWindow(_ sender: Any) {
      
               
               
    }
    
    
    @IBAction func SceneView(_ sender: Any) {
        
       
        
        
        
    }
    
    

}
