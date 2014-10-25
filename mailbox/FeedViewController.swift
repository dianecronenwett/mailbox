//
//  FeedViewController.swift
//  mailbox
//
//  Created by diane cronenwett on 10/22/14.
//  Copyright (c) 2014 dianesorg. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImage: UIImageView!
    @IBOutlet weak var messageView: UIImageView!
    @IBOutlet weak var laterIcon: UIImageView!
    @IBOutlet weak var archiveIcon: UIImageView!
    @IBOutlet weak var imageContainer: UIView!
    var imageCenter: CGPoint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageCenter = messageView.center
        
        // Automatically calculates the size to find out how far it needs to scroll
        scrollView.delegate = self
        scrollView.contentSize = CGSize (width: 320, height:imageContainer.frame.height
        )
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    @IBAction func messageSwipe(sender: UIPanGestureRecognizer) {
       //println("Hi@")
       //the location of the user's finger "sender" in the view specified
        //translation is how far the user's finger is from the object, in this case message image
        var location = sender.locationInView(view)
        var translation = sender.translationInView(view)
        println("location\(location)")
        println("translation\(translation)")
        
        //
        if sender.state == UIGestureRecognizerState.Began {
          imageCenter = messageView.center
            
        } else if sender.state == UIGestureRecognizerState.Changed {
          messageView.center.x = imageCenter.x + translation.x

        
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
