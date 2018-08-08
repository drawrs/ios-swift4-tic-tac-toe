//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Rizal Hilman on 07/08/18.
//  Copyright © 2018 Rizal Hilman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var squares: [UIButton]!
    @IBOutlet weak var buReset: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Sembunyikan tombol reset
        self.buReset.isHidden = true
    }

    @IBAction func buSelectEvent(_ sender: Any) {
        //print("Alfa gabut")
        // tampung tombol yg di klik
        let buSelect = sender as! UIButton
        //print(buSelect.tag)
        // Logika game
        playGameLogic(buSelected: buSelect)
    }
    // Variable
    var activePlayer = "A"
    var playerA = [Int]()
    var playerB = [Int]()
    
    func playGameLogic(buSelected: UIButton) {
        if activePlayer == "A" {
            // Ganti warna backgroun
            buSelected.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
            buSelected.setTitle("X", for: UIControlState.normal)
            
            // tampung Nilai Tag Button terpilih
            playerA.append(buSelected.tag)
            // ganti yg aktif player B
            activePlayer = "B"
        } else {
            // Ganti warna backgroun
            buSelected.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
            buSelected.setTitle("O", for: UIControlState.normal)
            // tampung Nilai Tag Button terpilih
            playerB.append(buSelected.tag)
            // ganti yg aktif player B
            activePlayer = "A"
        }
        print(activePlayer)
        print(playerA)
        // disable setiap tombol yg di klik
        buSelected.isEnabled = false
        // Jalankan fungsi pencari pemenang
        findWinner()
    }
    // Variable
    var winnerPlayer = ""
    func findWinner(){
        if playerA.contains(1) && playerA.contains(2) && playerA.contains(3) {
            // isi pemenangnya
            winnerPlayer = "A"
        }
        if playerB.contains(1) && playerB.contains(2) && playerB.contains(3) {
            // isi pemenangnya
            winnerPlayer = "B"
        }
        if playerA.contains(4) && playerA.contains(5) && playerA.contains(6) {
            winnerPlayer = "A"
        }
        if playerB.contains(4) && playerB.contains(5) && playerB.contains(6) {
            winnerPlayer = "B"
        }
        if playerA.contains(7) && playerA.contains(8) && playerA.contains(9) {
            winnerPlayer = "A"
        }
        if playerB.contains(7) && playerB.contains(8) && playerB.contains(9) {
            winnerPlayer = "B"
        }
        
        if playerA.contains(1) && playerA.contains(4) && playerA.contains(7) {
            winnerPlayer = "A"
        }
        if playerB.contains(1) && playerB.contains(4) && playerB.contains(7) {
            winnerPlayer = "B"
        }
        if playerA.contains(2) && playerA.contains(5) && playerA.contains(8) {
            winnerPlayer = "A"
        }
        
        if playerB.contains(2) && playerB.contains(5) && playerB.contains(8) {
            winnerPlayer = "B"
        }
        
        if playerA.contains(3) && playerA.contains(6) && playerA.contains(9) {
            winnerPlayer = "A"
        }
        
        if playerB.contains(3) && playerB.contains(6) && playerB.contains(9) {
            winnerPlayer = "B"
        }
        
        if playerA.contains(1) && playerA.contains(5) && playerA.contains(9) {
            winnerPlayer = "A"
        }
        
        if playerB.contains(1) && playerB.contains(5) && playerB.contains(9) {
            winnerPlayer = "B"
        }
        if playerA.contains(3) && playerA.contains(5) && playerA.contains(7) {
            winnerPlayer = "A"
        }
        
        if playerB.contains(3) && playerB.contains(5) && playerB.contains(7) {
            winnerPlayer = "B"
        }
        // Cek pemenang
        var msg = ""
        if winnerPlayer == "A" {
            msg = "Player A win!"
        } else if winnerPlayer == "B" {
            msg = "Player B win!"
        }
        
        if winnerPlayer != "" {
            // tampilkan Alert
            let alert = UIAlertController(title: "Congratulations",
                                          message: msg,
                                          preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK",
                                          style: UIAlertActionStyle.default,
                                          handler: { (alert:UIAlertAction!) in
                                            // aksi setelah OK di klik
                                        self.actionResetGame(self)
                                            
                                            
            }))
            // tampilkan alert
            self.present(alert, animated: true, completion: nil)
        } else if (self.playerA.count+self.playerB.count) == 9 {
            // it's draw man, show the reset button now
            self.buReset.isHidden = false
        }
    }
    // Fungsi untuk mereset game
    @IBAction func actionResetGame(_ sender: Any) {
        // reset semua ke state awal
        winnerPlayer = ""
        playerB = []
        playerA = []
        // Set semua title ke awal
        for square in squares {
            square.setTitle("", for: UIControlState.normal)
            square.isEnabled = true
            square.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
        // hide lagi tombol reset
        self.buReset.isHidden = true
    }
    
}

