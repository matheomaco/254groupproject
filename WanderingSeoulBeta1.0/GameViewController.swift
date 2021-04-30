//
//  GameViewController.swift
//  WanderingSeoulBeta1.0
//
//  Created by Matheo on 10/16/20.
//  Copyright © 2020 Matheo. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    var thePlayer : Player = Player()

    @IBAction func savePlayer(sender : UIButton){
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory,
                                     in: .userDomainMask).first!
        let archiveURL = documentsDirectory.appendingPathComponent("playerSave").appendingPathExtension("plist")
        let propertyListEncoder = PropertyListEncoder()
        let encodedPlayer = try? propertyListEncoder.encode(thePlayer)
        try? encodedPlayer?.write(to: archiveURL,options: .noFileProtection)
     }
    @IBOutlet var coinsLabel : UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        thePlayer = loadPlayer()
        // Either a new player was created, or an old one was loaded
        coinsLabel.text = "Coins: " + String(thePlayer.getCoins())
        
        
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
//    let gameViewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GameViewController") as UIViewController

    @IBAction func addCoinsButtonPressed(sender: UIButton)
    {
        thePlayer.setCoins(thePlayer.getCoins() + 1)
        coinsLabel.text = "Coins: \(thePlayer.getCoins())"
    }
    
    @IBOutlet var toBlacksmithButton : UIButton!
    
    @IBAction func toBlackSmithButtonPressed(sender: UIButton)
    {
//        let blacksmithViewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Blacksmith") as UIViewController
//        blacksmithViewController.scaleMode()
//        self.present(blacksmithViewController, animated: true, completion: nil)
//        self.present(blacksmithViewController, animated: true, completion: nil)
        //UIApplication.shared.keyWindow?.rootViewController = blacksmithViewController
        
        
    }
    
    @IBAction func unwindToMain(_ sender: UIStoryboardSegue) {
        
        if sender.source is BlackSmithViewController {
            if let senderVC = sender.source as? BlackSmithViewController {
                thePlayer.setCoins(senderVC.numCoins)
            }
            coinsLabel.text = "Num Coins : " + String(thePlayer.getCoins())
        }
        else if sender.source is BossFightViewController {
            if let senderVC = sender.source as? BossFightViewController {
                thePlayer.setCoins(senderVC.numCoins)
            }
            coinsLabel.text = "Num Coins : " + String(thePlayer.getCoins())
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let destinationVC = segue.destination as? BlackSmithViewController {
            destinationVC.numCoins = thePlayer.getCoins()
        }
    }
    

}

func loadPlayer() -> Player
{
    var thePlayer : Player
    let propertyListDecoder = PropertyListDecoder()
    let documentsDirectory =
      FileManager.default.urls(for: .documentDirectory,
      in: .userDomainMask).first!
    let archiveURL = documentsDirectory.appendingPathComponent("playerSave").appendingPathExtension("plist")
    if let retrievedPlayerData = try? Data(contentsOf: archiveURL),
        let decodedPlayer = try?propertyListDecoder.decode(Player.self, from: retrievedPlayerData) {
        thePlayer = decodedPlayer
    }
    else {thePlayer = Player()}
    return thePlayer
}


