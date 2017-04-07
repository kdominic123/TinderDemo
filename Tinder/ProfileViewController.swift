//
//  ProfileViewController.swift
//  Tinder
//
//  Created by Kenan Dominic on 4/6/17.
//  Copyright © 2017 Kenan Dominic. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    var pImage: UIImage!
    
    @IBOutlet weak var profileImage: UIImageView!
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        profileImage.image = pImage
        
        profileImage.image = pImage
    }

    @IBAction func onDone(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
