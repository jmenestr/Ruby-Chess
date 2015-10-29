# Ruby Chess

## Features 

### Uses colorize gem to colorize the board squares and highlight possible moves 
### Uses cursor input to allow users to move around the board with keyboard 
### Uses Object Orientation to orgainze pieces in the following heirarcy 
* Groups pieces into two catagories: moving and sliding. 
  Each Moving and Sliding class handle logic for moving that type of piece
* Each specific piece class hold own move diffs specific to that piece 
* Board class handles turn logic and checks if moves are valid 


##TO-DOS
* Implement en passant and castling 
* Implement use saving 
* Implmenet computer AI 
  * Frist random moves, then add min-max algorithim 
