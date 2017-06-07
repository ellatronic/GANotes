//
//  LyricsViewController.swift
//  PassingDataLesson
//
//  Created by Wellington Moreno on 8/29/16.
//  Copyright © 2016 General Assembly. All rights reserved.
//

import Foundation
import UIKit

class LyricsViewController: UIViewController {
    
    @IBOutlet weak var songTitleLabel: UILabel!
    @IBOutlet weak var lyricsTextView: UITextView!
    
    
    private let lyrics: [String: String] = [
    
        "Lose Yourself" : Lyrics.loseYourself,
        "Beautiful" : Lyrics.beautiful,
        "Square Dance" : Lyrics.squareDance
    ]
    
    var selectedSong: Song!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let song = selectedSong
        else {
            songTitleLabel.text = ""
            return
        }
        songTitleLabel.text = song.title
        
        guard let songLyrics = lyrics[song.title]
        else {
            lyricsTextView.text = ""
            print("No Lyrics found for song: \(song.title)")
            return
        }
        lyricsTextView.text = songLyrics
        
    }
    
    
}
