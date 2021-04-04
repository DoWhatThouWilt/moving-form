import store from './store'
import Form from './form/Form'
import Navigation from './components/Navigation'

tag box-picker < Form
	css & c:gray7
	css ol list-style-type:circle
	<self>
		<div[mt:8 mx@sm:auto w@sm:full max-width:1024px]>
			<div[bgc:white py:16 px:6 bxs:md rd:lg px@sm:10]>
				<div[fs:3xl fw:600 c:gray8]> "Select boxes"
				<hr[c:gray4 my:6]>
				<div[d:flex flw:wrap jc:space-between]>
					<p[w@sm:44% w:100%]> 
						"Estimate to the number of boxes you have.
						It's alright if you don't know the exact amount."
					<ol[w@sm:44% w:100%]>
						<li> "Small boxes would hold books, CDs, misc."
						<li> "Medium boxes would contain dishes, pots, and pans."
						<li> "Large boxes are used for things like clothes and linens."
						
				<div[mt:14 max-width:768px mx:auto]>
					<div[grid-gap:1rem gtc:repeat(auto-fit, minmax(8rem, 1fr)) d:grid]>
						for {name, qty}, idx in store.boxes	
							<Counter name=name qty=qty idx=idx>
					<label[mt:14 fw:500 fs:lg]> "Any additional comments or special instructions?"
					<textarea[w:100% mt:1] 
					bind=store.data.additional placeholder="Comments" rows=8>	

				<Navigation>

tag Counter
	prop name
	prop qty
	prop idx
	
	css .square::before content:"" pt:100% d:block
	css button c:white fs:4rem fw:900 cursor:pointer c@hover:orange2
	
	<self.square[pos:relative bg:indigo4 c:white ta:center bxs:md rd:md]>
		<div[pos:absolute t:0 l:0 w:100% h:100% d:flex bxs:lg fl:1 ai:center jc:space-between]>
			<button[ml:2] @click=(store.boxes[idx].qty++)> "+"
			<div[fs:5rem fw:500]> "{qty}"
			<button[mr:2] @click=(store.boxes[idx].qty--)> "-"
		<div[pos:absolute b:2.5 w:100% fs:xl fw:600]> "{name}"
