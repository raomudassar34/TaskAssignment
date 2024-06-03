//
//  UniversityListInteractor.swift
//  DemoProject
//
//  Created by Mudassar Khalil on 01/06/2024.
//

import Foundation
import Alamofire
import ObjectMapper

class UniversityListInteractor: PresenterToInteractorProtocol{
 
    var presenter: InteractorToPresenterProtocol?
    
    func fetchUniversityList() {
        AF.request(API_UNIVERSITY_LIST).responseJSON { response in
            switch response.result {
                case .success(let value):
                guard let arrayObject = Mapper<UniversityModel>().mapArray(JSONObject: value) else { return }
                DatabaseManager().openDatabse(universityArray: arrayObject)
                let uniDataArray =  DatabaseManager().fetchUniversitesData()
                self.presenter?.universityFetchedSuccess(universityModelArray: uniDataArray)
                case .failure(_):
                let uniDataArray =  DatabaseManager().fetchUniversitesData()
                self.presenter?.universityFetchFailed(universityModelArray: uniDataArray)
            }
        }
    }
}

