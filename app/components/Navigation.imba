export default tag Navigation
	prop next = false
	prop prev = false
	css button fs:lg px:6 py:2 mx:6 bxs:lg fw:900 rd:lg c:white bgc:fuschia4 cursor:pointer
		tween:all .3s cubic-in-out bgc@hover:rose5
	<self>
		<div[mx:auto d:flex jc:center mt:2rem]>
			<button disabled=next @click=(global.service.send('backward'))> "🡄 Prev"
			<button disabled=prev @click=(global.service.send('forward'))> "Next 🡆"