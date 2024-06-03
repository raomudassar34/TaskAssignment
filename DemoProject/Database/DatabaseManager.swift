//
//  DatabaseManager.swift
//  DemoProject
//
//  Created by Mudassar Khalil on 02/06/2024.
//

import Foundation
import CoreData
import UIKit

class DatabaseManager {
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    var context:NSManagedObjectContext!
    
    func openDatabse(universityArray: Array<UniversityModel>)
    {
        context = appDelegate?.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "University", in: context)
        let newUniversity = NSManagedObject(entity: entity!, insertInto: context)
        for obj in universityArray {
            let params: [String: Any] = ["country":obj.country ?? "","domains":obj.domains?[0] ?? "", "name": obj.name ?? "", "state_province": obj.state_province ?? obj.country ?? "" ,"web_pages": obj.web_pages?[0] ?? "", "alpha_two_code": obj.alpha_two_code ?? ""]
            saveData(UserDBObj: newUniversity, linkObj: params)
        }
        
    }
    
    func saveData(UserDBObj: NSManagedObject, linkObj: [String: Any]) {
        context = appDelegate?.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "University")
        let name = linkObj["name"] as? String
        let namePredicate = NSPredicate(format: "name == %@", name ?? "")
        request.predicate = namePredicate
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            if result.count > 0{
            for data in result as! [NSManagedObject] {
                data.setValue(linkObj["state_province"] as? String, forKey: "state_province")
                data.setValue(linkObj["country"] as? String, forKey: "country")
                data.setValue(linkObj["domains"] as? String, forKey: "domains")
                data.setValue(linkObj["name"] as? String, forKey: "name")
                data.setValue(linkObj["web_pages"] as? String, forKey: "web_pages")
                data.setValue(linkObj["alpha_two_code"] as? String, forKey: "alpha_two_code")
            }
                do {
                    try self.context.save()
                } catch {
                    print("Storing data Failed")
                }
        
            }else{
                let entity = NSEntityDescription.entity(forEntityName: "University", in: context)
                let UserDBObj = NSManagedObject(entity: entity!, insertInto: context)
                UserDBObj.setValue(linkObj["state_province"] as? String, forKey: "state_province")
                UserDBObj.setValue(linkObj["country"] as? String, forKey: "country")
                UserDBObj.setValue(linkObj["domains"] as? String, forKey: "domains")
                UserDBObj.setValue(linkObj["name"] as? String, forKey: "name")
                UserDBObj.setValue(linkObj["web_pages"] as? String, forKey: "web_pages")
                UserDBObj.setValue(linkObj["alpha_two_code"] as? String, forKey: "alpha_two_code")
                do {
                    try self.context.save()
                } catch {
                    print("Storing data Failed")
                }
            }
        } catch {
            print("Fetching data Failed")
        }

    }
    
    func fetchUniversitesData() -> [UniversityLocalModel]
    {
        var resultArray: [UniversityLocalModel] = []
        context = appDelegate?.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "University")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            resultArray.removeAll()
            for data in result as! [NSManagedObject] {
                let country = data.value(forKey: "country") as? String
                let domains = data.value(forKey: "domains") as? String
                let name = data.value(forKey: "name") as? String
                let web_pages = data.value(forKey: "web_pages") as? String
                let alpha_two_code = data.value(forKey: "alpha_two_code") as? String
                let state_province = data.value(forKey: "state_province") as? String
                
                let obj = UniversityLocalModel(domains: domains ?? "", name: name ?? "", web_pages: web_pages ?? "", alpha_two_code: alpha_two_code ?? "", state_province: state_province ?? "", country: country ?? "")
                if name != nil{
                    resultArray.append(obj)
                }
            }
        } catch {
            print("Fetching data Failed")
        }
        return resultArray
    }
    
    func fetchUniversityData(name: String) -> UniversityLocalModel?
    {
        var resultArray: UniversityLocalModel!
        context = appDelegate?.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "University")
        let namePredicate = NSPredicate(format: "name == %@", name)
        request.predicate = namePredicate
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                let country = data.value(forKey: "country") as? String
                let domains = data.value(forKey: "domains") as? String
                let name = data.value(forKey: "name") as? String
                let web_pages = data.value(forKey: "web_pages") as? String
                let alpha_two_code = data.value(forKey: "alpha_two_code") as? String
                let state_province = data.value(forKey: "state_province") as? String
                
                let obj = UniversityLocalModel(domains: domains ?? "", name: name ?? "", web_pages: web_pages ?? "", alpha_two_code: alpha_two_code ?? "", state_province: state_province ?? "", country: country ?? "")
                if name != nil{
                    resultArray = obj
                }
            }
        } catch {
            print("Fetching data Failed")
        }
        return resultArray
    }
    
}
