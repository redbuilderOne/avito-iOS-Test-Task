//
//  EmployeeViewController.swift
//  avito-iOS-Test-Task
//
//  Created by Дмитрий Скворцов on 18.08.2022.
//

import UIKit

class EmployeeViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var skillsLabel: UILabel!

    var sortedEmployees: Employees?

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = sortedEmployees?.name
//        phoneLabel.text = result?.company.employees.
//        skillsLabel.text = "\(employees?.skills)"
//        nameLabel.text = SortedNames.shared.sortedArrayOfNames.first
//        phoneLabel.text = SortedNames.shared.phoneNumberArray.first
//        phoneLabel.text = "\(result?.company.employees.phone_number)"



    }
    



}
