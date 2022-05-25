//
//  RegisterViewController.swift
//  CRUD MVVM
//
//  Created by user210203 on 4/28/22.
//

import UIKit

class RegisterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    // view model's type, declaration on init
    let viewModel: RegisterViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Criar Conta"
        view.backgroundColor = .white
        
        setupTableView()
    }
    
    // MARK: - setup TableView
    let tableView = UITableView(frame: .zero, style: .grouped)
    private func setupTableView(){
        //table view
        
        self.view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(RegisterTableViewCell.self, forCellReuseIdentifier: RegisterTableViewCell.reuseId)
        tableView.register(RegisterDatePickerTableViewCell.self, forCellReuseIdentifier: RegisterDatePickerTableViewCell.reuseId)
        tableView.register(RegisterPickerTableViewCell.self, forCellReuseIdentifier: RegisterPickerTableViewCell.reuseId)
        
        tableView.reloadData()
    }
    
    // MARK: - View Lifecycle
    init(viewModel: RegisterViewModel = RegisterViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - TableView Functions
extension RegisterViewController {
    // MARK: - Footer
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = RegisterFooterView()
        footer.viewModel = viewModel
        return footer
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        RegisterFooterView.height
    }
    
    // MARK: - Rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.registerInformation.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        45
    }
    
    // MARK: - Cell, SetupCell, TextfieldData
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RegisterDatePickerTableViewCell.reuseId, for: indexPath) as? RegisterDatePickerTableViewCell else {
                return UITableViewCell()}
            //textfielddata
            cell.registerTextField.tag = indexPath.row
            cell.registerTextField.delegate = self
            let info = viewModel.registerInformation[indexPath.row]
            cell.setupView(viewModel: viewModel ,title: info.title, placeholder: info.placeholder, keyboardType: info.keyboardType)
            return cell
            
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RegisterPickerTableViewCell.reuseId, for: indexPath) as? RegisterPickerTableViewCell else {
                return UITableViewCell()}
            //textfielddata
            cell.registerTextField.tag = indexPath.row
            cell.registerTextField.delegate = self
            let info = viewModel.registerInformation[indexPath.row]
            cell.setupView(viewModel: self.viewModel, title: info.title, placeholder: info.placeholder, keyboardType: info.keyboardType)
            return cell
            
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RegisterTableViewCell.reuseId, for: indexPath) as? RegisterTableViewCell else {
                return UITableViewCell()}
            //textfielddata
            cell.registerTextField.tag = indexPath.row
            cell.registerTextField.delegate = self
            let info = viewModel.registerInformation[indexPath.row]
            cell.setupView(title: info.title, placeholder: info.placeholder, keyboardType: info.keyboardType, isSecure: info.isSecure)
            return cell
        }
    }
    
    //textfield did begin editing
    func textFieldDidChangeSelection(_ textField: UITextField) {
        additionalCellTextFieldSetup(textField)
    }
    func textFieldDidBeginEditing(_ textField: UITextField){
        textField.addTarget(self, action: #selector(valueChanged), for: .editingChanged)
        additionalCellTextFieldSetup(textField)
    }
    
}

extension RegisterViewController{
    //MARK: - Textfields
    // ENUM
    enum textFieldData: Int{
        case nameTextField
        case cpfTextField
        case birthDateTextField
        case emailTextField
        case monthlyIncomeTextField
        case netWorthTextField
        case passwordTextField
        case confirmPasswordTextField
    }
    
    // Value Changed
    @objc func valueChanged(_ textField: UITextField){
        switch textField.tag{
        case textFieldData.nameTextField.rawValue:
            viewModel.newClientName = textField.text ?? ""
            
        case textFieldData.cpfTextField.rawValue:
            viewModel.newClientCpf = textField.text ?? ""
            
        case textFieldData.birthDateTextField.rawValue:
            viewModel.newClientBirthDate = textField.text ?? ""
            
        case textFieldData.emailTextField.rawValue:
            viewModel.newClientEmail = textField.text ?? ""
            
        case textFieldData.monthlyIncomeTextField.rawValue:
            viewModel.newClientMonthlyIncome = textField.text ?? ""
            
        case textFieldData.netWorthTextField.rawValue:
            viewModel.newClientNetWorth = textField.text ?? ""
            
        case textFieldData.passwordTextField.rawValue:
            viewModel.newClientPassword = textField.text ?? ""
            
        case textFieldData.confirmPasswordTextField.rawValue:
            viewModel.newClientCOnfirmPassword = textField.text ?? ""
            
        default:
            break
        }
    }
    
    //MARK: - Additional textfield setup
    func additionalCellTextFieldSetup(_ textField: UITextField?) {
        switch textField?.tag{
        case textFieldData.cpfTextField.rawValue:
            textField?.text = textField?.text?.formatMask(mask: "###.###.###-##")
        default:
            break
        }
    }
}

extension String {
    
    func formatMask(mask: String) -> String {
        let cleanField = components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        
        var result = ""
        var startIndex = cleanField.startIndex
        let endIndex = cleanField.endIndex
        
        for ch in mask where startIndex < endIndex {
            if ch == "#" {
                result.append(cleanField[startIndex])
                startIndex = cleanField.index(after: startIndex)
            } else {
                result.append(ch)
            }
        }
        
        return result
    }
    
    func clearFormatMask() -> String{
        return components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }
    
}

//MARK: = Delegate: Alert/FetchSuccess
extension RegisterViewController: RegisterViewModelDelegate {
    func onSuccessPushView() {
        let homeViewController = HomeViewController()
        self.navigationController?.pushViewController(homeViewController, animated: true)
    }
    
    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    func displayAlertWithAction(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(alert: UIAlertAction!) in self.onSuccessPushView()}))
        present(alert, animated: true)
    }
    
    func onSuccessPopView() {
        self.navigationController?.popViewController(animated: true)
    }
}
