//
//  ViewController.swift
//  Puzzle
//
//  Created by Julián Rincón Usma - Ceiba Software on 4/16/18.
//  Copyright © 2018 Julián Rincón Usma - Ceiba Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var board: UIView!
    
    var tileWidth : Int = 0;
    var tileCenterX : Int = 0;
    var tileCenterY : Int = 0;
    
    var tileArray : NSMutableArray = []
    var tileCenterArray : NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeTiles();
        randomTiles();
    }
    
    func makeTiles() {
        self.tileArray = [];
        self.tileCenterArray = [];
        let boardWidth = Int(self.board.frame.width);
        self.tileWidth = boardWidth / 4;
        self.tileCenterX = self.tileWidth / 2;
        self.tileCenterY = self.tileWidth / 2;
        var tileNumber : Int = 1;
    
        for _ in 0..<4 {
            for _ in 0..<4 {
                let tileFrame : CGRect = CGRect(x: 0, y: 0, width: self.tileWidth - 2, height: self.tileWidth - 2);
                let tile : customLabel = customLabel(frame: tileFrame);
                let currentCenter : CGPoint = CGPoint(x: self.tileCenterX, y : self.tileCenterY);
                tile.center = currentCenter;
                tile.text = "\(tileNumber)";
                tile.textAlignment = NSTextAlignment.center;
                self.tileCenterArray.add(currentCenter);
                tile.backgroundColor = UIColor.red;
                self.board.addSubview(tile);
                tileNumber = tileNumber + 1;
                self.tileArray.add(tile);
                self.tileCenterX = self.tileCenterX + self.tileWidth;
            }
        self.tileCenterX = self.tileWidth / 2;
        self.tileCenterY = self.tileCenterY + self.tileWidth;
        }
        let lastTile : customLabel = self.tileArray.lastObject as! customLabel;
        lastTile.removeFromSuperview();
        self.tileArray.removeObject(at : 15);
    }
    
    func randomTiles() {
        for anyTile in self.tileArray {
            let randomIndex : Int = Int(arc4random()) % self.tileCenterArray.count;
            let randomCenter : CGPoint = self.tileCenterArray[randomIndex] as! CGPoint;
            (anyTile as! customLabel).center = randomCenter;
            self.tileCenterArray.removeObject(at: randomIndex);
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

class customLabel : UILabel {
    var originCenter : CGPoint = CGPoint(x : 0, y : 0);
}
