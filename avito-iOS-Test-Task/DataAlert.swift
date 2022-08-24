//
//  DataAlert.swift
//  avito-iOS-Test-Task
//
//  Created by Дмитрий Скворцов on 22.08.2022.
//

import UIKit

struct DataAlert {
    
    weak var delegate: FetchDataViaJson?

    func parseJSONAgain() {
        delegate?.parseJSON(URLs.shared.stringUrl)
    }

    func fetchFailureAlert(on viewController: UIViewController, with title: String, message: String) {
        let fetchFailureAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        fetchFailureAlert.addAction(UIAlertAction(title: "Нет", style: .destructive, handler: { noAction in
            print("No Action")
        }))

        fetchFailureAlert.addAction(UIAlertAction(title: "Да", style: .default, handler: { action in
            parseJSONAgain()
        }))

        viewController.present(fetchFailureAlert, animated: true)
    }

    func showErrorAlert(on viewController: UIViewController, with title: String, message: String) {
        let showErrorAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        showErrorAlert.addAction(UIAlertAction(title: "Ок", style: .default, handler: { action in
            parseJSONAgain()
        }))

        viewController.present(showErrorAlert, animated: true)
    }
}
