//
//  CardsViewController.swift
//  Tinder
//
//  Created by Kenan Dominic on 4/6/17.
//  Copyright © 2017 Kenan Dominic. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var profileView: UIImageView!
    var image: UIImage!
    
    var cardInitialCenter: CGPoint!
    var initalTouch: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        image = UIImage(named: "ryan")
        profileView.image = image!
        
    }
    
    @IBAction func didPan(_ sender: UIPanGestureRecognizer) {
        
        print ("it comes here")
        
        let translation = sender.translation(in: view)
        initalTouch = sender.location(in: view)
        
        if sender.state == .began {
            
            cardInitialCenter = profileView.center
        }
        else if sender.state == .changed {
            
            if(initalTouch.y < profileView.frame.height/2 ) {
                
                profileView.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y)
                profileView.transform = CGAffineTransform(rotationAngle: CGFloat(Double(translation.x) * .pi / 560))
            }
            else {
                
                profileView.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y)
                profileView.transform = CGAffineTransform(rotationAngle: CGFloat(-1.0 * Double(translation.x) * .pi / 560))
            }
            if(translation.x > 175 || translation.x < -175) {
                
                UIView.animate(withDuration: 0.4, animations: {
                    self.profileView.alpha = 0
                })
            }
        }
        else if sender.state == .ended {
            
            profileView.center = CGPoint(x: cardInitialCenter.x, y: cardInitialCenter.y)
            profileView.transform = CGAffineTransform(rotationAngle: CGFloat(0.0))
        }
    }

    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        
        performSegue(withIdentifier: "profileSegue", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationViewController = segue.destination as! ProfileViewController
        destinationViewController.pImage = image
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    

}
