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
  // Example:
  // | Title                               | Artist                   | Style       | Size (MB)
  var description: String {
    // TODO: - YOUR CODE HERE
    return ""
  }
}
