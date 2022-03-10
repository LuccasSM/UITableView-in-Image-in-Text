//
//  ViewController.swift
//  UITableView-image
//
//  Created by Luccas Santana Marinho on 09/03/22.
//

import UIKit

struct listData {
    var name: String
    var description: String
    var image: UIImage
}

class ViewController: UIViewController {
    
    fileprivate var data = [
        listData(name: "Santander Master", description: "Tenha 10 dias sem juros no limite da conta", image: Image.primeiraImg),
        listData(name: "Cartão de crédito", description: "Fique livre da anuidade, ganhe pontos e muito mais", image: Image.segundaImg),
        listData(name: "Facilidade do Pix", description: "Pague, receba e transfira em segundos", image: Image.terceiraImg),
    ]
    
    private lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .plain)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.showsHorizontalScrollIndicator = false
        tv.tableFooterView = UIView(frame: .zero)
        tv.delegate = self
        tv.dataSource = self
        tv.bounces = true
        
        tv.register(ListCell.self, forCellReuseIdentifier: "listCell")
        
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        setupConstraint()
    }
    
    func setupConstraint() {
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.tableView.alwaysBounceVertical = false
        self.tableView.alwaysBounceHorizontal = false
        self.tableView.separatorStyle = .none;
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! ListCell
        
        cell.data = self.data[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
}
