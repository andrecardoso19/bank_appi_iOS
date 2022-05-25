//
//  Client.swift
//  CRUD MVVM
//
//  Created by user210203 on 4/28/22.
//

import Foundation

struct Client {
    var name: String
    var cpf: String
    var birthDate: String
    var email: String
    var monthlyIncome: String
    var netWorth: String
    var password: String
    var agency: String = "1-9"
    var balance: Double
    var account: Int
}
//teste alteração git2
// comentário git
// teste LULU
// teste luan


//var clients: [Client] = [Client(name: "", cpf: "", birthDate: "", email: "", monthlyIncome: "", netWorth: "", password: "", balance: 99.9)]
var clients: [Client] = []

//Login/Edit Index
var editIndex = 0
var loginIndex = 0
