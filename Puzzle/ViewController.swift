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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let boardWidth = Int(self.board.frame.width);
        self.tileWidth = boardWidth / 4;
        self.tileCenterX = self.tileWidth / 2;
        self.tileCenterY = self.tileWidth / 2;
        
        for _ in 0..<4 {
            let tileFrame : CGRect = CGRect(x: 0, y: 0, width: self.tileWidth - 2, height: self.tileWidth - 2);
            let tile : UILabel = UILabel(frame: tileFrame);
            tile.center = CGPoint(x: self.tileCenterX, y : self.tileCenterY);
            tile.backgroundColor = UIColor.red;
            self.board.addSubview(tile);
            self.tileCenterX = self.tileCenterX + self.tileWidth;
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

