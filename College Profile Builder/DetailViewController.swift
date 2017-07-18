//
//  DetailViewController.swift
//  College Profile Builder
//
//  Created by David Kirson on 7/16/17.
//  Copyright © 2017 David Kirson. All rights reserved.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController, SFSafariViewControllerDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var enrollmentTextField: UITextField!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func onTappedGoButton(_ sender: UIButton){
        let url = NSURL(string: urlTextField.text!)!
        let svc = SFSafariViewController(url: url as URL)
        present(svc, animated: true, completion: nil)
        
    }
    @IBAction func onTappedSaveButton(_ sender: Any) {
        if let college = self.detailItem {
            college.name = nameTextField.text!
            college.location = locationTextField.text!
            college.enrollment = Int(enrollmentTextField.text!)!
            college.webAddress = urlTextField.text!
            college.image = UIImagePNGRepresentation(imageView.image!)!
        }
        
    }
    
    
    var detailItem: College? {
        didSet {
            // Update the view.
            configureView()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func configureView() {
        // Update the user interface for the detail item
        if let college = self.detailItem {
            if nameTextField != nil {
                nameTextField.text = college.name
                locationTextField.text = college.location
                enrollmentTextField.text = String(college.enrollment)
                urlTextField.text = "https://" + college.webAddress
                imageView.image = UIImage(data: college.image)
            }
        }
    }


}

