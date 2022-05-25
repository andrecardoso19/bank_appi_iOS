//
//  Pix.swift
//  CRUD MVVM
//
//  Created by user217586 on 5/18/22.
//

import Foundation

struct Pix {
    var account: Int
    var agency: String = "1-9"
    var cpfKey: String
    var randomKey: String
    var phoneKey: String
    var copyPastePix: String
}

//var allPix: [Pix] = [Pix(account: 0, agency: "1-9", cpfKey: "", randomKey: "", phoneKey: "", copyPastePix: "")]
var allPix: [Pix] = []

var editPixIndex = -1
