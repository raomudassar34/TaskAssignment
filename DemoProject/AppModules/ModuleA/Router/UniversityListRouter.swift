//
//  UniversityListRouter.swift
//  DemoProject
//
//  Created by Mudassar Khalil on 01/06/2024.
//

import Foundation
import UIKit

class UniversityListRouter: PresenterToRouterProtocol {
 
    static func createModule(ref: UniversityListVC) {
        let presenter = UniversityListPresenter()
        ref.presentor = presenter
        ref.presentor?.interactor = UniversityListInteractor()
        ref.presentor?.view = ref
        ref.presentor?.interactor?.presenter = presenter
    }
   
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"List",bundle: Bundle.main)
    }
    
    static var detailstoryboard: UIStoryboard{
        return UIStoryboard(name:"Detail",bundle: Bundle.main)
    }
    
}
