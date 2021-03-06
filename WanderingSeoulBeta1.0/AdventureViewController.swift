//
//  AdventureViewController.swift
//  WanderingSeoulBeta1.0
//
//  Created by CSUFTitan on 12/6/20.
//  Copyright © 2020 Matheo. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import GameplayKit

class AdventureViewController: UIViewController {

        
           override func viewDidLoad() {
               super.viewDidLoad()
               
               // Load 'GameScene.sks' as a GKScene. This provides gameplay related content
               // including entities and graphs.
               if let scene = GKScene(fileNamed: "GameScene") {
                   
                   // Get the SKScene from the loaded GKScene
                   if let sceneNode = scene.rootNode as! GameScene? {
                       
        
                       // Set the scale mode to scale to fit the window
                       sceneNode.scaleMode = .aspectFill
                       
                       // Present the scene
                       if let view = self.view as! SKView? {
                           view.presentScene(sceneNode)
                           
                           view.ignoresSiblingOrder = true
                           
                           view.showsFPS = true
                           view.showsNodeCount = true
                       }
                   }
               }
           }


    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
