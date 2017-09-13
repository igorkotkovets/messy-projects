//
//  BindViewController.swift
//  StackOverflowAnswers
//
//  Created by Igor Kotkovets on 9/13/17.
//  Copyright © 2017 Igor Kotkovets. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class BindViewController: UITableViewController {
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        let viewModel = ViewModel()
        bindRx(viewModel: viewModel)
    }

    func bindRx(viewModel: ViewModel) {
        viewModel.models.bind(to: tableView.rx.items(cellIdentifier: ModelTableViewCell.ReuseIdentifier,
                                                     cellType: ModelTableViewCell.self)) { (_, model: Model, cell: ModelTableViewCell) in
            cell.textLabel?.text = model.name
        }
        .addDisposableTo(disposeBag)
    }


}

class ModelTableViewCell: UITableViewCell {
    static let ReuseIdentifier = "Cell"
}

class ViewModel {
    var models: Observable<[Model]>

    init() {
        models = Observable.from(optional: [Model(id: "1", name: "First"), Model(id: "2", name: "Second")])
    }
}

struct Model {
    let id: String
    let name: String
}
