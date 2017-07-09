//
//  ViewController.swift
//  fra
//
//  Created by Kittipol Munkatitum on 5/28/2560 BE.
//  Copyright © 2560 Kittipol Munkatitum. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource {
    var player : AVAudioPlayer?
    let array = [
        "Lisa: SOS!!My night has been a Blue's Clues marathon since 6",
        "Olivia: at least you're getting paid for babysitting the brats",
        "Lisa: but I'd rather be out",
        "Olivia: how much are you making?",
        "Olivia: Sean's party isn't that great",
        "Lisa: hhhhmmm I think 50 or 60ÖI don't even know",
        "Olivia: when will you b free?maybe you can come later?",
        "Lisa: idk,parents were vague",
        "Olivia: bummer",
        "Lisa: who else is at the party?",
        "Olivia: Petey,ROB,Mike,Michelle.UGH!She's all cover Sean",
        "Lisa: Are you still into him?",
        "Olivia: MAYBE",
        "Olivia: lol yes",
        "Lisa: hey brb gotta check on the kids",
        "one hour later",
        "Lisa: SERIOUS SOS!!!I can't find the kids",
        "Lisa: They disappeared",
        "Lisa: I've checked everywhere",
        "Olivia: everywhere?what about cabinets or closets?the dryer?",
        "Lisa: it tooks like a tornado hit the houseÖI've checked everywhere",
        "Lisa: And there's a window open in the bathroom",
        "Lisa: Can a 6 and 4 year old crawl out a window?",
        "Olivia: Is there a screen on the window?",
        "Lisa: No",
        "Lisa: Who loses children?",
        "Olivia: They ran awayÖdifferent story",
        "Lisa: Olivia.THIS IS SERIOUS",
        "Lisa: I'm in charge of someone else's kids",
        "Lisa: If I call the parents I won't get paid",
        "Lisa: And if I call my parentsÖI'm going to be grounded for life",
        "Olivia: make sure you close that window",
        "Olivia: You sure you searched everywhere?",
        "Olivia: eeeewwww Sean and Michelle are makig out!",
        "Lisa: FOCUS.THERE ARE KIDS MISSING",
        "Lisa: window closed now what?",
        "Olivia: time for an amber alert?",
        "Lisa: if I call the police won't they notify the parents?",
        "Olivia: hhhmmmmÖ..kids missing ,cops called?Alert parental units?Nah",
        "Olivia: OF COURSE THEY'LL NOTIFY THE PARENTS",
        "Lisa: I'm talking a flashlight and looking around outside",
        "Olivia: Good luck",
        "Lisa: Also your sarcasm isn't helping",
        "Olivia: Not into comic relief?",
        "Lisa: no",
        "Lisa: if you were a kid where would you hideÖor run away to?",
        "Olivia: maybe a friend's",
        "Lisa: their best friends live next door",
        "Lisa: do you think I can spin this into an intense game of hide and seek for the neighbors?",
        "Olivia: no",
        "Lisa: I'm going to try",
        "Olivia: of course",
        "Lisa: THE NEIGHBORS AREN'T HOMEl",
        "Lisa: I'm going to check the backyard",
        "Lisa: They have a pool",
        "Lisa: What if they drowned???",
        "Olivia: Please stop assuming the worst",
        "Olivia: I promise that's not helping",
        "Lisa: There's a tree house",
        "Lisa: cross your fingers they're in the tree house and NOT in the pool",
        "Olivia: you got it",
        "Lisa: THEY AREN'T OUTSIDE",
        "Lisa: should I check inside again?",
        "Olivia: I say this with love",
        "Olivia: CALL THE POLICE",
        "Olivia: OR THEIR PARENTS",
        "Olivia: when was the last time you saw them?",
        "Olivia: the longer you waitÖthe harder it may be to find them",
        "Lisa: ?? ??",
        "Lisa: I'll check inside one more time and then call",
        "Lisa: IM NEVER BABYSITTING AGAIN",
        "Lisa: I left the door open",
        "Lisa: and there's food all over the kitchen and cabinet open",
        "Lisa: ÖI think food is missing too",
        "Lisa: and a laptop is gonee",
        "Lisa: someone could have broken in and taken the kids after all",
        "Olivia: you need to call the cops",
        "restart",
        "Lisa:  OK",
        "restart"
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

