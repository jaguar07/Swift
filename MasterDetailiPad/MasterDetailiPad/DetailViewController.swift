//
//  DetailViewController.swift
//  MasterDetailiPad
//
//  Created by Carlos Butron on 07/12/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var detailImage: UIImageView!


    var detailItem: Listado? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail: Listado = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.nombre
                detailImage.image = UIImage (named: "\(detail.imagen)")
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

