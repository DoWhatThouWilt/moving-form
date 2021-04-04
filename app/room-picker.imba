import { roomData } from './roomData'
import {createRoomMachine} from './state'
import { v4 as uuidv4 } from 'uuid'
import Navigation from './components/Navigation'
import store from './store'

let roomsTemplate = roomData.map do |room|
	let furniture = room.furniture.map do |item|
		{ name: item, qty: 0}
	{ name: room.name, qty: 0, furniture: furniture }

let computedRooms = [] 

def computeRooms
	let selectedRooms = roomsTemplate.filter do |room| room.qty > 0
	let generatedRooms = for room in selectedRooms
		for i in [1 ... room.qty+1]	
			let furniture = room.furniture.map do |furn| {...furn, id: uuidv4!}
			{name: "{room.name} {i}", furniture: furniture}
	
	store.rooms = generatedRooms.flat!

	computedRooms = generatedRooms.flat!.map do $1.name
	createRoomMachine(computedRooms)

def resetRooms
	computedRooms = []
	store.rooms = []

tag Counter
	prop name
	prop qty
	prop idx
	
	def increment idx
		roomsTemplate[idx].qty++ if roomsTemplate[idx].qty < 20
		# console.log(roomsTemplate)

	def decrement idx
		roomsTemplate[idx].qty-- if roomsTemplate[idx].qty > 0
	
	css .square::before content:"" pt:100% d:block
	css button c:white fs:4rem fw:900 cursor:pointer c@hover:orange2 bgc:transparent p:0
	
	<self.square[pos:relative bg:rose4 c:white ta:center bxs:md rd:md]>
		<div[pos:absolute t:0 l:0 w:100% h:100% d:flex bxs:lg fl:1 ai:center jc:space-between]>
			<button[ml:2] @click=increment(idx)> "+"
			<div[fs:5rem fw:500]> "{qty}"
			<button[mr:2] @click=decrement(idx)> "-"
		<div[pos:absolute b:2.5 w:100% fs:lg fw:500]> "{name}"

tag RoomTally
	css
		button bgc:white c:fuschia4 d:inline-flex py:2 px:4 fw:900 rd:lg mr:2 my:2 bxs:xl
	<self>
		<div[bgc:fuschia4 bxs:lg rd:lg p:4]>
			<button @click=computeRooms!> "Confirm rooms"
			<button @click=resetRooms> "Reset"
			for room in computedRooms
				<div[fs:sm mr:2 my:2 d:inline-flex c:white bgc:fuschia4 
				px:1.5 py:0.5 rd:full bw:2px bs:solid bc:white]> 
					"{room}" 
		
tag room-picker
	css button fs:lg px:6 py:2 mx:6 bxs:lg fw:900 rd:lg c:white bgc:fuschia4 cursor:pointer
		tween:all .3s cubic-in-out bgc@hover:rose5
	<self>
		<div[max-width:70rem max-height:70rem mx:auto]>
			<RoomTally>
			<div[mt:1rem grid-gap:1rem gtc:repeat(auto-fill, minmax(11rem, 1fr)) d:grid]>
				for {qty, name},idx of roomsTemplate
					<Counter name=name qty=qty idx=idx>
			<Navigation nextDisabled=(!(store.rooms.length > 0))>