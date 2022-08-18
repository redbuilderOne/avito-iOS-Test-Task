//
//  ViewController Extension.swift
//  avito-iOS-Test-Task
//
//  Created by Дмитрий Скворцов on 17.08.2022.
//
 
import UIKit

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let result = result {
            return result.company.employees.count
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let text = result?.company.employees[indexPath.row].name
//        let text = SortedNames.shared.sortedArrayOfNames[indexPath.row]
        let text = sortedArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = text
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return result?.company.name
    }
}
