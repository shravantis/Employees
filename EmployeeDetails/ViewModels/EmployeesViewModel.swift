//
//  EmployeesViewModel.swift
//  EmployeeDetails
//
//  Created by qrl_dev on 28/09/23.
//

import UIKit

class EmployeesViewModel: NSObject {
  
   var serviceUrl: String!
  
  
  override init() {
    
  }
  
  func getEmployeeDetails(completion: @escaping (Employees) -> ()) {
    // make network call
    let url = URL(string: serviceUrl)!
    URLSession.shared.dataTask(with: URLRequest(url: url)) { data, URLResponse, error in
      
      if let data = data {
        let jsonDecoder = JSONDecoder()
        let empData = try! jsonDecoder.decode(Employees.self, from: data)
        completion(empData)
      }
    }.resume()
    
    
  }

}
