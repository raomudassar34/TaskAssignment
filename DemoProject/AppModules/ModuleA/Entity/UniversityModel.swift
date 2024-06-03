//
//  UniversityModel.swift
//  DemoProject
//
//  Created by Mudassar Khalil on 01/06/2024.
//

import Foundation
import ObjectMapper

struct UniversityModel: Mappable {
    var domains : [String]?
    var name : String?
    var web_pages : [String]?
    var alpha_two_code : String?
    var state_province : String?
    var country : String?

    init?(map: Map) {

    }

mutating func mapping(map: Map) {

        domains <- map["domains"]
        name <- map["name"]
        web_pages <- map["web_pages"]
        alpha_two_code <- map["alpha_two_code"]
        state_province <- map["state-province"]
        country <- map["country"]
    }

}
