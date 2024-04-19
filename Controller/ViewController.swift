//
//  ViewController.swift
//  ArdaKaanOzturk_23MY93008_SinavUygulamasi
//
//  Created by Arda Kaan Öztürk on 5.04.2024.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var imageQuestion: UIImageView!
    @IBOutlet weak var textQuestion: UILabel!
    @IBOutlet weak var answerButton2: UIButton! //Dogru butonu
    @IBOutlet weak var answerButton3: UIButton! //Yanlis butonu
    @IBOutlet weak var progressQuiz: UIProgressView!
    
    var quizData = QuizData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        progressQuiz.progress = quizData.getProgress()
        
        imageQuestion.image = quizData.getImage()
        imageQuestion.layer.cornerRadius = 20
        imageQuestion.layer.masksToBounds = true
        
        textQuestion.text = quizData.getTextQuestion()
        textQuestion.textColor = quizData.getColor()
        scoreLabel.text = "Skor: \(quizData.getScore()) puan"
        
    }
    
    @IBAction func usersAnswerButtonTap(_ sender: UIButton) {
        let usersAnswer = sender.titleLabel?.text ?? "DOĞRU"
        //print("DEBUG: \(sender.titleLabel?.text)")
        
        let trueAnswer = quizData.checkAnswer(userAnswer: usersAnswer)
        
        if trueAnswer{
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
            
            //Yanlis cevap
            let generator = UIImpactFeedbackGenerator(style: .heavy)
            generator.impactOccurred()
        }
        
        answerButton2.isEnabled = false
        answerButton3.isEnabled = false
        
        if quizData.nextQuestion(){
            let alert = UIAlertController(title: "Sınav Sona Erdi", message: "Tekrar Denemek İster Misiniz", preferredStyle: .alert)
            
            let yesAction = UIAlertAction(title: "Evet", style: .default){ _ in
                self.quizData.score = 0
                Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.changeQuestion) , userInfo: nil, repeats: false)
            }
            
            let noAction = UIAlertAction(title: "Hayır", style: .cancel){ _ in exit(0)}
            
            alert.addAction(yesAction)
            alert.addAction(noAction)
            present(alert, animated: true)
        }else{
            Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(changeQuestion) , userInfo: nil, repeats: false)
        }
        
        
    }
    
    @objc func changeQuestion(){
        textQuestion.text = quizData.getTextQuestion()
        textQuestion.textColor = quizData.getColor()
        
        imageQuestion.image = quizData.getImage()
        
        progressQuiz.progress = quizData.getProgress()
        
        scoreLabel.text = "Skor : \(quizData.getScore()) puan"
        
        answerButton2.backgroundColor = UIColor.white
        answerButton3.backgroundColor = UIColor.white
        
        answerButton2.isEnabled = true
        answerButton3.isEnabled = true
    }
    


}

