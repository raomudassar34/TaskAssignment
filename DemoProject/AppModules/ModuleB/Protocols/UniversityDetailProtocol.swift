//
//  UniversityDetailProtocol.swift
//  DemoProject
//
//  Created by Mudassar Khalil on 02/06/2024.
//

import Foundation
import UIKit

protocol ViewToPresenterDetailProtocol: AnyObject {
    
    var view: PresenterToViewDetailProtocol? {get set}
    var interactor: PresenterToInteractorDetailProtocol? {get set}
    var router: PresenterToRouterDetailProtocol? {get set}
    func startFetchUniversityData()

}

protocol PresenterToViewDetailProtocol: AnyObject {
    func showData(universityObj:UniversityLocalModel)
    func showError(response: String)
}

protocol PresenterToRouterDetailProtocol: AnyObject  {
    static func createDetailModule(ref: UniversityDetailVC)
}

protocol PresenterToInteractorDetailProtocol: AnyObject {
    var presenter:InteractorToPresenterDetailProtocol? {get set}
    func fetchUniversityData()
}

protocol InteractorToPresenterDetailProtocol: AnyObject {
    func universityFetchedSuccess(universityObj: UniversityLocalModel)
    func universityFetchFailed(response: String)
}
