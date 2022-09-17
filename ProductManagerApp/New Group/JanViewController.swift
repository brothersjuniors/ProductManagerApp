//
//  JanViewController.swift
//  ProductManagerApp
//
//  Created by 近江伸一 on 2022/09/17.
//

import UIKit
class JanViewController: UIViewController{
    var item = Item()

    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var itemLabel: UILabel!


    @IBOutlet weak var caplabel: UILabel!

    @IBOutlet weak var makeLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = UIImage(named: item.image ?? "")
        itemLabel.text = item.name
        caplabel.text = item.capacity
        makeLabel.text = item.maker


    }
}
