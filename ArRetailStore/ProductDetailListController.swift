//
//  ProductDetailListController.swift
//  ArRetailStore
//
//  Created by eClerx_Digital on 12/03/20.
//  Copyright © 2020 eClerx_Digital. All rights reserved.
//

import UIKit

class ProductDetailListController: UISliderNavigationController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var Tableview: UITableView!
    var productModel1 : [ProductModel] = []
   var list = [jsonBasedModel]()
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productModel1.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Tableview.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as! DetailTableViewCell
        
        cell.DeatilProductName?.text = productModel1[indexPath.row].ProductName
       
        cell.DeatilProductImage?.image = UIImage(named: productModel1[indexPath.row].ProductImage)
//        print(list[indexPath.row])
        
   
        
        
        return cell
    }
    
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProductdescriptionController") as? ProductDescriptionController
        vc!.selectedPost = productModel1[indexPath.row]
        
        let navController2 = UINavigationController(rootViewController: vc!)
        navController2.modalPresentationStyle = .fullScreen

         self.present(navController2, animated: true, completion:nil)
    }
   

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
     
    }
    
    
    

    

    

}

