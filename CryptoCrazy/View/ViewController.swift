//
//  ViewController.swift
//  CryptoCrazy
//
//  Created by Burak Öztopuz on 2.07.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
  
    @IBOutlet var tableView: UITableView!
    private var cryptoListViewModel : CryptoListViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getData()
       
    }
    
    func getData(){
        let url = URL(string: "https://api.nomics.com/v1/currencies/ticker?key=fb2de3680cbcac921cdccfa5fb0d949f2ea7b5cc")!
        JsonService().downloadData(url: url) { (crypto) in
            if let crypto = crypto {
                self.cryptoListViewModel = CryptoListViewModel(cryptoCurrencyList: crypto)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoCell
        let cryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(indexPath.row)
        cell.priceLabel.text = cryptoViewModel.price
        cell.currencyCell.text = cryptoViewModel.name
        return cell
    }


}

