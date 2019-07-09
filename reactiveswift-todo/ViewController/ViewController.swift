//
//  ViewController.swift
//  reactiveswift-todo
//
//  Created by Manami Ichikawa on 2019/07/06.
//  Copyright © 2019 Manami Ichikawa. All rights reserved.
//

import UIKit
import ReactiveSwift

final class ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.register(
                UINib(
                    nibName: "ToDoCell",
                    bundle: nil),
                forCellReuseIdentifier: "ToDoCell")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return 10 // TODO: fix
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "ToDoCell",
            for: indexPath) as! ToDoCell
        return cell
    }
}

