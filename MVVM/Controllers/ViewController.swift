//
//  ViewController.swift
//  MVVM
//
//  Created by jignesh solanki on 05/02/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var productsTblView: UITableView!
    @IBOutlet weak var btnHG: NSLayoutConstraint!
    @IBOutlet weak var btnGetProducts: UIButton!
    private let viewModel = UserViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        initViewModel()
    }

    func initViewModel() {
        viewModel.userDelegate = self
        
    }
    @IBAction func btnGetProduct(_ sender: Any) {
        btnHG.constant = 0
        viewModel.fetchProducts()
       
    }
    
}

extension ViewController: UserServices {

    func reloadData() {
       // DispatchQueue.main.async {
            self.productsTblView.reloadData()
            btnGetProducts.alpha = 0
       // }
    }
    
}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        else { return UITableViewCell() }
        var content = cell.defaultContentConfiguration()
        content.text = viewModel.products[indexPath.row].title
        cell.contentConfiguration = content
        cell.selectionStyle = .none
        return cell
    }

}
