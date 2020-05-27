//
//  SceneViewController.swift
//  ArRetailStore
//
//  Created by Nethi Manikyapavan on 05/04/20.
//  Copyright © 2020 eClerx_Digital. All rights reserved.
//

import UIKit
import SceneKit

class SceneViewController: UIViewController {
    var selectedPost: ProductModel!
    
     var ship = SCNNode()
     let scene = SCNScene()
     

    @IBOutlet weak var sceneview: SCNView!
    override func viewDidLoad() {
        super.viewDidLoad()
                    // 1: Load .obj file
                   
                    // let node = SCNNode()
         
                    let cameraNode = SCNNode()
                    cameraNode.camera = SCNCamera()
                    scene.rootNode.addChildNode(cameraNode)
                    
                    // place the camera
                    cameraNode.position = SCNVector3(x: 0, y: 0, z: 5)
                    
                    // create and add a light to the scene
                    let lightNode = SCNNode()
                    lightNode.light = SCNLight()
                    lightNode.light!.type = .omni
                    lightNode.position = SCNVector3(x: 0, y: 0, z: 25)
                    scene.rootNode.addChildNode(lightNode)
                    
                    // create and add an ambient light to the scene
                    let ambientLightNode = SCNNode()
                    ambientLightNode.light = SCNLight()
                    ambientLightNode.light!.type = .ambient
                    ambientLightNode.light!.color = UIColor.darkGray
                    scene.rootNode.addChildNode(ambientLightNode)
                    
                    
                    // set the scene to the view
                    sceneview.scene = scene
                    
                    // allows the user to manipulate the camera
                    sceneview.allowsCameraControl = true
                    
                    // show statistics such as fps and timing information
                   // sceneview.showsStatistics = true
                    
                    // configure the view
                    sceneview.backgroundColor = UIColor.white
        
       
        
                    
      
        
        // ******************************************************

       // ship = nodeFromResource(assetName: "shipFolder/watch", extensionName: "dae")
        ship = nodeFromResource(assetName: selectedPost.ModelPath, extensionName: selectedPost.Extension)
        

        scene.rootNode.addChildNode(ship)
        animation(node: self.ship)
        
        
        
        
        
        //addAnimation(node: ship)
        
       
        let text = SCNText(string: "Adidas", extrusionDepth: 1.0)
        text.firstMaterial?.diffuse.contents = UIColor.black
        
//        let textNode = SCNNode(geometry: text)
//        textNode.position = SCNVector3(0, 12, 3)
//        textNode.scale = SCNVector3(0.5,0.5,0.5)
//
//        scene.rootNode.addChildNode(textNode)
//        addAnimation(node: textNode)

        
        
        
//        let stonesTreasureRoot = nodeFromResource(assetName: "stones_and_treasure", extensionName: "dae")
//        let treeNode = stonesTreasureRoot.childNode(withName: "Tree_Fir", recursively: true)!
//        treeNode.position = SCNVector3Make(1, 15, 5)
//        scene.rootNode.addChildNode(treeNode)
//        addAnimation(node: treeNode)
//        SCNAction.scale(to: 100.0, duration: 5.0)
        
//        let potionsRoot = nodeFromResource(assetName: "potions/vzor", extensionName: "dae")
//        let potion = potionsRoot.childNode(withName: "small_health_poti_purple", recursively: true)!
//        potion.position = SCNVector3Make(1, 1, 1)
//        scene.rootNode.addChildNode(potion)
//         addAnimation(node: potion)
//
//        let bluePotion = potionsRoot.childNode(withName: "small_health_poti_blue", recursively: true)!
//        bluePotion.position = SCNVector3Make(2, 1, 1)
//        scene.rootNode.addChildNode(bluePotion)
//        addAnimation(node: bluePotion)
        
        //MARK:- Tap gesture to stop Rotation
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
               sceneview.addGestureRecognizer(tapGesture)
        
        
        //MARK:- Pinch gesture
        let pinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(from:)))
               self.sceneview.addGestureRecognizer(pinchGestureRecognizer)
        }
    
    
    
 
    
    
    @IBAction func StartRotation(_ sender: Any) {
        let rotateOne = SCNAction.rotate(by: 50.0, around: SCNVector3(0.0, 10.0,0.0), duration: 40)
         let waitAction = SCNAction.wait(duration: 5)
         let hoverSequence = SCNAction.sequence([rotateOne,waitAction,rotateOne])
         let loopSequence = SCNAction.repeatForever(hoverSequence)
        ship.runAction(loopSequence)
       
     
       
      
    }
    
    @IBAction func StopAnimation(_ sender: Any) {
        
      
              
        
        
    //ship.removeAllActions()
    }
    
    
    
    
    
    
    
    
    
    @objc func handlePinch(from recognizer: UIPinchGestureRecognizer){
        print("pinch started")
        
        if recognizer.state == .changed {
            guard let sceneview = recognizer.view as? SCNView else{
                return
            }
            let touch = recognizer.location(in: sceneview)
            let hittestResult = self.sceneview.hitTest(touch, options: nil)
            if let hitTest = hittestResult.first {
                let rootnode = hitTest.node
                let pinchScaleX = Float(recognizer.scale) * rootnode.scale.x
                 let pinchScaleY = Float(recognizer.scale) * rootnode.scale.y
                 let pinchScaleZ = Float(recognizer.scale) * rootnode.scale.z
                rootnode.scale = SCNVector3(pinchScaleX,pinchScaleY,pinchScaleZ)
                recognizer.scale = 1
            }
        }

    }
    
    
    
    
   @objc
      func handleTap(_ gestureRecognize: UIGestureRecognizer) {
    ship.removeAllActions()
     print("paused")

    guard let shoenode = self.ship.childNode(withName: "band", recursively: true)
                                                  else{
                                                      return;
                                                  }
                 
             // shoenode.position = SCNVector3(0,5,10)
    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0, execute: {
       // animation(node: self.ship)
    })
    }
}

   
       func nodeFromResource(assetName: String, extensionName: String) -> SCNNode {
        let url = Bundle.main.url(forResource: "art.scnassets/\(assetName)", withExtension: extensionName)!
        print(url)
        let node = SCNReferenceNode(url: url)!
        
        node.name = assetName
        node.load()
        return node
    }


   func animation(node: SCNNode){
    let rotateOne = SCNAction.rotate(by: 50.0, around: SCNVector3(0.0, 10.0,0.0), duration: 20)
     let waitAction = SCNAction.wait(duration: 5)
     let hoverSequence = SCNAction.sequence([rotateOne,waitAction,rotateOne])
     let loopSequence = SCNAction.repeatForever(hoverSequence)
     node.runAction(loopSequence)
    
}

    


