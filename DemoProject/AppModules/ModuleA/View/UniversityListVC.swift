//
//  UniversityListVC.swift
//  DemoProject
//
//  Created by Mudassar Khalil on 01/06/2024.
//

import UIKit

class UniversityListVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var presentor:ViewToPresenterProtocol?
    var listArrayList: [UniversityLocalModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UniversityListRouter.createModule(ref: self)
        presentor?.startFetchingUniversityList()
        showProgressIndicator(view: self.view)
        self.title = "List Screen"
        NotificationCenter.default.addObserver(self, selector: #selector(self.reloadData(notification:)), name: Notification.Name("reloadData"), object: nil)
    }
    
    deinit {
        
        NotificationCenter.default.removeObserver(self,
                           name:  NSNotification.Name ("reloadData") ,
                           object: nil)
    }
   
    
    @objc func reloadData(notification: Notification) {
        presentor?.startFetchingUniversityList()
        showProgressIndicator(view: self.view)
    }

}

extension UniversityListVC: PresenterToViewProtocol {

    func showList(universityArray: [UniversityLocalModel]) {
        hideProgressIndicator(view: self.view)
        listArrayList.removeAll()
        listArrayList = universityArray
        tableView.reloadData()

    }
    
    func showError(universityArray: [UniversityLocalModel]) {

        hideProgressIndicator(view: self.view)
        if universityArray.count > 0{
            listArrayList.removeAll()
            listArrayList = universityArray
            tableView.reloadData()
        }else{
            let alert = UIAlertController(title: "Alert", message: "Problem Fetching Notice", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
}
extension UniversityListVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArrayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

       let cell = tableView.dequeueReusableCell(withIdentifier: "UniversityCell", for: indexPath) as! UniversityCell
       cell.title.text = listArrayList[indexPath.row].name
       cell.state.text = listArrayList[indexPath.row].state_province ?? listArrayList[indexPath.row].country
        
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 89.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        name_Value = listArrayList[indexPath.row].name ?? ""
        self.performSegue(withIdentifier:"goToDetail" , sender: self)
    }
}

class UniversityCell: UITableViewCell {
   
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var state: UILabel!
    
}
