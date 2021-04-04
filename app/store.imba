class Store
	constructor
		global.store = self
	
	data = {additional: ""}
	rooms = []
	currentRoom = ""
	boxes = [
		{name: 'small', qty: 0},
		{name: 'medium', qty: 0},
		{name: 'large', qty: 0}
	]
	
	def getFurniture
		(rooms.find(do $1.name === currentRoom)).furniture
	
	def incrementFurniture furnidx
		let roomindex = rooms.findIndex(do $1.name === currentRoom)
		rooms[roomindex].furniture[furnidx].qty++
	
	def decrementFurniture furnidx
		let roomindex = rooms.findIndex(do $1.name === currentRoom)
		let target = rooms[roomindex].furniture[furnidx].qty
		if target > 0
			rooms[roomindex].furniture[furnidx].qty--

export default new Store
	