//
//  UniversityListPresenter.swift
//  DemoProject
//
//  Created by Mudassar Khalil on 01/06/2024.
//

import Foundation
import UIKit

class UniversityListPresenter: ViewToPresenterProtocol {
  

    var view: PresenterToViewProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    var router: PresenterToRouterProtocol?
    
    func startFetchingUniversityList() {
        interactor?.fetchUniversityList()
    }

}

extension UniversityListPresenter: InteractorToPresenterProtocol{
  
    func universityFetchedSuccess(universityModelArray: [UniversityLocalModel]) {
        view?.showList(universityArray: universityModelArray)
        
    }
    
    func universityFetchFailed(universityModelArray: [UniversityLocalModel]) {
        view?.showError(universityArray: universityModelArray)
    }
    
    
}

