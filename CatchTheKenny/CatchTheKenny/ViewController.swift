//
//  ViewController.swift
//  CatchTheKenny
//
//  Created by Egemen on 4.01.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    var timer = Timer()
    var positionTimer = Timer()
    var score = 0
    var highScore: Int? = 0
    var counter = 0
    var positionX = [0.0]
    var positionY = [0.0]
    var alert : UIAlertController! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let height = view.frame.size.height
        //let width = view.frame.size.width
        
        let imageHeight = image.frame.size.height
        let imageWidth = image.frame.size.width
        
        positionX = [0.0]
        positionY = [0.0]
        
        alert = UIAlertController(title: "Time's Up", message: "Do you want to play again", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default){
            UIAlertAction in
                self.image.isUserInteractionEnabled = false
        })
        alert.addAction(UIAlertAction(title: "Replay", style: UIAlertAction.Style.default){
            UIAlertAction in
                self.startGame()
        })
        
        positionX = [10.0, imageWidth, imageWidth * 2]
        positionY = [height / 2 - imageHeight * 1.5, height / 2 - imageHeight * 0.5, height / 2 + imageHeight * 0.5, height / 2 + imageHeight * 0.5]
        image.frame.size = CGSize(width: self.view.frame.size.width/3, height: self.view.frame.size.height/5)
        
        if highScore != nil{
            highScoreLabel.text = "High Score: \(highScore ?? 0)"
        }
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageClicked))
        image.addGestureRecognizer(gestureRecognizer)
        
        startGame()
    }
    
    func startGame() {
        image.isUserInteractionEnabled = true
        counter = 10
        score = 0
        timeLabel.text = "\(counter)"
        scoreLabel.text = "Score \(score)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
        positionTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(changeImagePos), userInfo: nil, repeats: true)
        
    }
    @objc func countdown() {
        timeLabel.text = "\(counter)"
        counter -= 1
        if counter < 0 {
            timer.invalidate()
            positionTimer.invalidate()
            //self.present(alert, animated: true, completion: nil)
            present(alert, animated: true, completion: nil)
        }
    }
    @objc func imageClicked(){
        score += 1
        scoreLabel.text = "Score: \(score)"
    }
    
    @objc func changeImagePos(){
            image.frame.origin.x = positionX[Int.random(in: 0...2)]
            image.frame.origin.y = positionY[Int.random(in: 0...2)]
    }
}

