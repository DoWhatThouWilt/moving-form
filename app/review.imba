import Navigation from './components/Navigation'
import store from './store'
# Test data for the review
# import {data} from './data/furniture-test.js'
# store.rooms = data

tag review
	css .container > * + * my:12
	css button outline@focus:none
	css	input::-webkit-outer-spin-button, input::-webkit-inner-spin-button m:0 -webkit-appearance:none
	css input[type=number] -moz-appearance:none
	
	<self[c:gray6]>
		# <Navigation>
		# <pre> JSON.stringify(store.rooms, null, 2)
		<div[mt:8 mx@sm:auto w@sm:full max-width:1024px]>
			<div.container[bgc:white py:16 px:6 bxs:md rd:lg px@sm:10]>
				<h1[fs:4xl fw:500 c:gray8]> "Final review"
				<div[p:8 bc:gray2 bw:1px bs:solid rd:10px]>
					<h2[fs:2xl fw:500 c:gray7]> "Rooms"
					<hr[c:gray3 mt:4]>
					<div[px:6]>
						for {name, furniture}, idx in store.rooms
							<Room roomName=name furniture=furniture>
				<div[p:8 bc:gray2 bw:1px bs:solid rd:10px]>
					<h2[fs:2xl fw:500 c:gray7]> "Boxes"
					<hr[c:gray3 my:6]>
					<div[px:6]>
						for {name, qty}, idx in store.boxes
							<div[d:flex jc:space-between mt:2]>
								<div[d:inline-flex ai:baseline mt:2]>
									<input[c:gray5 fs:16px fw:500 rd:xl px:2 py:1 w:12 bd:1px solid gray3
									bxs:sm outline@focus:none bxs@focus:0 0 0 3px rgba(66, 153, 255, 0.5)	
									] min="0" max="999" type="number" bind=store.boxes[idx].qty>
									<p[ml:2 c:gray5]> "{name}" 
								<div[d:flex ai:center]>
									<button @click=(store.boxes[idx].qty++)>
										<svg[h:7 c:gray4 cursor:pointer c@hover:orange3 c@active:blue4 tween:colors .25s] 
										src="./assets/plus.svg">
									<button @click=(store.boxes[idx].qty-- if store.boxes[idx].qty > 0)>
										<svg[h:7 c:gray4 cursor:pointer c@hover:orange3 c@active:blue4 tween:colors .25s] 
										src="./assets/minus.svg">
				<Navigation next=false>

tag Furniture
	prop name
	prop qty
	prop index
	prop roomName
	
	css button outline@focus:none
	
	<self[d:flex jc:space-between mt:2]>
		<p[mt:2 c:gray5]> "{qty} {name}" 
		<div[d:flex ai:center]>
			<button @click=store.incrementFurniture(index, roomName)>
				<svg[h:7 c:gray4 cursor:pointer c@hover:orange3 c@active:blue4 tween:colors .25s] 
				src="./assets/plus.svg">
			<button @click=store.decrementFurniture(index, roomName)>
				<svg[h:7 c:gray4 cursor:pointer c@hover:orange3 c@active:blue4 tween:colors .25s] 
				src="./assets/minus.svg">

tag Room
	prop roomName = "name of room"
	prop furniture = []
	prop showAll = false
		
	<self>
		<div[mt:6 d:flex jc:space-between ai:center mb:3]>
			<h3[fs:xl c:gray7]> roomName
			<a
			[px:4 py:2 bg:gray1 rd:10px cursor:pointer bg@hover:orange3 c@hover:white tween:colors .25s]
			@click=(showAll = !showAll)	
			> "Show All"
		for {name, qty}, index in furniture		
			if qty < 1
				<Furniture 
				[d:none]=!showAll 
				name=name 
				qty=qty 
				index=index 
				roomName=roomName>
			else
				<Furniture 
				name=name 
				qty=qty 
				index=index 
				roomName=roomName>
			# <p[mt:1 c:gray5]> "{item.name}"
		<hr[c:gray2 my:6]>
		
	