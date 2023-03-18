//
//  Playlist.swift
//  Assignment4
//
//  Created by Derrick Park on 2023-03-03.
//

import Foundation

struct Playlist {
  private(set) var songs: [Song] = []
  
  mutating func addSong(title: String, artist: String, category: Song.Style, size: Int) {   // a mutating function to add a new song to the playlist
    let song = Song(title: title, artist: artist, category: category, size: size)
    songs.append(song) // add the song to the playlist
  }
  
  mutating func deleteSong(_ title: String) -> Bool {  // to delete a song from the playlist
    for i in 0..<songs.count { // loop
      if songs[i].title.lowercased() == title.lowercased() { // if the song's title matches the given title, delete
        songs.remove(at: i)
        return true
      }
    }
    return false // return false if no song was found to delete
  }
  
  
  func findSong(searchSong: String) -> [Song] {
    var search: [Song] = []
    if searchSong.count > 0 && searchSong.count <= 35 { // the search query is between 0 and 35 characters
      for song in songs { // loop through  songs in the playlist
        if song.title.lowercased().contains(searchSong.lowercased()) || song.artist.lowercased().contains(searchSong.lowercased()) { // i contains the search, add it to the search results
          search.append(song)
        }
      }
    }
    return search // return the array of search results
  }
  
  func showPlaylist() {
      menu()
      guard !songs.isEmpty else {
          print("The playlist is empty!")
          return
      }
      for (index, song) in songs.enumerated() {
          print("\(index+1). \(song.description)")
      }
  }
  
  func menu() {    // to display the playlist table header
    let title = "| Title"
    let artist = "| Artist"
    let style = "| Category"
    let size = "| Size(MB)"
    print("Show the entire playlist!")
    print("-----------------------------------------------------------------------------------------------")
    print(title.padding(toLength: 35, withPad: " ", startingAt: 0) +
          artist.padding(toLength: 20, withPad: " ", startingAt: 0) +
          style.padding(toLength: 15, withPad: " ", startingAt: 0) +
          size.padding(toLength: 10, withPad: " ", startingAt: 0))
    print("-----------------------------------------------------------------------------------------------")
  }
  
  
  func categoryDetails(category: Song.Style) {
    menu() // Print the menu headers for the playlist details
    var song = 0
    var size = 0
    for i in songs {
      if i.category == category { // If the song have the category
        print(i.description)
        size += i.size
        song += 1
      }
    }
    let megaBytes = Double(size/1000) // calculate the total size with megabytes
    print("--------------------------------------------------------------------------------------------")
    print("Total: \(song) songs in the playlist. Size: \(megaBytes)MB.")
  }
  
  
  func storeSize() -> Int {
    return songs.reduce(0, { $0 + $1.size })
  }
  
}
