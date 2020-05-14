//
//  Scalling360ViewModel.swift
//  ArRetailStore
//
//  Created by Nethi Manikyapavan on 13/05/20.
//  Copyright © 2020 eClerx_Digital. All rights reserved.
//

import Foundation
import SceneKit

class Scalling360ViewModel : UIViewController {
    var ship = SCNNode()
    let scene = SCNScene()

    @IBOutlet weak var sceneview: SCNView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
                    let cameraNode = SCNNode()
                    cameraNode.camera = SCNCamera()
                    scene.rootNode.addChildNode(cameraNode)
                    
                    // place the camera
                    cameraNode.position = SCNVector3(x: 0, y: 0, z: 70)
                    
                    // create and add a light to the scene
                    let lightNode = SCNNode()
                    lightNode.light = SCNLight()
                    lightNode.light!.type = .omni
                    lightNode.position = SCNVector3(x: 0, y: 0, z: 70)
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
        
        
                    
        let pinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(from:)))
        self.sceneview.addGestureRecognizer(pinchGestureRecognizer)
        
        
        ship = nodeFromResource(assetName: "shipFolder/CruzV2", extensionName: "usdz")
        scene.rootNode.addChildNode(ship)
    }
    
    
    
    func nodeFromResource(assetName: String, extensionName: String) -> SCNNode {
        let url = Bundle.main.url(forResource: "art.scnassets/\(assetName)", withExtension: extensionName)!
        print(url)
        let node = SCNReferenceNode(url: url)!
        
        node.name = assetName
        node.load()
        return node
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
}
