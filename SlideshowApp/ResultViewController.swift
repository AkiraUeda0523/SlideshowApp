//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 上田晃 on 2021/03/04.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet weak var ZoomImage: UIImageView!
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ZoomImage.image = self.image
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
