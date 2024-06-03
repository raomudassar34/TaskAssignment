//
//  UniversityDetailRouter.swift
//  DemoProject
//
//  Created by Mudassar Khalil on 02/06/2024.
//

import Foundation
import UIKit

class UniversityDetailRouter: PresenterToRouterDetailProtocol {

    static func createDetailModule(ref: UniversityDetailVC) {
        let presenter = UniversityDetailPresenter()
        ref.presentor = presenter
        ref.presentor?.interactor = UniversityDetailInteractor()
        ref.presentor?.view = ref
        ref.presentor?.interactor?.presenter = presenter
    }

}
