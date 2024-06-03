//
//  UniversityDetailPresenter.swift
//  DemoProject
//
//  Created by Mudassar Khalil on 02/06/2024.
//

import Foundation
import UIKit

class UniversityDetailPresenter: ViewToPresenterDetailProtocol {
  
    var view: PresenterToViewDetailProtocol?
    
    var interactor: PresenterToInteractorDetailProtocol?
    
    var router: PresenterToRouterDetailProtocol?
    
    func startFetchUniversityData() {
        interactor?.fetchUniversityData()
    }

}

extension UniversityDetailPresenter: InteractorToPresenterDetailProtocol{
  
    func universityFetchedSuccess(universityObj: UniversityLocalModel) {
        view?.showData(universityObj: universityObj)
        
    }
    
    func universityFetchFailed(response: String) {
        view?.showError(response: response)
    }
    
    
}
