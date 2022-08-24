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

    var employees: [Employees]?

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = SortedNames.shared.sortedArrayOfNames.first
//        phoneLabel.text = "\(result?.company.employees.phone_number)"



    }
    



}
