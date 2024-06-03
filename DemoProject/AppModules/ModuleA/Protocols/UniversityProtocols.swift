//
//  UniversityProtocols.swift
//  DemoProject
//
//  Created by Mudassar Khalil on 01/06/2024.
//

import Foundation
import UIKit

protocol ViewToPresenterProtocol: AnyObject {
    
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func startFetchingUniversityList()

}

protocol PresenterToViewProtocol: AnyObject {
    func showList(universityArray:[UniversityLocalModel])
    func showError(universityArray: [UniversityLocalModel])
}

protocol PresenterToRouterProtocol: AnyObject  {
    static func createModule(ref: UniversityListVC)
}

protocol PresenterToInteractorProtocol: AnyObject {
    var presenter:InteractorToPresenterProtocol? {get set}
    func fetchUniversityList()
}

protocol InteractorToPresenterProtocol: AnyObject {
    func universityFetchedSuccess(universityModelArray: [UniversityLocalModel])
    func universityFetchFailed(universityModelArray: [UniversityLocalModel])
}

