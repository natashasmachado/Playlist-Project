//
//  Song.swift
//  Assignment4
//
//  Created by Derrick Park on 2023-03-03.
//

import Foundation

struct Song {
  enum Style: String {
    case pop, rock, alternative, rnb, hiphop, classical
  }
  // title of the song
  private(set) var title: String
  // artist of the song
  private(set) var artist: String
  // category of the song
  private(set) var category: Style
  // file size, stored in kilobytes
  private(set) var size: Int
  
  init(title: String, artist: String, category: Style, size: Int) {
    self.title = title
    self.artist = artist
    self.category = category
    self.size = size
  }
  
  mutating func setSong(title: String, artist: String, category: Style, size: Int) {
    self.title = title
    self.artist = artist
    self.category = category
    self.size = size
  }
}

extension Song: CustomStringConvertible {
  // Size should be printed in Megabytes (use 1000 kilobytes = 1 MB for this calculation), to 1 decimal place.
    // The category abbreviations used should be: Pop, Rock, Alt, Cls, HH, RnB
    // Example:       (35 spaces)                         (20 spaces)     (12 spaces)
    // | Title                               | Artist                   | Style       | Size (MB)
  var description: String {
    var type: String = ""
    let title = "| \(self.title)"
    let artist = "| \(self.artist)"
    let megaB = Double(self.size/1000)
    let size = "| \(megaB) "
    
    if category == .pop {
      type = "Pop"
    }
    if category == .rock {
      type = "Rock"
    }
      if category == .alternative {
      type = "Alt"
    }
    if category == .classical {
      type = "Cls"
    }
    if category == .hiphop {
      type = "HH"
    }
    if category == .rnb {
      type = "RnB"
    }
    
    let style = "| \(type)"
    
    return title.padding(toLength: 35, withPad: " ", startingAt: 0) +
           artist.padding(toLength: 20, withPad: " ", startingAt: 0) +
           style.padding(toLength: 15, withPad: " ", startingAt: 0) +
           size.padding(toLength: 10, withPad: " ", startingAt: 0)
  }
}
