//
//  HomeViewModel.swift
//  CRUD MVVM
//
//  Created by Ancarinha on 11/05/22.
//

import Foundation
//MARK: - protocol
protocol HomeViewModelDelegate: AnyObject {
    func reloadData()
    func onLogOutPoptoRoot()
    
    func onClickPushToPix()
}

protocol HomeViewModeling {
    var delegate: HomeViewModelDelegate? { get set }
    func reloadData()
    func popToRoot()
    
    func pushToPix()
}

struct OptionData{
    let imageTile: String
    let optionTitle: String
}

//MARK: - Class
final class HomeViewModel {
    // MARK: - init
    var optionInformation: [OptionData] = [
        .init(imageTile: "creditcard", optionTitle: "Meus Cartões"),
        .init(imageTile: "dollarsign.circle", optionTitle: "Empréstimos"),
        .init(imageTile: "iphone", optionTitle: "Recarga de celular"),
        .init(imageTile: "bag", optionTitle: "BankShopping"),
        .init(imageTile: "heart.text.square", optionTitle: "Seguro"),
        .init(imageTile: "square.and.pencil", optionTitle: "Editar dados"),
        .init(imageTile: "rectangle.portrait.and.arrow.right", optionTitle: "Sair")
    ]
    
    weak var delegate: HomeViewModelDelegate?
    //var coreDataService = CoreDataService()
    //var coreDataPìxService = CoreDataPixService()
    
    var hide: Bool = false
    
    //MARK: - header elements text
    //let greetingsText = "Olá, \(clients[loginIndex].name)"
    //let balanceText = "R$\(String(format: "%.2f", clients[loginIndex].balance))"
    //let accountText = "Conta: \(String(clients[loginIndex].account))"
    
    //MARK: - hideBalance func
    func hideBalanceToggle() {
        hide.toggle()
    }
    
    //MARK: - logout
    func logOut(){
        
    }
    
    //MARK: - fetchdata
    func fetchData(){
        //coreDataService.fetchData()
    }
    
    func fetchPixData(){
        //coreDataPìxService.fetchData()
    }
    
    //MARK: - Gotopix
    func goToPix(){
        
    }
}

extension HomeViewModel: HomeViewModeling {
    func pushToPix() {
        self.delegate?.onClickPushToPix()
    }
    
    func popToRoot() {
        self.delegate?.onLogOutPoptoRoot()
    }
    
    func reloadData() {
        delegate?.reloadData()
    }
}
