//
//  Result.swift
//  avito-iOS-Test-Task
//
//  Created by Дмитрий Скворцов on 17.08.2022.
//

import Foundation

struct Result: Codable {
    let company: Company
}

struct Company: Codable {
    let name: String
    let employees: [Employees]
}

struct Employees: Codable {
    var name: String
    var phone_number: String
    var skills: [String]
}

struct SortedNames {
    static var shared = SortedNames()

    var sortedArrayOfNames: [String] = []
    var phoneNumberArray: [String] = []
    var skillsArray: [[String]] = []
}
