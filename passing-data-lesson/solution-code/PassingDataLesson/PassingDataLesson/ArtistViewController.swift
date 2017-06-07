//
//  ViewController.swift
//  TableViewLab
//
//  Created by Wellington Moreno on 7/1/16.
//  Copyright © 2016 General Assembly. All rights reserved.
//

import UIKit

class ArtistViewController: UITableViewController {

    
    private let songs: [Song] = [
        Song(title: "Lose Yourself", album: "8 Mile"),
        Song(title: "Beautiful", album: "Relapse"),
        Song(title: "Square Dance", album: "The Eminem Show"),
        Song(title: "Rap God", album: "Marshall Mathers LP 3"),
        Song(title: "Love The Way You Lie", album: "Recovery")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: Segue Code
    private func goToLyrics(song: Song) {
        
        self.performSegue(withIdentifier: "ToLyrics", sender: song)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let selectedSong = sender as? Song
            else { return }
        
        guard let lyricsViewController = segue.destination as? LyricsViewController
            else { return }
        
        lyricsViewController.selectedSong = selectedSong
    }
    
    
    //MARK: Table View Data Source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = (indexPath as NSIndexPath).row
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        guard row < songs.count && row >= 0 else { return cell }
        
        let song = songs[row]
        cell.textLabel?.text = song.title
        cell.textLabel?.font = UIFont(name: "Bodoni 72 Smallcaps", size: 14)
        
        cell.detailTextLabel?.text = song.album
        cell.detailTextLabel?.font = UIFont(name: "Bodoni 72 Smallcaps", size: 10)
        
        return cell
    }
    

    //MARK: Table View Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let row = indexPath.row
        guard row >= 0 && row < songs.count else { return }
        
        let selectedSong = songs[row]
        self.goToLyrics(song: selectedSong)
    }
    
}

struct Song {
    let title: String
    let album: String
}
