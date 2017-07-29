//
//  ListViewController.swift
//  RxMemoryManagement
//
//  Created by Igor Kotkovets on 7/29/17.
//  Copyright © 2017 Igor Kotkovets. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

struct MenuItem {
    let title: String?
}

class ListViewController: UIViewController {

    let disposeBag = DisposeBag()

    let menuItems: Observable<[MenuItem]> = {
        var list = [MenuItem]()
        list.append(MenuItem(title: "First"))
        list.append(MenuItem(title: "Second"))
        list.append(MenuItem(title: "Thrid"))
        list.append(MenuItem(title: "Logou"))
        return Observable.just(list)
    }()

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "MenuTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "Cell")

        menuItems
            .bind(to: tableView.rx.items) { (tableView, row, element) in
                let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
                cell.textLabel?.text = "\(element) @ row \(row)"
                return cell
            }
            .disposed(by: disposeBag)

        tableView.rx.modelSelected(MenuItem.self)
            .subscribe(onNext: { [unowned self] _ in
                self.navigationController?.popViewController(animated: true)
            })
        .addDisposableTo(disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
