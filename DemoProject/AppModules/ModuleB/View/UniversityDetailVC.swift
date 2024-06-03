//
//  UniversityDetailVC.swift
//  DemoProject
//
//  Created by Mudassar Khalil on 02/06/2024.
//

import UIKit

class UniversityDetailVC: UIViewController {
    
    var presentor: ViewToPresenterDetailProtocol?
    var resultObj: UniversityLocalModel!
    
    @IBOutlet weak var txtUniState: UILabel!
    @IBOutlet weak var txtUniName: UILabel!
    @IBOutlet weak var txtUniCountry: UILabel!
    @IBOutlet weak var txtUniCountryCode: UILabel!
    @IBOutlet weak var btnWebPage: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

       UniversityDetailRouter.createDetailModule(ref: self)
        presentor?.startFetchUniversityData()
        self.title = "Detail Screen"
    }
    

    @IBAction func openWeblink(_ sender: Any) {
        
        guard let url = URL(string: resultObj.web_pages ?? "") else {
          return //be safe
        }

        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    @IBAction func refreshListData(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name("reloadData"), object: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
}
extension UniversityDetailVC: PresenterToViewDetailProtocol {
    func showData(universityObj: UniversityLocalModel) {
        resultObj = universityObj
        self.txtUniName.text = universityObj.name
        self.txtUniState.text = universityObj.state_province
        self.txtUniCountry.text = universityObj.country
        self.txtUniCountryCode.text = universityObj.alpha_two_code
        btnWebPage.setTitle(universityObj.web_pages, for: .normal)
        
    }
    
    func showError(response: String) {
        let alert = UIAlertController(title: "Alert", message: response, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
  
    
}
