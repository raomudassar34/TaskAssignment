//
//  UniversityDetailInteractor.swift
//  DemoProject
//
//  Created by Mudassar Khalil on 02/06/2024.
//

import Foundation

class UniversityDetailInteractor: PresenterToInteractorDetailProtocol{
    
    var presenter: InteractorToPresenterDetailProtocol?
    
    func fetchUniversityData() {
       
        if let uniDataObj =  DatabaseManager().fetchUniversityData(name: name_Value){
            
            presenter?.universityFetchedSuccess(universityObj: uniDataObj)
        }else{
            presenter?.universityFetchFailed(response: "No data found")
        }
       
    }
}
