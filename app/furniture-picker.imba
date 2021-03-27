import Navigation from './components/Navigation'
import store from './store'

def getFurniture current
	(store.rooms.find(do |room| room.name === current)).furniture

def getRoomIndex current
	store.rooms.findIndex(do $1.name === current)

# need to access store.furniture[current_room_index].furniture[index]
	
tag furniture-picker
	prop room
	
	<self>
		<div[max-width:70rem max-height:70rem mx:auto]>
			<div[bgc:indigo4 bxs:lg rd:lg p:4 c:white ta:center]>
				<div[fw:600 fs:3xl]> "{store.currentRoom}"
			<div[mt:1rem grid-gap:1rem gtc:repeat(auto-fill, minmax(11rem, 1fr)) d:grid]>
				for {qty, name}, idx of (store.getFurniture())
					<Counter qty=qty name=name idx=idx roomIndex=(getRoomIndex(room))>
		<Navigation>

tag Counter
	prop name
	prop qty
	prop idx
	prop roomIndex
	
	css .square::before content:"" pt:100% d:block
	css button c:white fs:4rem fw:900 cursor:pointer c@hover:orange2
	
	<self.square[pos:relative bg:rose4 c:white ta:center bxs:md rd:md]>
		<div[pos:absolute t:0 l:0 w:100% h:100% d:flex bxs:lg fl:1 ai:center jc:space-between]>
			<button[ml:2] @click=store.incrementFurniture(idx)> "+"
			<div[fs:5rem fw:500]> "{qty}"
			<button[mr:2] @click=store.decrementFurniture(idx)> "-"
		<div[pos:absolute b:2.5 w:100% fs:lg fw:500]> "{name}"

tag Todo
	css button fs:lg px:6 py:2 mx:6 bxs:lg fw:900 rd:lg c:white bgc:fuschia4 cursor:pointer
		tween:all .3s cubic-in-out bgc@hover:rose5
	<self>
		<div[max-width:70rem max-height:70rem mx:auto]>
			<RoomTally>
			<div[mt:1rem grid-gap:1rem gtc:repeat(auto-fill, minmax(11rem, 1fr)) d:grid]>
				for {qty, name},idx of rooms
					<Counter name=name qty=qty idx=idx>
			<Navigation>
