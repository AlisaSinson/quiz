//
//  question.swift
//  Quizzer
//
//  Created by Алиса on 27.09.2024.
//

import Foundation

struct Question {
    let text: String
    let answer: String
    
    init(q: String, a: String) {
        text = q
        answer = a
    }
}
