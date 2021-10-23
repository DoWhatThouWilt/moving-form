import './assets/preflight.css'
import './room-picker'
import './furniture-picker'
import './box-picker'
import './first-form'
import './second-form'
import './review'
import { createRoomMachine } from './state'
import store from './store'

global css
	html ff:sans m:0 p:0
	body p:4 m:0 bgc:gray1
	# button, p m:0 p:0 bd:0 bgc:transparent

createRoomMachine []
# global.appState = 'second-form'
# global.appState = 'review'

tag app
	css button fs:lg px:6 py:2 mx:6 bxs:lg fw:900 rd:lg c:white bgc:fuschia4 cursor:pointer
		tween:all .3s cubic-in-out bgc@hover:rose5
	<self>
		# <pre[pos:fixed t:0 l:0]> JSON.stringify(store.data, null, 2)
		<{global.appState} room=store.currentRoom>


imba.mount <app>