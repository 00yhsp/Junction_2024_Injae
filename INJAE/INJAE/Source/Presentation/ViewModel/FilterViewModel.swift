//
//  FilterViewModel.swift
//  INJAE
//
//  Created by LeeWanJae on 11/10/24.
//

import Foundation

@Observable
final class FilterViewModel {
    var selected: Bool = false
    
    var selectedIndustry: String = "Not selected"
    var selectedJob: String = "Not selected"
    var selectedLocation: String = "Not selected"
    var selectedWorking: String = "Not selected"
    var selectedCompanySize: String = "Not selected"
    var selectedCompanyCulture: String = "Not selected"
    var selectedBenefits: String = "Not selected"
    var selectedCareer: String = "Not selected"
    var selectedWelfare: String = "Not selected"
    
    var industries = [
        "Technology", "Healthcare", "Education", "Finance", "Manufacturing", "Arts & Entertainment", "Retail", "Environmental Services", "Telecommunications", "etc"]
    var jobs = ["Data Science", "Software Development", "Marketing", "Product Management", "Business Development", "Sales", "Human Resources", "Customer Support", "Operations", "etc"]
    var locations = ["Domestic locations", "International options"]
    var working = ["Fully on-site", "fully remote", "hybrid (both on-site and remote)", "flexible schedule options", "travel requirements"]
    var companysize = ["Startups", "mid-sized", "large corporations"]
    
    
    var companyCultures = ["collaborative", "innovative", "fast-paced", "traditional", "growth-oriented", "etc"]
    var benefits = ["Health insurance", "Paid time off", "Retirement plans or pension options", "Professional development or education allowances"]
    var welfare = ["Wellness programs", "Childcare support", "flexible working hours", "transportation subsidies", "housing assistance"]
    var career = ["Mentorship programs", "structured training", "lateral moves within the company", "rapid promotion pathways", "international rotation programs", "etc"]
    var emoji = ["building", "person", "mappin", "network", "arrow.up.left.and.down.right.and.arrow.up.right.and.down.left", "person.line.dotted.person", "heart","figure.run.treadmill", "chart.line.uptrend.xyaxis"]
}
