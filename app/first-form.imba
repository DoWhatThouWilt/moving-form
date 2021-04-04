import Navigation from './components/Navigation'
import Form from './form/Form'
import { initialSchema } from './form/initialSchema'
import store from './store'

import './assets/form.css'
import '../node_modules/flatpickr/dist/themes/dark.css'

import flatpickr from 'flatpickr'

const zip = "[0-9]\{5\}"

tag first-form < Form
	prop values = {}
	prop errors = {}
	prop submitted = false

	def mount
		flatpickr("#date", {
			minDate: "today"
		})
	
	<self>
		<div[mt:8 mx@sm:auto w@sm:full max-width:768px]>
			<Navigation prev=false>
			# <pre> JSON.stringify(store.data, null, 2)
			<div[bgc:white py:16 px:6 bxs:md rd:lg px@sm:10]>
				<form.wrapper[mb:0] @submit.prevent=submitHandler(initialSchema)>
					<div.field-row>
						<div>
							<label> "Moving From"
							<input[mt:1] type="text" pattern=zip placeholder="5-Digit Zip Code" bind=values.fromZip>
							<p.error> errors.fromZip if errors.fromZip
						<div>
							<label> "Moving To"
							<input[mt:1] type="text" pattern=zip placeholder="5-Digit Zip Code" bind=values.toZip>
							<p.error> errors.toZip if errors.toZip
					<div>
						<label> "Move Date"
						<input#date type="text" bind=values.moveDate> "Date goes here"
						<p.error> errors.moveDate if errors.moveDate
					<div[d:flex ai:center mt:-4]>
						<input type="checkbox" bind=values.isFlexible>
						<label[ml:2]> "My date is flexible"
					<div>
						<label> "Move Size"
						<select[mt:1 c:gray8] bind=values.moveSize>
							<option value=""> "Choose option..."
							for i in [1 .. 4]
								<option value="{i}"> "{i} Bedroom"
						<p.error> errors.moveSize if errors.moveSize
					<div>
						<label> "How did you hear about us?"
						<select[mt:1 c:gray8] bind=values.referral>
							<option value=""> "Choose option..."
							<option value="Friend/Family"> "Friend/Family Referral"
						<p.error> errors.referral if errors.referral
					<div.field-row>
						<div>
							<label> "First Name"
							<input[mt:1] type="text" bind=values.firstName>
							<p.error> errors.firstName if errors.firstName
						<div>
							<label> "Last Name"
							<input[mt:1] type="text" bind=values.lastName>
							<p.error> errors.lastName if errors.lastName
					<div.field-row[mb:10]>
						<div>
							<label> "Phone"
							<input[mt:1] type="tel" placeholder="xxx-xxx-xxxx"
							pattern="[0-9]\{3\}-?[0-9]\{3\}-?[0-9]\{4\}" bind=values.phone>
							<p.error> errors.phone if errors.phone
						<div>
							<label> "Email"
							<input[mt:1] type="email" bind=values.email>
							<p.error> errors.email if errors.email
					<Navigation prev=false schema=initialSchema values=values>
					# <div[mx:auto d:flex jc:center]>
					# 	<button[mb:-6] type="submit" @click=proceed> "Next"
			# <Navigation prev=false nextDisabled=!submitted>