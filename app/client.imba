import './room-picker'
import './furniture-picker'
import './box-picker'
import store from './store'

global css
	html ff:sans p:0 m:0
	button, p m:0 p:0 bd:0 bgc:transparent

global.appState = 'room-picker'

tag app
	css button fs:lg px:6 py:2 mx:6 bxs:lg fw:900 rd:lg c:white bgc:fuschia4 cursor:pointer
		tween:all .3s cubic-in-out bgc@hover:rose5
	<self>
		<{global.appState} room=store.currentRoom>


imba.mount <app>