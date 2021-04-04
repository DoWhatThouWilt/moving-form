import '../assets/form.css'
import store from '../store'

export default tag Form
	prop values = {}
	prop errors = []
	prop submitted = false
	
	def submitHandler schema
		schema
			.validate(values, { abortEarly: false })
			.then(do 
				# console.log values
				errors = {}
				submitted = true
				Object.assign(store.data, values)
				console.log store.data)
			.catch(do(err)
				console.log(JSON.stringify(err, null, 2))
				errors = extractErrors(err)
				submitted = false)

	def extractErrors {inner}
		return inner.reduce(&, {}) do |acc, err|
			return { ...acc, [err.path]: err.message }

	css .wrapper > * + * my:6
	css .wrapper-compact > * + * my:4
	css label d:block fs:sm fw:500 c:gray7
	css input@not([type="checkbox"]), select, textarea
		w:100% bw:1px bs:solid bc:gray3 px:3 py:2 rd:xl bxs:sm outline@focus:none
		bc@focus:indigo5 bxs@focus: 0 0 0 2px indigo5 fs:md
	css select bgc:white c:gray8 appearance:none bgp:right .5rem center
		bgr:no-repeat bgs:1.5em 1.5em pr:10
	css input[type="checkbox"] h:5 w:5 rd:xl bw:2px bs:solid bc:gray3 bxs:sm
	css input@invalid bgc:red1 bxs: 0 0 0 2px red6 bxs@focus: 0 0 0 2px red6 bc@focus:red6
	css textarea ff:sans
	# css button w:100% d:flex jc:center py:2 px:4 rd:md bxs:sm fs:sm fw:600 c:white bgc:indigo6
	# 	bgc@hover:indigo7
	css button fs:lg px:10 py:2 mx:6 bxs:sm fw:900 rd:md c:white bgc:indigo5 cursor:pointer
		tween:all .3s cubic-in-out bgc@hover:rose5 outline@focus:none
	css .field-row d:grid gtc:repeat(auto-fill, minmax(240px, 1fr)) grid-gap:1rem
	css .layout-row d:grid gtc:repeat(auto-fill, minmax(360px, 1fr)) gcg:2.5rem grg:1rem
	css .error c:red6 fs:sm mt:1
	<self>
		# Flexbox form rows
		<div[d:flex flw:wrap jc:space-between]>
			<div[w@sm:49% w:100%]>
				<label> "Email address"
				<input[mt:1] type="email">
			<div[w@sm:49% mt@sm:0 mt:6 w:100%]>
				<label> "Email address"
				<input[mt:1] type="email">