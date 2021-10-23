class Store
	constructor
		global.store = self
	
	data = {additional: ""}
	rooms = []
	currentRoom = ""
	boxes = [
		{name: 'Small', qty: 0},
		{name: 'Medium', qty: 0},
		{name: 'Large', qty: 0}
	]
	
	def getFurniture
		(rooms.find(do $1.name === currentRoom)).furniture
	
	def incrementFurniture furnidx, roomName
		let roomindex = rooms.findIndex(do $1.name === roomName)
		rooms[roomindex].furniture[furnidx].qty++
	
	def decrementFurniture furnidx, roomName 
		let roomindex = rooms.findIndex(do $1.name === roomName)
		let target = rooms[roomindex].furniture[furnidx].qty
		if target > 0
			rooms[roomindex].furniture[furnidx].qty--

export default new Store
	