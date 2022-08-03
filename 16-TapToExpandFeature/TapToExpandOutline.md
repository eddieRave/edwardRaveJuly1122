##  Tap Button To Expand Cell

### Button action 
- lives in the Cell
- Relay the info/instruction to the tableView via delegation pattern

### Memory Leak
- TableView holds strong references to cell
- Cell holds strong reference back to TableView
- Neither can be remove from memory even when the ViewController is gone
- Make one reference `weak` or `unowned`

### Cell Layout
- Cell will expand to fit its content
- Use StackView to easily hide/show label that will expand the stackView, which will expand the cell

### Cell Reuse
- when cells are reuse, their expanded state is also reused
- aka. artistName.isHidden stays the same when cell is reused
- Fix this by not saving the isHidden state on the cell itself

