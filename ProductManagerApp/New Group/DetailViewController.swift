//
//  DetailViewController.swift
//  ProductManagerApp
//
//  Created by 近江伸一 on 2022/09/17.
//

import UIKit
class DetailViewController: UIViewController{
    var items:[Item] = []
    func handle(){items.append(Item(maker: "コカコーラ",name: "爽健美茶",capacity: "500ml",image:"souken"))

    }


    @IBOutlet weak var detailTbleView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        detailTbleView.delegate = self
        detailTbleView.dataSource = self
        handle()
    }



}
extension DetailViewController: UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = detailTbleView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ItemListCell
        cell.makerLabel.text = items[indexPath.row].maker
        cell.productLabel.text = items[indexPath.row].name
        cell.capacityLabel.text = items[indexPath.row].capacity
        cell.janImage.image = UIImage(named: items[indexPath.row].image!)
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailSegue" {
            if let indexPath = detailTbleView.indexPathForSelectedRow {
                guard let destination = segue.destination as? JanViewController else {
                    fatalError("Failed to prepare DetailViewController.")
                }
                destination.item = items[indexPath.row]
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        if let indexPath = detailTbleView.indexPathForSelectedRow{
            detailTbleView.deselectRow(at: indexPath, animated: true)
        }
    }
}



class ItemListCell: UITableViewCell{

    @IBOutlet weak var makerLabel: UILabel!
    
    @IBOutlet weak var productLabel: UILabel!

    @IBOutlet weak var capacityLabel: UILabel!

    @IBOutlet weak var janImage: UIImageView!


    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }


}
