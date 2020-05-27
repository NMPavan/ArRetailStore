//
//  ViewController.swift
//  ArRetailStore
//
//  Created by eClerx_Digital on 11/03/20.
//  Copyright © 2020 eClerx_Digital. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource  {
    var list = [jsonBasedModel]()
     
      
       var count = 0
       var items = 0
       var i = 1
 

   
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    
    var imgArr = [    UIImage(named:"ic_offer_1"),
                        UIImage(named:"ic_offer_2") ,
                        UIImage(named:"ic_offer_3") ,
      
      ]
      var timer = Timer()
      var counter = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pageController.pageIndicatorTintColor = UIColor.black
                      pageController.currentPageIndicatorTintColor = UIColor.green
               pageController.numberOfPages = imgArr.count
                      pageController.currentPage = 0
                      DispatchQueue.main.async {
                          self.timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
                      }
        loadData()
    }
    
    @objc func changeImage() {
       
       if counter < imgArr.count {
           let index = IndexPath.init(item: counter, section: 0)
           self.sliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
           pageController.currentPage = counter
           counter += 1
       } else {
           counter = 0
           let index = IndexPath.init(item: counter, section: 0)
           self.sliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
           pageController.currentPage = counter
           counter = 1
       }
           


}
    
    //MARK:- Tableview methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MainViewCell
        
        cell.headerTitle?.text = list[indexPath.row].header
        self.count = list[indexPath.row].productModel.count
           self.items = indexPath.row
            
        
            let tapgesture = UITapGestureRecognizer(target: self, action: #selector(viewmoreGesture(gestureRecognizer:)))
            cell.viewmore.addGestureRecognizer(tapgesture)
            cell.viewmore.isUserInteractionEnabled = true
            cell.viewmore.tag = indexPath.row
        
            
                  return cell
    }
    //MARK:- here i should need to chnage the dynamic length
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
     func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
          guard let tableViewCell = cell as? MainViewCell else{
              return
          }
         // tableViewCell.setCollectionViewDataSourceDelegate( forRow: indexPath.row)
        tableViewCell.collectionView.tag = indexPath.row
        tableViewCell.collectionView.reloadData()
      }

   

        @objc func viewmoreGesture(gestureRecognizer: UITapGestureRecognizer){
            
            print("tap gesture enabled")
//
            if let vc = storyboard?.instantiateViewController(withIdentifier: "ProductDetailListController") as? ProductDetailListController {

//            vc!.productModel1 =
            print(gestureRecognizer.view!.tag)
                vc.productModel1 = list[gestureRecognizer.view!.tag].productModel


           let navController2 = UINavigationController(rootViewController: vc)
                  navController2.modalPresentationStyle = .fullScreen

                   self.present(navController2, animated: true, completion:nil)

            }
    }


    

    
   

}

//MARK:- JSON DATA

extension ViewController {
    
    func loadData(){
        let filepath = Bundle.main.path(forResource: "planets", ofType: "json")
             if let filepath = filepath{
                 do{
                     let fileURL = URL(fileURLWithPath: filepath)
                     let jsonData = try Data(contentsOf: fileURL , options: .mappedIfSafe )
                     let jsonEntry = JSON(jsonData)
                     let sections = jsonEntry["sections"].array!
                    
                     for section in sections{ // tre.. /fur // elect
                        var productModel = [ProductModel]()

                         let heading = section["title"].string!
                         //print("\n \(heading)\n")
                         let items = section["items"].array!
                         for item in items{ // all products
                            //let price = item["paramter"]["price"].string
                             let image = item["parameter"]["image_url"].string!
                            
                            var productName = ""
                            var productPrice = ""
                            var modelPath = ""
                            var Extension = ""
                           
                            print(item)
                             print(productPrice)
                            if let price = item["parameter"]["price"].string{
                                productPrice = price
                            }else{
                                productPrice = "121"
                            }
                            if let model = item["parameter"]["model"].string {
                                modelPath = model
                            }else{
                                modelPath = ""
                            }
                            if let Extensionfile = item["parameter"]["extension"].string{
                                Extension = Extensionfile
                            }else{
                                Extension = ""
                            }
                            
                            
                           
                           
                            
                             if let name = item["parameter"]["name"].string{
                                 //print("\(name)! : \(image)")
                                productName = name
                                
                                
                             }else{
                                 let title = item["parameter"]["title"].string!
                                productName = title

                             }
                            productModel.append(ProductModel(ProductName: productName, ProductImage: image, ProductPrice: productPrice,ModelPath: modelPath,Extension: Extension))
                            
                         }
                         let jsonElement = jsonBasedModel(header: heading, productModel: productModel)
                          list.append(jsonElement)
                         DispatchQueue.main.async {
                             self.tableView.reloadData()
                            
                            
                            
                         }
                     }
                    
                    print(list[0])
                 }catch{
                     print("ERROR")
                 }
             }
         }
    
    
    
    
    
}



extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView ==  self.sliderCollectionView{
        return imgArr.count
        }
        else{
            return list[collectionView.tag].productModel.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView ==  self.sliderCollectionView {
            let cell = sliderCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
                   
                   if let vc = cell.viewWithTag(111) as? UIImageView {
                             vc.image = imgArr[indexPath.row]
                           vc.contentMode = .scaleToFill
                         }
                   
                
                   return cell
        }
        else{
              let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath) as! ElementsCell
            if( cell != nil){
                cell.ProductName.text = list[collectionView.tag].productModel[indexPath.item].ProductName
                let url = list[collectionView.tag].productModel[indexPath.item].ProductImage
                
                    print(url)
                    cell.ProductImage.image = UIImage(named: url)
            //        let session = URLSession.shared
            //        let task = session.dataTask(with: url!) { (data, response, error) in
            //        if data != nil{
            //                let image = UIImage(data: data!)
            //                if image != nil{
            //                        DispatchQueue.main.async(execute: {
            //                            cell.imageViewElement.image = image
            //                        })
            //                    }
            //                }
            //            }
            //        task.resume()
            }
                    return cell
        }
        
        
       
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            print("it is inside slider collectionview")

        let vc = storyboard?.instantiateViewController(withIdentifier: "ProductdescriptionController") as? ProductDescriptionController
        vc!.selectedPost = list[collectionView.tag].productModel[indexPath.row]
        
        let navController2 = UINavigationController(rootViewController: vc!)
        navController2.modalPresentationStyle = .fullScreen

         self.present(navController2, animated: true, completion:nil)
            
        }
    }
    
    








//
//extension ViewController: UICollectionViewDelegateFlowLayout {
//
//
//     
//     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//         return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//     }
//     
//     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//         let size = collectionView.frame.size
//         return CGSize(width: size.width, height: size.height)
//     }
//     
//     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//         return 0.0
//     }
//     
//     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//         return 0.0
//     }
//    
//   
// }

