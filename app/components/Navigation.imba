import * as yup from 'yup'

export default tag Navigation
	prop nextDisabled = false
	prop next = true
	prop prev = true
	prop schema = yup.object().shape({})
	prop values = {}

	css button fs:lg px:18 py:2 mx@sm:20 mx:4 bxs:sm fw:900 rd:md c:white bgc:gray5 cursor:pointer
		tween:all .3s cubic-in-out bgc@hover:indigo5
		&.next bg:indigo5 tween:all .3s cubic-in-out bgc@hover:rose5
	css button@disabled bgc:gray6 c:gray4 cursor:not-allowed
		
	def proceed
		if schema.isValidSync(values)
			global.service.send('forward')
	<self>
		<div[mx:auto d:flex jc:center mt:4rem]>
			if prev
				<button @click=(global.service.send('backward'))> "Back"
			if next
				<button.next disabled=nextDisabled @click=proceed> "Next"