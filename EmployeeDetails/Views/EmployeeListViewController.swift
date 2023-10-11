//
//  EmployeeListViewController.swift
//  EmployeeDetails
//
//  Created by qrl_dev on 28/09/23.
//

import UIKit

class EmployeeListViewController: UIViewController {
  
  @IBOutlet weak var employeeListView: UITableView!
  private var employeeViewmodel : EmployeesViewModel!
  var employesArray: [Employe] = []

    override func viewDidLoad() {
        super.viewDidLoad()
      employeeListView.register(UINib(nibName: "EmployeeListCell", bundle: nil), forCellReuseIdentifier: "EmployeeListCell")
      showEmployeeDetails()
    }
  
  func showEmployeeDetails() {
    employeeViewmodel = EmployeesViewModel()
    employeeViewmodel.serviceUrl = "https://dummy.restapiexample.com/api/v1/employees"
    employeeViewmodel.getEmployeeDetails { employes in
      // load data here and update UI
      print("empployee data \(employes)")
      self.employesArray = employes.employeesData ?? []
      DispatchQueue.main.async {
        self.employeeListView.delegate = self
        self.employeeListView.dataSource = self
      }
    }
  }
  
  @IBAction func addEmployees(_ sender: UIButton) {
    
    
  }
    
}

extension EmployeeListViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    employesArray.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeListCell") as! EmployeeListCell
    let employe = employesArray[indexPath.row]
    cell.employeName.text = employe.employee_name
    cell.employeSalery.text = "\(employe.employee_salary ?? 0)"
    return cell
    
  }
  
  
}


