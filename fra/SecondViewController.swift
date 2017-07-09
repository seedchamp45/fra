//
//  SecondViewController.swift
//  chatstories
//
//  Created by Kittipol Munkatitum on 6/21/2560 BE.
//  Copyright © 2560 Kittipol Munkatitum. All rights reserved.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource {
    var player : AVAudioPlayer?
    let array = [
        "Sara - Did you hear that?",
        "Mom - Here what?",
        "Sara - There's a baby crying",
        "Mom - I'm not home",
        "Mom - Wait until I get back",
        "Sara - It's coming from the basement",
        "Mom - Don't go down there",
        "Sara - What? Why Not?",
        "Mom - There's something about your father I havent told you",
        "Sara - Mom, there's a baby I can hear it",
        "Mom - Honey, please ignore it until I get home",
        "Sara - How am I supposed to do that?!",
        "Sara - Its getting louder...",
        "Mom - Don't go down there",
        "Mom - I'm warning you",
        "Sara - OMG Mom",
        "Sara - Are you not grasping the situation here?!",
        "Sara - There is a random baby crying in th basement!",
        "Mom - I know",
        "Mom - Just stay in your room",
        "Sara - Hold on... I think it stopped",
        "Sara - I don't hear anything",
        "Mom - Good",
        "Sara - I'm going downstairs to check",
        "Mom - Honey please stay upstairs and wait for me!",
        "Sara - Mom, I'm not staying upstairs!",
        "Sara - I want to know what's going on",
        "Mom - You're so stubborn just like your father",
        "Mom - Where are you now",
        "Mom - Sara?",
        "Sara - It stopped",
        "Mom - What?",
        "Sara - The crying it just stopped suddenly",
        "Sara - I'm putting my ear up to the basement door",
        "Sara - Its totally quite down there",
        "Sara - Something doesn't feel right",
        "Sara - Why would the crying just stop?",
        "Mom -  I don't know the answer to that",
        "Sara - Do you know why there's a baby in the basement?!",
        "Mom - We'll talk when I get home",
        "Sara - Mom why are you being so elusive?",
        "Sara - I want to know what the hell is going on",
        "Mom -  soon",
        "five minutes later..",
        "Sara - Are you coming in or not?",
        "Mom - Huh? I'm still about 20 minutes away",
        "Sara - Didn't you just pull in the driveway?",
        "Mom - No",
        "Mom - why would you think that",
        "Sara  - I heard a car door slam about five minutes ago",
        "Mom -  That wasent me"
    ]
    @IBOutlet weak var show: UICollectionView!
    var i = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let slidenib = UINib(nibName: "View", bundle: nil)
        show.register(slidenib, forCellWithReuseIdentifier: "View")
        let swipeRight = UITapGestureRecognizer(target: self, action: #selector(self.tap))
        show.delegate = self
        show.dataSource = self
        
        self.view.addGestureRecognizer(swipeRight)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tap()   {
        i += 1
        self.playSound()
        if i > 5
        {
            self.viewScrollButton()
        }
        //        if i >= array.count
        //        {
        //            i = 0
        //        }
        print(i)
        show.reloadData()
    }
    
    func viewScrollButton() {
        let item = self.collectionView(self.show!, numberOfItemsInSection: 0) - 1
        let lastItemIndex = NSIndexPath(item: i-3, section: 0)
        show?.scrollToItem(at: lastItemIndex as IndexPath, at: UICollectionViewScrollPosition.top, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell:UICollectionViewCell?;
        
        //
        let slideCell = collectionView.dequeueReusableCell(withReuseIdentifier: "View", for: indexPath) as! View;
        slideCell.bbLabel.text = "\(array[indexPath.row])"
        cell = slideCell
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 120);
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if i >= (array.count)
        {
            i = 0
            return 0
        }
        return i
    }
    
    func playSound(){
        //TODO fix this!
        let path = Bundle.main.path(forResource: "Typing_On_Phone", ofType:"wav")!
        let url = URL(fileURLWithPath: path)
        
        do {
            let sound = try AVAudioPlayer(contentsOf: url)
            self.player = sound
            sound.numberOfLoops = 1
            sound.prepareToPlay()
            sound.play()
        } catch {
            print("error loading file")
            // couldn't load file :(
        }
        
        
    }
    
    
    
}

