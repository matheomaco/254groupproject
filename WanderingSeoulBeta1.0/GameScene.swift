//
//  GameScene.swift
//  WanderingSeoulBeta1.0
//
//  Created by Matheo on 10/16/20.
//  Copyright © 2020 Matheo. All rights reserved.
//

import SpriteKit



enum CollisionTypes: UInt32{
    case player = 1
    case wall = 2
    case star = 4
    case vortex = 8
    case finish = 16
}


class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var player: SKSpriteNode!
    
    var lastTouchPosition: CGPoint?
    var gameOver = false
    var creditLabel: SKLabelNode!
    
    var credit = 0 {
        didSet { creditLabel.text = "Credit: \(credit)" }
    }
    
    
    override func sceneDidLoad() {
        
        creditLabel = SKLabelNode(fontNamed: "Chalkduster")
        creditLabel.text = "Credit: 0"
        creditLabel.horizontalAlignmentMode = .left
        creditLabel.position = CGPoint(x: 16, y:16)
        creditLabel.zPosition = 2
        addChild(creditLabel)

        
       loadIntro()
       createPlayer()
   
    }
    

    
    
    func blacksmithLevel(Sender: UIButton!) {
        //let blacksmithlevel:SecondViewController = SecondViewController()
        //self.presentViewController(next, animated: true, completion: nil)
        //
        
    }
    func loadBoss4(){
             

             let background = SKSpriteNode(imageNamed: "bossbg4")
             background.position = CGPoint(x: 512, y: 384)
             background.blendMode = .replace
             background.zPosition = -1
             addChild(background)
             
             
             guard let levelURL = Bundle.main.url(forResource: "boss4", withExtension: "txt")
                 else{ fatalError("boss2.txt not found.") }
             guard let levelString = try? String(contentsOf: levelURL)
                 else{ fatalError("boss2.txt not loaded.") }
             
             let lines = levelString.components(separatedBy: "\n")
             
             
             for (row, line) in lines.reversed().enumerated(){
                 for (column, letter) in line.enumerated(){
                     let position = CGPoint(x: (64 * column) + 32, y: (64 * row) + 32)
                     
                     if letter == "x" {
                         let node = SKSpriteNode(imageNamed: "lavarock")
                         node.position = position
                         node.physicsBody = SKPhysicsBody(rectangleOf: node.size)
                         node.physicsBody?.categoryBitMask = CollisionTypes.wall.rawValue
                         node.physicsBody?.isDynamic = false
                         
                         addChild(node)
                     }
                         
                     else if letter == "i" {
                                 let node = SKSpriteNode(imageNamed: "rolex")
                                 node.name = "boss4finish"
                                 node.physicsBody = SKPhysicsBody(circleOfRadius: node.size.width / 2)
                                 node.physicsBody?.isDynamic = false
                                 node.physicsBody?.categoryBitMask = CollisionTypes.finish.rawValue
                                 node.physicsBody?.contactTestBitMask = CollisionTypes.player.rawValue
                                 node.physicsBody?.collisionBitMask = 0
                                 node.position = position
                                 
                                 addChild(node)
                     }
                     else if letter == " " {}
                     else { fatalError("Check level letter: \(letter)") }
                 }
             }
          createPlayer()
             physicsWorld.gravity = .zero
             physicsWorld.contactDelegate = self
         }
    
    func loadBoss3(){

             let background = SKSpriteNode(imageNamed: "bossbg3")
             background.position = CGPoint(x: 512, y: 384)
             background.blendMode = .replace
             background.zPosition = -1
             addChild(background)
             
             
             guard let levelURL = Bundle.main.url(forResource: "boss3", withExtension: "txt")
                 else{ fatalError("boss2.txt not found.") }
             guard let levelString = try? String(contentsOf: levelURL)
                 else{ fatalError("boss2.txt not loaded.") }
             
             let lines = levelString.components(separatedBy: "\n")
             
             
             for (row, line) in lines.reversed().enumerated(){
                 for (column, letter) in line.enumerated(){
                     let position = CGPoint(x: (64 * column) + 32, y: (64 * row) + 32)
                     
                     if letter == "x" {
                         let node = SKSpriteNode(imageNamed: "iceblock")
                         node.position = position
                         node.physicsBody = SKPhysicsBody(rectangleOf: node.size)
                         node.physicsBody?.categoryBitMask = CollisionTypes.wall.rawValue
                         node.physicsBody?.isDynamic = false
                         
                         addChild(node)
                     }
                         
                     else if letter == "g" {
                                 let node = SKSpriteNode(imageNamed: "please")
                                 node.name = "boss3finish"
                                 node.physicsBody = SKPhysicsBody(circleOfRadius: node.size.width / 2)
                                 node.physicsBody?.isDynamic = false
                                 node.physicsBody?.categoryBitMask = CollisionTypes.finish.rawValue
                                 node.physicsBody?.contactTestBitMask = CollisionTypes.player.rawValue
                                 node.physicsBody?.collisionBitMask = 0
                                 node.position = position
                                 
                                 addChild(node)
                     }
                     else if letter == " " {}
                     else { fatalError("Check level letter: \(letter)") }
                 }
             }
          createPlayer()
             physicsWorld.gravity = .zero
             physicsWorld.contactDelegate = self
         }
    func loadBoss2(){
            

            let background = SKSpriteNode(imageNamed: "bossbg2")
            background.position = CGPoint(x: 512, y: 384)
            background.blendMode = .replace
            background.zPosition = -1
            addChild(background)
            
            
            guard let levelURL = Bundle.main.url(forResource: "boss2", withExtension: "txt")
                else{ fatalError("boss2.txt not found.") }
            guard let levelString = try? String(contentsOf: levelURL)
                else{ fatalError("boss2.txt not loaded.") }
            
            let lines = levelString.components(separatedBy: "\n")
            
            
            for (row, line) in lines.reversed().enumerated(){
                for (column, letter) in line.enumerated(){
                    let position = CGPoint(x: (64 * column) + 32, y: (64 * row) + 32)
                    
                    if letter == "x" {
                        let node = SKSpriteNode(imageNamed: "cactus")
                        node.position = position
                        node.physicsBody = SKPhysicsBody(rectangleOf: node.size)
                        node.physicsBody?.categoryBitMask = CollisionTypes.wall.rawValue
                        node.physicsBody?.isDynamic = false
                        
                        addChild(node)
                    }
                        
                    else if letter == "d" {
                                let node = SKSpriteNode(imageNamed: "notok")
                                node.name = "boss2finish"
                                node.physicsBody = SKPhysicsBody(circleOfRadius: node.size.width / 2)
                                node.physicsBody?.isDynamic = false
                                node.physicsBody?.categoryBitMask = CollisionTypes.finish.rawValue
                                node.physicsBody?.contactTestBitMask = CollisionTypes.player.rawValue
                                node.physicsBody?.collisionBitMask = 0
                                node.position = position
                                
                                addChild(node)
                    }
                    else if letter == " " {}
                    else { fatalError("Check level letter: \(letter)") }
                }
            }
         createPlayer()
            physicsWorld.gravity = .zero
            physicsWorld.contactDelegate = self
        }
    func loadBoss1(){
           

           let background = SKSpriteNode(imageNamed: "boss1bg")
           background.position = CGPoint(x: 512, y: 384)
           background.blendMode = .replace
           background.zPosition = -1
           addChild(background)
           
           
           guard let levelURL = Bundle.main.url(forResource: "boss1", withExtension: "txt")
               else{ fatalError("boss1.txt not found.") }
           guard let levelString = try? String(contentsOf: levelURL)
               else{ fatalError("boss1.txt not loaded.") }
           
           let lines = levelString.components(separatedBy: "\n")
           
           
           for (row, line) in lines.reversed().enumerated(){
               for (column, letter) in line.enumerated(){
                   let position = CGPoint(x: (64 * column) + 32, y: (64 * row) + 32)
                   
                   if letter == "x" {
                       let node = SKSpriteNode(imageNamed: "block")
                       node.position = position
                       node.physicsBody = SKPhysicsBody(rectangleOf: node.size)
                       node.physicsBody?.categoryBitMask = CollisionTypes.wall.rawValue
                       node.physicsBody?.isDynamic = false
                       
                       addChild(node)
                   }
                       
                   else if letter == "b" {
                               let node = SKSpriteNode(imageNamed: "yes")
                               node.name = "boss1finish"
                               node.physicsBody = SKPhysicsBody(circleOfRadius: node.size.width / 2)
                               node.physicsBody?.isDynamic = false
                               node.physicsBody?.categoryBitMask = CollisionTypes.finish.rawValue
                               node.physicsBody?.contactTestBitMask = CollisionTypes.player.rawValue
                               node.physicsBody?.collisionBitMask = 0
                               node.position = position
                               
                               addChild(node)
                   }
                   else if letter == " " {}
                   else { fatalError("Check level letter: \(letter)") }
               }
           }
        createPlayer()
           physicsWorld.gravity = .zero
           physicsWorld.contactDelegate = self
       }
    
    
    func loadIntro(){
           

           let background = SKSpriteNode(imageNamed: "intro")
           background.position = CGPoint(x: 512, y: 384)
           background.blendMode = .replace
           background.zPosition = -1
           addChild(background)
           
           
           
           
           guard let levelURL = Bundle.main.url(forResource: "intro", withExtension: "txt")
               else{ fatalError("intro.txt not found.") }
           guard let levelString = try? String(contentsOf: levelURL)
               else{ fatalError("intro.txt not loaded.") }
           
           let lines = levelString.components(separatedBy: "\n")
           
           
           for (row, line) in lines.reversed().enumerated(){
               for (column, letter) in line.enumerated(){
                   let position = CGPoint(x: (64 * column) + 32, y: (64 * row) + 32)
                   
                   if letter == "x" {
                       let node = SKSpriteNode(imageNamed: "introblock")
                       node.position = position
                       node.physicsBody = SKPhysicsBody(rectangleOf: node.size)
                       node.physicsBody?.categoryBitMask = CollisionTypes.wall.rawValue
                       node.physicsBody?.isDynamic = false
                       
                       addChild(node)
                   }
                       
                   else if letter == "f" {
                               let node = SKSpriteNode(imageNamed: "hello")
                               node.name = "introfinish"
                               node.physicsBody = SKPhysicsBody(circleOfRadius: node.size.width / 2)
                               node.physicsBody?.isDynamic = false
                               node.physicsBody?.categoryBitMask = CollisionTypes.finish.rawValue
                               node.physicsBody?.contactTestBitMask = CollisionTypes.player.rawValue
                               node.physicsBody?.collisionBitMask = 0
                               node.position = position
                               
                               addChild(node)
                   }
                   else if letter == " " {}
                   else { fatalError("Check level letter: \(letter)") }
               }
           }
           physicsWorld.gravity = .zero
           physicsWorld.contactDelegate = self
       }
    
    func loadLevel1(){
        

        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: 512, y: 384)
        background.blendMode = .replace
        background.zPosition = -1
        addChild(background)
        
              addChild(creditLabel)
        
        
        guard let levelURL = Bundle.main.url(forResource: "level1", withExtension: "txt")
            else{ fatalError("level1.txt not found.") }
        guard let levelString = try? String(contentsOf: levelURL)
            else{ fatalError("level1.txt not loaded.") }
        
        let lines = levelString.components(separatedBy: "\n")
        
        
        for (row, line) in lines.reversed().enumerated(){
            for (column, letter) in line.enumerated(){
                let position = CGPoint(x: (64 * column) + 32, y: (64 * row) + 32)
                
                if letter == "x" {
                    let node = SKSpriteNode(imageNamed: "block")
                    node.position = position
                    node.physicsBody = SKPhysicsBody(rectangleOf: node.size)
                    node.physicsBody?.categoryBitMask = CollisionTypes.wall.rawValue
                    node.physicsBody?.isDynamic = false
                    
                    addChild(node)
                }
                    
                    
                else if letter == "v" {
                    let node = SKSpriteNode(imageNamed: "vortex")
                    node.name = "vortex"
                    node.position = position
                    node.run(SKAction.repeatForever(SKAction.rotate(byAngle: .pi, duration: 1))) //spins it
                    node.physicsBody = SKPhysicsBody(circleOfRadius: node.size.width / 2 )
                    node.physicsBody?.isDynamic = false //not dynamic
                    node.physicsBody?.categoryBitMask = CollisionTypes.vortex.rawValue
                    node.physicsBody?.contactTestBitMask = CollisionTypes.player.rawValue //tells if it touches the player
                    node.physicsBody?.collisionBitMask = 0 //player cannot collide or bounce of with this object just suck
                    
                    addChild(node) //add to gamescene
                    
                }
                    
                else if letter == "s" {
                    let node = SKSpriteNode(imageNamed: "star")
                    node.name = "star"
                    node.physicsBody = SKPhysicsBody(circleOfRadius: node.size.width / 2)
                    node.physicsBody?.isDynamic = false
                    node.physicsBody?.categoryBitMask = CollisionTypes.star.rawValue
                    node.physicsBody?.contactTestBitMask = CollisionTypes.player.rawValue
                    node.physicsBody?.collisionBitMask = 0
                    node.position = position
                    
                    addChild(node)
                }
                    
                else if letter == "a" {
                            let node = SKSpriteNode(imageNamed: "finish")
                            node.name = "level1finish"
                            node.physicsBody = SKPhysicsBody(circleOfRadius: node.size.width / 2)
                            node.physicsBody?.isDynamic = false
                            node.physicsBody?.categoryBitMask = CollisionTypes.finish.rawValue
                            node.physicsBody?.contactTestBitMask = CollisionTypes.player.rawValue
                            node.physicsBody?.collisionBitMask = 0
                            node.position = position
                            
                            addChild(node)
                }
                else if letter == " " {}
                else { fatalError("Check level letter: \(letter)") }
                
            }
        }
        
        
        createPlayer()
    
        
 
        
        physicsWorld.gravity = .zero
        physicsWorld.contactDelegate = self
        
        
        
        
    }
    
    
    func loadLevel2(){
        

        let background2 = SKSpriteNode(imageNamed: "level2background")
        background2.position = CGPoint(x: 512, y: 384)
        background2.blendMode = .replace
        background2.zPosition = -1
        addChild(background2)
        

                    addChild(creditLabel)
        
        
        
        guard let levelURL = Bundle.main.url(forResource: "level2", withExtension: "txt")
            else{ fatalError("level2.txt not found.") }
        guard let levelString = try? String(contentsOf: levelURL)
            else{ fatalError("level2.txt not loaded.") }
        
        let lines = levelString.components(separatedBy: "\n")
        
        
        for (row, line) in lines.reversed().enumerated(){
            for (column, letter) in line.enumerated(){
                let position = CGPoint(x: (64 * column) + 32, y: (64 * row) + 32)
                
                if letter == "x" {
                    let node = SKSpriteNode(imageNamed: "cactus")
                    node.position = position
                    node.physicsBody = SKPhysicsBody(rectangleOf: node.size)
                    node.physicsBody?.categoryBitMask = CollisionTypes.wall.rawValue
                    node.physicsBody?.isDynamic = false
                    
                    addChild(node)
                }
                    
                    
                else if letter == "v" {
                    let node = SKSpriteNode(imageNamed: "vortex")
                    node.name = "vortex"
                    node.position = position
                    node.run(SKAction.repeatForever(SKAction.rotate(byAngle: .pi, duration: 1))) //spins it
                    node.physicsBody = SKPhysicsBody(circleOfRadius: node.size.width / 2 )
                    node.physicsBody?.isDynamic = false //not dynamic
                    node.physicsBody?.categoryBitMask = CollisionTypes.vortex.rawValue
                    node.physicsBody?.contactTestBitMask = CollisionTypes.player.rawValue //tells if it touches the player
                    node.physicsBody?.collisionBitMask = 0 //player cannot collide or bounce of with this object just suck
                    
                    addChild(node) //add to gamescene
                    
                }
                    
                else if letter == "s" {
                    let node = SKSpriteNode(imageNamed: "star")
                    node.name = "star"
                    node.physicsBody = SKPhysicsBody(circleOfRadius: node.size.width / 2)
                    node.physicsBody?.isDynamic = false
                    node.physicsBody?.categoryBitMask = CollisionTypes.star.rawValue
                    node.physicsBody?.contactTestBitMask = CollisionTypes.player.rawValue
                    node.physicsBody?.collisionBitMask = 0
                    node.position = position
                    
                    addChild(node)
                }
                    
                else if letter == "f" {
                            let node = SKSpriteNode(imageNamed: "finish")
                            node.name = "finish"
                            node.physicsBody = SKPhysicsBody(circleOfRadius: node.size.width / 2)
                            node.physicsBody?.isDynamic = false
                            node.physicsBody?.categoryBitMask = CollisionTypes.finish.rawValue
                            node.physicsBody?.contactTestBitMask = CollisionTypes.player.rawValue
                            node.physicsBody?.collisionBitMask = 0
                            node.position = position
                            
                            addChild(node)
                }
                else if letter == "c" {
                                let node = SKSpriteNode(imageNamed: "finish")
                                node.name = "level2finish"
                                node.physicsBody = SKPhysicsBody(circleOfRadius: node.size.width / 2)
                                node.physicsBody?.isDynamic = false
                                node.physicsBody?.categoryBitMask = CollisionTypes.finish.rawValue
                                node.physicsBody?.contactTestBitMask = CollisionTypes.player.rawValue
                                node.physicsBody?.collisionBitMask = 0
                                node.position = position
                                
                                addChild(node)
                    }
                else if letter == " " {}
                else { fatalError("Check level letter: \(letter)") }
                
            }
        }
        
        
        
        createPlayer()
        
        physicsWorld.gravity = .zero
        physicsWorld.contactDelegate = self
        
        
        
        
    }
    
    func loadLevel3(){
        

        let background2 = SKSpriteNode(imageNamed: "level3bg")
        background2.position = CGPoint(x: 512, y: 384)
        background2.blendMode = .replace
        background2.zPosition = -1
        addChild(background2)
        

                    addChild(creditLabel)
        
        
        
        guard let levelURL = Bundle.main.url(forResource: "level3", withExtension: "txt")
            else{ fatalError("level2.txt not found.") }
        guard let levelString = try? String(contentsOf: levelURL)
            else{ fatalError("level2.txt not loaded.") }
        
        let lines = levelString.components(separatedBy: "\n")
        
        
        for (row, line) in lines.reversed().enumerated(){
            for (column, letter) in line.enumerated(){
                let position = CGPoint(x: (64 * column) + 32, y: (64 * row) + 32)
                
                if letter == "x" {
                    let node = SKSpriteNode(imageNamed: "iceblock")
                    node.position = position
                    node.physicsBody = SKPhysicsBody(rectangleOf: node.size)
                    node.physicsBody?.categoryBitMask = CollisionTypes.wall.rawValue
                    node.physicsBody?.isDynamic = false
                    
                    addChild(node)
                }
                    
                    
                else if letter == "v" {
                    let node = SKSpriteNode(imageNamed: "vortex")
                    node.name = "vortex"
                    node.position = position
                    node.run(SKAction.repeatForever(SKAction.rotate(byAngle: .pi, duration: 1))) //spins it
                    node.physicsBody = SKPhysicsBody(circleOfRadius: node.size.width / 2 )
                    node.physicsBody?.isDynamic = false //not dynamic
                    node.physicsBody?.categoryBitMask = CollisionTypes.vortex.rawValue
                    node.physicsBody?.contactTestBitMask = CollisionTypes.player.rawValue //tells if it touches the player
                    node.physicsBody?.collisionBitMask = 0 //player cannot collide or bounce of with this object just suck
                    
                    addChild(node) //add to gamescene
                    
                }
                    
                else if letter == "s" {
                    let node = SKSpriteNode(imageNamed: "star")
                    node.name = "star"
                    node.physicsBody = SKPhysicsBody(circleOfRadius: node.size.width / 2)
                    node.physicsBody?.isDynamic = false
                    node.physicsBody?.categoryBitMask = CollisionTypes.star.rawValue
                    node.physicsBody?.contactTestBitMask = CollisionTypes.player.rawValue
                    node.physicsBody?.collisionBitMask = 0
                    node.position = position
                    
                    addChild(node)
                }
                else if letter == "e" {
                                let node = SKSpriteNode(imageNamed: "finish")
                                node.name = "level3finish"
                                node.physicsBody = SKPhysicsBody(circleOfRadius: node.size.width / 2)
                                node.physicsBody?.isDynamic = false
                                node.physicsBody?.categoryBitMask = CollisionTypes.finish.rawValue
                                node.physicsBody?.contactTestBitMask = CollisionTypes.player.rawValue
                                node.physicsBody?.collisionBitMask = 0
                                node.position = position
                                
                                addChild(node)
                    }
                else if letter == " " {}
                else { fatalError("Check level letter: \(letter)") }
                
            }
        }
        
        
        
        createPlayer()
        
        physicsWorld.gravity = .zero
        physicsWorld.contactDelegate = self
        
        
        
        
    }
    
    func loadLevel4(){
        

        let background3 = SKSpriteNode(imageNamed: "bg4")
        background3.position = CGPoint(x: 512, y: 384)
        background3.blendMode = .replace
        background3.zPosition = -1
        addChild(background3)
        

                    addChild(creditLabel)
        
        
        
        guard let levelURL = Bundle.main.url(forResource: "level4", withExtension: "txt")
            else{ fatalError("level4.txt not found.") }
        guard let levelString = try? String(contentsOf: levelURL)
            else{ fatalError("level4.txt not loaded.") }
        
        let lines = levelString.components(separatedBy: "\n")
        
        
        for (row, line) in lines.reversed().enumerated(){
            for (column, letter) in line.enumerated(){
                let position = CGPoint(x: (64 * column) + 32, y: (64 * row) + 32)
                
                if letter == "x" {
                    let node = SKSpriteNode(imageNamed: "lavarock")
                    node.position = position
                    node.physicsBody = SKPhysicsBody(rectangleOf: node.size)
                    node.physicsBody?.categoryBitMask = CollisionTypes.wall.rawValue
                    node.physicsBody?.isDynamic = false
                    
                    addChild(node)
                }
                    
                    
                else if letter == "v" {
                    let node = SKSpriteNode(imageNamed: "vortex")
                    node.name = "vortex"
                    node.position = position
                    node.run(SKAction.repeatForever(SKAction.rotate(byAngle: .pi, duration: 1))) //spins it
                    node.physicsBody = SKPhysicsBody(circleOfRadius: node.size.width / 2 )
                    node.physicsBody?.isDynamic = false //not dynamic
                    node.physicsBody?.categoryBitMask = CollisionTypes.vortex.rawValue
                    node.physicsBody?.contactTestBitMask = CollisionTypes.player.rawValue //tells if it touches the player
                    node.physicsBody?.collisionBitMask = 0 //player cannot collide or bounce of with this object just suck
                    
                    addChild(node) //add to gamescene
                    
                }
                    
                else if letter == "s" {
                    let node = SKSpriteNode(imageNamed: "star")
                    node.name = "star"
                    node.physicsBody = SKPhysicsBody(circleOfRadius: node.size.width / 2)
                    node.physicsBody?.isDynamic = false
                    node.physicsBody?.categoryBitMask = CollisionTypes.star.rawValue
                    node.physicsBody?.contactTestBitMask = CollisionTypes.player.rawValue
                    node.physicsBody?.collisionBitMask = 0
                    node.position = position
                    
                    addChild(node)
                }
                    
                else if letter == "h" {
                                let node = SKSpriteNode(imageNamed: "finish")
                                node.name = "level4finish"
                                node.physicsBody = SKPhysicsBody(circleOfRadius: node.size.width / 2)
                                node.physicsBody?.isDynamic = false
                                node.physicsBody?.categoryBitMask = CollisionTypes.finish.rawValue
                                node.physicsBody?.contactTestBitMask = CollisionTypes.player.rawValue
                                node.physicsBody?.collisionBitMask = 0
                                node.position = position
                                
                                addChild(node)
                    }
                else if letter == " " {}
                else { fatalError("Check level letter: \(letter)") }
                
            }
        }
        
        
        
        createPlayer()
        
        physicsWorld.gravity = .zero
        physicsWorld.contactDelegate = self
        
        
        
        
    }
    
    func loadLevel5(){
         

         let background3 = SKSpriteNode(imageNamed: "bg5")
         background3.position = CGPoint(x: 512, y: 384)
         background3.blendMode = .replace
         background3.zPosition = -1
         addChild(background3)
         

                     addChild(creditLabel)
         
         
         
         guard let levelURL = Bundle.main.url(forResource: "level5", withExtension: "txt")
             else{ fatalError("level5.txt not found.") }
         guard let levelString = try? String(contentsOf: levelURL)
             else{ fatalError("level5.txt not loaded.") }
         
         let lines = levelString.components(separatedBy: "\n")
         
         
         for (row, line) in lines.reversed().enumerated(){
             for (column, letter) in line.enumerated(){
                 let position = CGPoint(x: (64 * column) + 32, y: (64 * row) + 32)
                 
                 if letter == "x" {
                     let node = SKSpriteNode(imageNamed: "block5")
                     node.position = position
                     node.physicsBody = SKPhysicsBody(rectangleOf: node.size)
                     node.physicsBody?.categoryBitMask = CollisionTypes.wall.rawValue
                     node.physicsBody?.isDynamic = false
                     
                     addChild(node)
                 }
                     
                     
                 else if letter == "v" {
                     let node = SKSpriteNode(imageNamed: "vortex")
                     node.name = "vortex"
                     node.position = position
                     node.run(SKAction.repeatForever(SKAction.rotate(byAngle: .pi, duration: 1))) //spins it
                     node.physicsBody = SKPhysicsBody(circleOfRadius: node.size.width / 2 )
                     node.physicsBody?.isDynamic = false //not dynamic
                     node.physicsBody?.categoryBitMask = CollisionTypes.vortex.rawValue
                     node.physicsBody?.contactTestBitMask = CollisionTypes.player.rawValue //tells if it touches the player
                     node.physicsBody?.collisionBitMask = 0 //player cannot collide or bounce of with this object just suck
                     
                     addChild(node) //add to gamescene
                     
                 }
                     
                 else if letter == "s" {
                     let node = SKSpriteNode(imageNamed: "star")
                     node.name = "star"
                     node.physicsBody = SKPhysicsBody(circleOfRadius: node.size.width / 2)
                     node.physicsBody?.isDynamic = false
                     node.physicsBody?.categoryBitMask = CollisionTypes.star.rawValue
                     node.physicsBody?.contactTestBitMask = CollisionTypes.player.rawValue
                     node.physicsBody?.collisionBitMask = 0
                     node.position = position
                     
                     addChild(node)
                 }
                     
                 else if letter == "m" {
                                 let node = SKSpriteNode(imageNamed: "finish")
                                 node.name = "finish5"
                                 node.physicsBody = SKPhysicsBody(circleOfRadius: node.size.width / 2)
                                 node.physicsBody?.isDynamic = false
                                 node.physicsBody?.categoryBitMask = CollisionTypes.finish.rawValue
                                 node.physicsBody?.contactTestBitMask = CollisionTypes.player.rawValue
                                 node.physicsBody?.collisionBitMask = 0
                                 node.position = position
                                 
                                 addChild(node)
                     }
                 else if letter == " " {}
                 else { fatalError("Check level letterzz: \(letter)") }
                 
             }
         }
         
         createPlayer()
         
         physicsWorld.gravity = .zero
         physicsWorld.contactDelegate = self
         
     }
     
    
    func createPlayer() {
        player = SKSpriteNode(imageNamed: "player")
        player.position = CGPoint(x: 96, y: 672)
        
        player.physicsBody = SKPhysicsBody(circleOfRadius: player.size.width / 2 )
        player.physicsBody?.allowsRotation = false
        player.physicsBody?.linearDamping = 0.5
        
        player.physicsBody?.categoryBitMask = CollisionTypes.player.rawValue
        player.physicsBody?.contactTestBitMask = CollisionTypes.star.rawValue |
            CollisionTypes.vortex.rawValue | CollisionTypes.finish.rawValue
        player.physicsBody?.collisionBitMask = CollisionTypes.wall.rawValue
        
        addChild(player)
    
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return}
        let location = touch.location(in: self)
        lastTouchPosition = location
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return}
        let location = touch.location(in: self)
        lastTouchPosition = location
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        lastTouchPosition = nil
    }
    
    override func update(_ currentTime: TimeInterval) {
        guard gameOver == false else {return}
        
        
        if let lastTouchPosition = lastTouchPosition{
            let diff = CGPoint(x: lastTouchPosition.x - player.position.x,
                               y: lastTouchPosition.y - player.position.y)
            physicsWorld.gravity = CGVector(dx: diff.x / 100, dy: diff.y / 100)
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        guard let nodeA = contact.bodyA.node else {return}
        guard let nodeB = contact.bodyB.node else {return}
        
        if nodeA == player {
            playerCollided(with: nodeB)
        }
        else if nodeB == player {
            playerCollided(with: nodeA)
        }
    }
    
    func playerCollided(with node: SKNode){
        if node.name == "vortex" {
            player.physicsBody?.isDynamic = false
            gameOver = true
            credit -= 1
            
            let move = SKAction.move(to: node.position, duration: 0.25)
            let scale = SKAction.scale(to: 0.0001, duration: 0.25)
            let remove = SKAction.removeFromParent()
            let sequence = SKAction.sequence([move,scale,remove])
            
            player.run(sequence) { [weak self] in
                self?.createPlayer()
                self?.gameOver = false
            }
        }
        else if node.name == "star" {
           node.removeFromParent()
            credit += 1
        }
        else if node.name == "introfinish" {
            removeAllChildren()
            loadLevel1()
        }
        else if node.name == "level1finish" {
            removeAllChildren()
            loadBoss1()
        }
        else if node.name == "boss1finish" {
            removeAllChildren()
            loadLevel2()
        }
        else if node.name == "level2finish" {
            removeAllChildren()
            loadBoss2()
        }
        else if node.name == "boss2finish" {
            removeAllChildren()
            loadLevel3()
        }
        else if node.name == "level3finish" {
            removeAllChildren()
            loadBoss3()
        }
        else if node.name == "boss3finish" {
            removeAllChildren()
            loadLevel4()
        }
        else if node.name == "level4finish" {
            removeAllChildren()
            loadBoss4()
        }
        else if node.name == "boss4finish" {
            removeAllChildren()
            loadLevel5()
        }
        else if node.name == "finish5" {
            removeAllChildren()
            
        }
        
        
    
}
}
