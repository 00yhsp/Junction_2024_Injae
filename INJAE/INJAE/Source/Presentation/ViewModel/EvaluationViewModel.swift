//
//  EvaluationViewModel.swift
//  INJAE
//
//  Created by LeeWanJae on 11/10/24.
//

import Foundation

@Observable
final class EvaluationViewModel {
    var scores: [String: Int] = [:]
    
    var companyCulture = ["Collaborate", "Innovate", "Fast-paced", "Traditional", "Growth-Oriented"]
    var benefits = ["Health Insurance", "Paid time off", "Retirement plans or pension options", "Professional development", "Growth-Oriented"]
    var welfareProgram = ["Wellness Program", "Childcare Support", "Flexible working hours", "Travel or Transportation Subsidies"]
    var careerGrowthOpportunities = ["Mentorship Programs", "Structed Training", "Lateral moves within the company", "Rapid promotion pathaways", "International Rotation Programs"]
    
    func setScore(for item: String, score: Int) {
        scores[item] = score
    }
}
