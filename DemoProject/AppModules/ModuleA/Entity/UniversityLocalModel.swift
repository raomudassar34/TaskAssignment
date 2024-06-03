//
//  UniversityLocalModel.swift
//  DemoProject
//
//  Created by Mudassar Khalil on 02/06/2024.
//

import UIKit

class UniversityLocalModel: NSObject {
    
    var domains: String?
    var name: String?
    var web_pages: String?
    var alpha_two_code: String?
    var state_province: String?
    var country: String?
    
    init(domains: String, name: String, web_pages: String, alpha_two_code: String, state_province: String, country: String) {
        self.domains = domains
        self.name = name
        self.web_pages = web_pages
        self.alpha_two_code = alpha_two_code
        self.state_province = state_province
        self.country = country
    }
}
