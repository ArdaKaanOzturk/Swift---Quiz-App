//
//  QuizBrain.swift
//  ArdaKaanOzturk_23MY93008_SinavUygulamasi
//
//  Created by Arda Kaan Öztürk on 19.04.2024.
//

import Foundation
import UIKit

let atlasImage = UIImage(named: "atlas")
let egeDeniziImage = UIImage(named: "ege-denizi")
let ayImage = UIImage(named: "ay")
let istanbulImage = UIImage(named: "istanbul")
let eiffelImage = UIImage(named: "eiffel")

struct QuizData{
     let questions = [
        Question(text: "Dünyanın en büyük okyanusu Atlas Okyanusu'dur.", answer:"YANLIŞ", color: UIColor.black, image:atlasImage!),
        
        Question(text: "'Ege Denizi' adı verilen deniz, Akdeniz'in bir parçasıdır.", answer:"DOĞRU", color: UIColor.black, image:egeDeniziImage!),
        
        Question(text: "Ay, Dünya'nın tek doğal uydusudur.", answer:"DOĞRU", color: UIColor.black, image:ayImage!),
        
        Question(text: "İstanbul, Türkiye'nin başkenti şehridir.", answer:"YANLIŞ", color: UIColor.black, image:istanbulImage!),
        
        Question(text: "Eiffel Kulesi, Paris'te bulunur.", answer:"DOĞRU", color: UIColor.black, image:eiffelImage!)
        
     ]
    
    var numQuestion = 0
    var score = 0
    
    mutating func checkAnswer(userAnswer: String) -> Bool{
        if userAnswer == questions[numQuestion].answer{
            score += 1
            return true
        }else{
            return false
        }
    }
    
    func getScore() -> Int{
        return score
    }
    
    func getTextQuestion() -> String{
        return questions[numQuestion].text
    }
    
    func getProgress() -> Float{
        let progress = Float(numQuestion + 1) / Float(questions.count)
        return progress
    }
    
    func getColor() -> UIColor{
        return questions[numQuestion].color
    }
    
    func getImage() -> UIImage{
        return questions[numQuestion].image
    }
    
    mutating func nextQuestion() ->Bool{
        if numQuestion + 1 < questions.count{
            numQuestion += 1
            return false
        }else{
            numQuestion = 0
            return true
        }
    }
}
