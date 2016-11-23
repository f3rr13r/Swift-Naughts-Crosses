//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Harry Ferrier on 8/5/16.
//  Copyright © 2016 CASTOVISION LIMITED. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var startGameView: UIView!
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var playAgainLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    
    var activeGame: Bool = true
    
    
    // Active player, can wither be '1' or '2'
    var activePlayer: Int = 1
    
    // Create a blueprint of the Tic Tac Toe board inside an array, and set the initial value of each square to be zero (EMPTY).
    // 1's will equate to Noughts, 2 will equate to Crosses..
    var gameState: [Int] = [0, 0, 0,
                            0, 0, 0,
                            0, 0, 0]
    
    // Specify each winning combination that the Tic Tac Toe game can have.
    let winningCombinations: [[Int]] = [
                                        [0, 1, 2],
                                        [3, 4, 5],
                                        [6, 7, 8],
                                        [0, 3, 6],
                                        [1, 4, 7],
                                        [2, 5, 8],
                                        [0, 4, 8],
                                        [2, 4, 6]
                                        ]
    
    
    
    
    
    // Initially 'play' button at start of app launch, but also 'PlayAgain' when game has been won..
    @IBAction func play(_ sender: AnyObject) {
        
        
//** RESET THE GAME BACK TO BEGINNING **//
        
        activeGame = true
        
        // Active player, can wither be '1' or '2'
        activePlayer = 1
        
        // Create a blueprint of the Tic Tac Toe board inside an array, and set the initial value of each square to be zero (EMPTY).
        // 1's will equate to Noughts, 2 will equate to Crosses..
        gameState = [0, 0, 0,
                     0, 0, 0,
                     0, 0, 0]
        
        
        
        // Loop through all of the buttons by their tag numbers (0...8) and if they exist...
        for counter in 0...8 {
        
            if let button = view.viewWithTag(counter) as? UIButton {
            
                
                // Clear the title of the button to return it to a blank game board..
                button.setTitle("", for: .normal)
            
            }
        
        }
        
        
        
        
        
        UIView.animate(withDuration: 1.0) {
            
            self.startGameView.center = CGPoint(x: self.view.center.x, y: (self.view.center.y + 500))
            self.startGameView.isHidden = true
            
        }
        
    }
    
    
    
    
    
    @IBAction func ticTacToe(_ sender: UIButton) {
        
        
        
//** CHECK THAT THE BOARD GAME SQUARE IS EMPTY **//
        
        
        // Create a variable 'activePosition which is equal to the current button's sender tag..
        let activePosition = sender.tag
        
        // Check to see if the button does not already have either a nought or cross in it, and that the game is still active (meaning nobody has already won..
        if gameState[activePosition] == 0 && activeGame == true {
        
            
            
            
            // Do the following code...
            
            
            
            
            
            // Change the value at the activePosition index point to be equal to the value which activePlayer currently has - either 1 or 2..
            gameState[activePosition] = activePlayer
            
            
            
            
// ** ENTER THE NOUGHT OR CROSS INTO THAT BOARD GAME SQUARE ** //
            
            // If it's player one's turn..
            if activePlayer == 1 {
            
                // Put a nought in the button and change it's colour to red
                sender.setTitle("O", for: .normal)
                sender.setTitleColor(.red, for: .normal)
                
                // Change activePlayer's value to 2 as player 2 will inevitably be next..
                activePlayer = 2
            
                
              
                
                
            // If it's player two's turn...
            } else {
            
                
                // Put a cross in the button and change it's colour to blue..
                sender.setTitle("X", for: .normal)
                sender.setTitleColor(.blue, for: .normal)
                
                // Change activePlayer's value to 1 as player 1 will inevitably be next...
                activePlayer = 1
            
            }
            
            
            
            
            // Test that it is working as planned.
            print(gameState)
            
            
            
            
            
// ** CHECK TO SEE IF ANY PLAYER HAS WON AFTER THEIR TURN ** //
            
            // Loop through each of the arrays in our winningCombinations array..
            for combination in winningCombinations {
            
                // Check that none of the first values in each of the arrays are 0, and therefore that none of the spaces are blank still...
                
                // AND..
                
                // Check to see if the first value in each array is equal to the second value in that array..
                
                // AND..
                
                // Check to see if the second value in each array is equal to the third value in that array..
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                
                    
                    // If all three of these conditions are met, it means that 1 of the winningCombinations arrays has all it's squares filled, and with the same value...either noughts or crosses!!
                    
                    
                    
// THEY HAVE WON!!!!!
    
                    // Game is no longer active, so no more noughts and crosses can be added..
                    activeGame = false
                    
             
                    
                    
// NOW TO SEE WHO HAS WON...
                    
                    // If the value of the first item in that winning array is equal to 1..
                    if gameState[combination[0]] == 1 {
                    
                     
                        
// NOUGHTS HAVE WON!!
                        
                        
                        // Update the resultLabel to let the user know that Player 1 has won, and inviting them to play again..
                        resultLabel.text = "Player 1 wins!!"
                        playAgainLabel.text = "Want another game?"
                        playAgainButton.setTitle("Play Again", for: .normal)
                        playAgainButton.setTitleColor(.red, for: .normal)
                        startGameView.backgroundColor = UIColor.red
                        
                        // View off the screen for an animation...
                        startGameView.center = CGPoint(x: view.center.x, y: (view.center.y + 500))
                        
                        // Animate the view onto the center of the screen..
                        UIView.animate(withDuration: 1.0) {
                            
                            self.startGameView.center = CGPoint(x: self.view.center.x, y: (self.view.center.y - 500))
                            self.startGameView.isHidden = false
                            
                        }

                        
                        
                        
                
                    // Otherwise the value of the first item in that winning array must be equal to 2...
                    } else {
                    
                        
                        
// CROSSES HAVE WON!!
                        
                        // Update the resultLabel to let the user know that Player 2 has won, and inviting them to play again..
                        resultLabel.text = "Player 2 wins!!"
                        playAgainLabel.text = "Want another game?"
                        playAgainButton.setTitle("Play Again", for: .normal)
                        playAgainButton.setTitleColor(.blue, for: .normal)
                        startGameView.backgroundColor = UIColor.blue
                        
                        // View off the screen for an animation...
                        startGameView.center = CGPoint(x: view.center.x, y: (view.center.y + 500))
                        
                        // Animate the view onto the center of the screen..
                        UIView.animate(withDuration: 1.0) {
                            
                            self.startGameView.center = CGPoint(x: self.view.center.x, y: (self.view.center.y - 500))
                            self.startGameView.isHidden = false
                        
                    
                        }
                    }
                }
            }
        }
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        startGameView.layer.cornerRadius = 5.0
        playAgainButton.layer.cornerRadius =  5.0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

