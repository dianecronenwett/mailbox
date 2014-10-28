//
//  FeedViewController.swift
//  mailbox
//
//  Created by diane cronenwett on 10/22/14.
//  Copyright (c) 2014 dianesorg. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UIScrollViewDelegate, UIGestureRecognizerDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImage: UIImageView!
    @IBOutlet weak var messageView: UIImageView!
    @IBOutlet weak var laterIcon: UIImageView!
    @IBOutlet weak var archiveIcon: UIImageView!
    @IBOutlet weak var imageContainer: UIView!
    @IBOutlet weak var rescheduleImage: UIImageView!
    var imageCenter: CGPoint!
    
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageCenter = messageView.center
        
        // Automatically calculates the size to find out how far it needs to scroll
        scrollView.delegate = self
        scrollView.contentSize = CGSize (width: 320, height:imageContainer.frame.height
        )
        rescheduleImage.alpha = 0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    @IBAction func messageSwipe(sender: UIPanGestureRecognizer) {
       //println("Hi@")
       //the location of the user's finger "sender" in the view specified
        //translation is how far the user's finger is from the object, in this case message image
        //velocity is how fast the finger is moving
        var location = sender.locationInView(view)
        var translation = sender.translationInView(view)
        var velocity = sender.velocityInView(view)
        
       //println("location\(location)")
     //  println("translation\(translation)")
       // println("velocity\(velocity)")
        //
        if sender.state == UIGestureRecognizerState.Began {
          imageCenter = messageView.center
            
           
            
        } else if sender.state == UIGestureRecognizerState.Changed {
          messageView.center.x = imageCenter.x + translation.x
        
          
            imageContainer.backgroundColor = UIColor(red: 223/255.0, green: 223/255.0, blue: 223/255.0, alpha: 1)
             laterIcon.alpha = 1
             archiveIcon.alpha = 1
            
            if messageView.frame.origin.x < -235 {
                imageContainer.backgroundColor = UIColor(red: 206/255.0, green: 150/255.0, blue: 98/255.0, alpha: 1)
                
                UIView.animateWithDuration(1, delay: 0.5, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: nil, animations: { () -> Void in
                    self.rescheduleImage.alpha = 1
                    
                    }) { (finished: Bool) -> Void in
 }
                
            } else if messageView.frame.origin.x > 60 && messageView.frame.origin.x <= 160 {
                //red
                imageContainer.backgroundColor = UIColor(red: 228/255.0, green: 61/255.0, blue: 39/255.0, alpha: 1)
                archiveIcon.alpha = 0.7
                
                
            } else if messageView.frame.origin.x > 160 {
                imageContainer.backgroundColor = (UIColor.blackColor())
               
            } else if messageView.frame.origin.x < -260 {
                imageContainer.backgroundColor = (UIColor.blueColor())
                
            } else if messageView.frame.origin.x < -60 {
                imageContainer.backgroundColor = UIColor(red: 248/255.0, green: 203/255.0, blue: 39/255.0, alpha: 1)
                laterIcon.alpha = 0.7
                
                
                
        } else if sender.state == UIGestureRecognizerState.Ended {
            
                
        }
           
            
    }
        
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
    @IBAction func onTap(sender: UITapGestureRecognizer) {
        println("tapped")
        
        messageView.alpha = 0
        rescheduleImage.alpha = 0
       archiveIcon.alpha = 0
//        imageContainer.backgroundColor = (UIColor.yellowColor())
//        feedImage.animationDuration = 0.2
//        feedImage.frame.origin.y = 132
       UIView.animateWithDuration(0.5, animations: {() -> Void in
          self.feedImage.frame.origin.y = 132
            self.imageContainer.backgroundColor = UIColor(red: 248/255.0, green: 203/255.0, blue: 39/255.0, alpha: 0.5)
       })
    
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer!, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer!) -> Bool {
        return true
    }
    }
    



