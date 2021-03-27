import { createMachine, interpret, state, transition } from 'robot3'
import store from './store'

def hasNumber? str
	/\d/.test str

def stateFixer state
	if hasNumber? state
		global.currentRoom = state
		# let currentRoom = (store.furniture).find do $1.name === state
		store.currentRoom = state
		# console.log(currentRoom.name)
		# global.currentRoom = currentRoom
		'furniture-picker'
	else
		state

export def createRoomMachine rooms
	let pickerSteps =
		'room-picker': state(transition('forward', rooms[0]))
		'box-picker': state(transition('backward', rooms[rooms.length - 1]))
	
	let roomsMap = rooms.reduce(&,pickerSteps) do |acc, room, idx, arr|
		let nextRoom = idx === arr.length - 1 ? 'box-picker' : arr[idx + 1]
		let prevRoom = idx === 0 ? 'room-picker' : arr[idx - 1]
		{
			...acc,
			[room]: state(
				transition('forward', nextRoom),
				transition('backward', prevRoom)
			)
		}
	
	let roomState = createMachine(roomsMap)
	global.service = interpret(roomState, do |service|
		global.appState = stateFixer(global.service.machine.current))

	global.appState = 'room-picker'


