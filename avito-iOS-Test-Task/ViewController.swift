//
//  ViewController.swift
//  avito-iOS-Test-Task
//
//  Created by Дмитрий Скворцов on 17.08.2022.
//

import UIKit

class ViewController: UIViewController {

    var result: Result?
    let stringUrl = "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c"
    var sortedArray: [String] = []

    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        parseJSON(stringUrl)
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func parseJSON(_ url: String) {
        guard let url = URL(string: stringUrl) else { return }
        
        do {
            let jsonData = try Data(contentsOf: url)
            result = try JSONDecoder().decode(Result.self, from: jsonData)

            if let result = result {
                for i in result.company.employees {
                    SortedNames.shared.sortedArrayOfNames.append(i.name)
                }
                sortedArray = SortedNames.shared.sortedArrayOfNames.sorted(by: <)

            } else {
                print("failed to parse result")
            }

        } catch {
            print("error \(error)")
        }
    }
}

