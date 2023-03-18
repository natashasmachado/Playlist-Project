//
//  main.swift
//  Playlist+Project
//
//  Created by Natasha on 3/15/23.
//

// create a new playlist
var playlist = Playlist()


while true {
  print("""
  Enter a command to continue:
  A: Add a song to the playlist
  F: Find a song on the playlist
  D: Delete a song from the playlist
  S: Show the playlist
  C: Show details of songs by category
  Z: Show the playlist size
  M: Show the menu
  X: Exit the program
  """)
  
  if let userInput = readLine()?.lowercased() {
    switch userInput {
      
    case "a": // Add a new song to the playlist
      print("""
            Add a new song to the playlist!
            Enter a new song's title:
            """)
      let title = readLine() ?? ""
      print("Enter a new song's artist:")
      let artist = readLine() ?? ""
      print("Enter a new song's category (P: Pop, R: Rock, A: Alternative, B: RnB, H: Hiphop, C: Classical):")
      var categoryInput = readLine()?.uppercased() ?? ""
      var category: Song.Style
      while !["P", "R", "A", "B", "H", "C"].contains(categoryInput) {
        print("Invalid category. Please re-enter (P, R, A, B, H, C):")
        categoryInput = readLine()?.uppercased() ?? ""
      }
      switch categoryInput {
      case "P":
        category = Song.Style.pop
      case "R":
        category = Song.Style.rock
      case "A":
        category = Song.Style.alternative
      case "B":
        category = Song.Style.rnb
      case "H":
        category = Song.Style.hiphop
      case "C":
        category = Song.Style.classical
      default:
        category = Song.Style.pop
      }
      print("Enter a new song's size (in KB):") // looping til valid input
      var size = Int(readLine() ?? "") ?? 0
      while size < 0 {
        print("Must enter a positive size. Please re-enter:")
        size = Int(readLine() ?? "") ?? 0
      }
      playlist.addSong(title: title, artist: artist, category: category, size: size)   // add the new song to the playlist
      print("\(title) by \(artist) added to the playlist.")
      
    case "d":
      print("""
      Delete a song from the playlist!
      Enter the title of the song you want to remove from your playlist:
      """)
      let deleteSong = readLine() ?? ""
      let result = playlist.deleteSong(deleteSong) // delete the song from playlist and get the result
      if result {
        print("\(deleteSong) successfully removed from the playlist.")
      } else {
        print("No such song '\(deleteSong)' in the playlist.")
      }
      
    case "f":
        print("""
        Find a song on the playlist!"
        Enter your search keyword:
        """)
        guard let search = readLine()?.lowercased() else {
            print("=== 0 matched ===")
            continue
        }
    
        let matchingSongs = playlist.songs.filter { song in
            return song.title.lowercased().contains(search) || song.artist.lowercased().contains(search)
        }
        
        if matchingSongs.isEmpty {
            print("No songs found matching '\(search)'.")
        } else {
            print("\(matchingSongs.count) songs found:")
            for song in matchingSongs {
                print(song.description)
            }
        }
        break
      
    case "s": // show the current playlist and its size
      playlist.showPlaylist()
      print("Total: \(playlist.songs.count) songs in the playlist. Size: \(playlist.storeSize()) MB.")
      
      
    case "c":
        print("""
        Show details of songs by category!
        Enter a category to print (P, R, A, B, H, C):
        """)
        guard let userInput = readLine()?.uppercased() else {
            print("Invalid input.")
            break
        }
        guard let category = Song.Style(rawValue: userInput) else {
            print("Invalid category. Please enter a valid category.")
            break
        }
        playlist.categoryDetails(category: category)
      
    case "z": // print total size
      let totalSize = playlist.storeSize()
      print("""
      Show playlist size!
      "Total size: \(totalSize) KB.
      """)
      
    case "m": // show the menu again
      print("""
      A: Add a song to the playlist
      D: Delete a song from the playlist
      S: Show the playlist
      C: Show details of songs by category
      Z: Show the playlist size
      M: Show the menu
      X: Exit the program
      """)
      continue
      
    case "x":  // exit the program
      break
      
    default: // invalid command, prompt the user to try again
      print("Invalid command. Please try again.")
    }
  }
}
