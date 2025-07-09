//
//  ViewController.swift
//  AluraViagens
//
//  Created by Flavia Vilar on 30/06/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viagensTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuraTableView()
        
        view.backgroundColor = UIColor(red: 30.0/255, green: 59.0/255, blue: 119.0/255, alpha: 1)
        viagensTableView.backgroundColor = .clear
      
    }
    
    func configuraTableView() {
        viagensTableView.register(UINib(nibName: "ViagemTableViewCell", bundle: nil), forCellReuseIdentifier: "ViagemTableViewCell")
        viagensTableView.dataSource = self
        viagensTableView.delegate = self
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sessaoDeViagens?[section].numeroDeLinhas ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let celulaViagem = tableView.dequeueReusableCell(withIdentifier: "ViagemTableViewCell") as? ViagemTableViewCell else {
            fatalError("error to create viagemTableViewCell")
        }
        
        let viewModel = sessaoDeViagens?[indexPath.section]
        
        switch viewModel?.tipo {
        case .destaques:
            celulaViagem.configuraCelula(viewModel?.viagens[indexPath.row])
            return celulaViagem
        default:
            return UITableViewCell()
        }
        
        
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = Bundle.main.loadNibNamed("HomeTableViewHeader", owner: self, options: nil)?.first as? HomeTableViewHeader
        headerView?.configuraView()
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
}
