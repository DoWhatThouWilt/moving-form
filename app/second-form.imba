import Navigation from './components/Navigation'
import Form from './form/Form'
import store from './store'
import {secondSchema} from './form/secondSchema'

const apikey = ""
const urlBase = "https://maps.googleapis.com/maps/api/geocode/json?address="

def isMultiStory? option
	["Townhouse", "Apartment/Condo"].includes(option)	

def extractState res
		let extracted = (res[0].address_components).filter(do(item) 
			item.short_name.length === 2 && item.short_name !== "US")
		return extracted[0].long_name

def extractCity res
	let extracted = (res[0].address_components).filter(do(item)
		item.types.includes("locality"))
	return extracted[0].long_name
	

tag second-form < Form
	prop values = {edgeCases: ""}
	prop errors = {}

	def mount
		let zip = "20110"
		let apiCall = "{urlBase}{zip}&key={apikey}"
		const {results: fromRes} = await (await window.fetch "{urlBase}{store.data.fromZip}&key={apikey}").json!
		values.fromZip = store.data.fromZip
		values.fromCity = extractCity(fromRes)
		values.fromState = extractState(fromRes)
		const {results: toRes} = await (await window.fetch "{urlBase}{store.data.toZip}&key={apikey}").json!
		values.toZip = store.data.toZip
		values.toCity = extractCity(toRes)
		values.toState = extractState(toRes)
	
	<self>
		# <pre[pos:fixed t:0 r:0]> JSON.stringify(values, null, 2)
		<Navigation demo=true>
		<div[mt:8 mx@sm:auto w@sm:full max-width:1024px]>
			<div[bgc:white py:8 px:6 bxs:md rd:lg px@sm:10]>
				<form.wrapper @submit.prevent=submitHandler(secondSchema)>
					<div[fs:3xl fw:600 c:gray8]> "Your Moving Details"
					<hr[c:gray4 mb:6]>
					<div.layout-row>
						<div.wrapper>
							<div>
								<label[fs:xl fw:500 c:gray8]> "Moving From"
								<input[mt:2] type="text" bind=values.fromStreetAddress placeholder="Street Address">
								<p.error> errors.toStreetAddress if errors.fromStreetAddress
							<div[w@sm:49% w:100%]>
								<input type="text" placeholder="Unit">
							<div>
								<input[mt:2] type="text" bind=values.fromCity placeholder="City">
								<p.error> errors.fromCity if errors.fromCity
							<div[d:flex flw:wrap jc:space-between]>
								<div[w@sm:49% w:100%]>
									<input type="text" bind=values.fromState placeholder="State">
									<p.error> errors.fromState if errors.fromState
								<div[w@sm:49% mt@sm:0 mt:6 w:100%]>
									<input type="text" bind=values.fromZip placeholder="Zip">
									<p.error> errors.fromZip if errors.fromZip
							<div>
								<select bind=values.fromLocation>
									<option value=""> "Location Type"
									<option value="Single Family Home"> "Single Family Home"
									<option value="Townhouse"> "Townhouse"
									<option value="Apartment/Condo"> "Apartment/Condo"
								<p.error> errors.fromLocation if errors.fromLocation
							if isMultiStory? values.fromLocation
								<div>
									<input type="text" placeholder="Floor" bind=values.fromFloor>
									<p.error> errors.fromFloor if errors.fromFloor
								<div>
									<select bind=values.fromElevator>
										<option value=""> "Does the building have an elevator?"
										<option value="Yes"> "Yes"
										<option values="No"> "No"
									<p.error> errors.fromElevator if errors.fromElevator
							<div>
								<label[fs:md c:gray8]> 
									"How long is the distance from the truck loading area to the front door?"
								<select bind=values.fromLoadingDistance>
									<option value=""> "Choose..."
									<option value="0 to 25"> "0 to 25 feet"
									<option value="25 to 50"> "25 to 50 feet"
									<option value="50 to 75"> "50 to 75 feet" 
									<option value="100+"> "100 feet or more"
								<p.error> errors.fromLoadingDistance if errors.fromLoadingDistance
										
						<div.wrapper>
							<div>
								<div[d:flex jc:space-between]>
									<label[fs:xl fw:500 c:gray8]> "Moving To"
									<div[d:inline-flex ai:center]>
										<input[ml:6] type="checkbox" bind=values.destinationUnknown>
										<label[ml:2]> "Destination unknown"
								<input[mt:2] type="text" bind=values.toStreetAddress placeholder="Street Address">
								<p.error> errors.toStreetAddress if errors.toStreetAddress
							<div[w@sm:49% w:100%]>
								<input type="text" placeholder="Unit">
							<div>
								<input[mt:2] type="text" bind=values.toCity placeholder="City">
								<p.error> errors.toCity if errors.toCity
							<div[d:flex flw:wrap jc:space-between]>
								<div[w@sm:49% w:100%]>
									<input type="text" bind=values.toState placeholder="State">
									<p.error> errors.toState if errors.toState
								<div[w@sm:49% mt@sm:0 mt:6 w:100%]>
									<input type="text" bind=values.toZip placeholder="Zip">
									<p.error> errors.toZip if errors.toZip
							<div>
								<select bind=values.toLocation>
									<option value=""> "Location Type"
									<option value="Single Family Home"> "Single Family Home"
									<option value="Townhouse"> "Townhouse"
									<option value="Apartment/Condo"> "Apartment/Condo"
								<p.error> errors.toLocation if errors.toLocation
							if isMultiStory? values.toLocation
								<div>
									<input type="text" bind=values.toFloor placeholder="Floor">
									<p.error> errors.toFloor if errors.toFloor
								<div>
									<select bind=values.toElevator>
										<option value=""> "Does the building have an elevator?"
										<option value="yes"> "Yes"
										<option values="no"> "No"
									<p.error> errors.toElevator if errors.toElevator
							<div>
								<label[fs:md c:gray8]> 
									"How long is the distance from the truck loading area to the front door?"
								<select bind=values.toLoadingDistance>
									<option value=""> "Choose..."
									<option value="0 to 25"> "0 to 25 feet"
									<option value="25 to 50"> "25 to 50 feet"
									<option value="50 to 75"> "50 to 75 feet" 
									<option value="100+"> "100 feet or more"
								<p.error> errors.toLoadingDistance if errors.toLoadingDistance

						<div.wrapper>
							<div>
								<label[fs:md c:gray8]> "Besides you, how many people are moving?"
								<select[mt:1] bind=values.numberOfPeople>
									<option value=""> "Choose..."
									for i in [0 .. 4] 
										<option value="{i}"> i
									<option value="5+"> "5+"
							<div[d:flex flw:wrap jc:space-between]>
								<div[w@sm:49% w:100%]>
									<label[fs:md c:gray8]> "How many years have you lived there?"
									<input[mt:1] type="text" bind=values.yearsAtHome  placeholder="Number of Years">
								<div[w@sm:49% mt@sm:0 mt:6 w:100%]>
									<label[fs:md c:gray8]> "What is the square footage of the area?"
									<input[mt:1] type="text" bind=values.squareFootage placeholder="Square Footage">
							<div>
								<label[fs:md c:gray8]> "Do you need any of the following services?"
								<div[d:flex jc:space-between mt:1]>
									<div[d:inline-flex ai:center]>
										<input type="checkbox" bind=values.needStorage>
										<label[ml:2]> "Storage"
									<div[d:inline-flex ai:center]>
										<input type="checkbox" bind=values.needPacking>
										<label[ml:2]> "Packing"
									<div[d:inline-flex ai:center]>
										<input type="checkbox" bind=values.needBoxDelivery>
										<label[ml:2]> "Box Delivery"
							<div>
								<label[fs:md c:gray8]> "Have you used professional movers before?"
								<select[mt:1] bind=values.usedMoversBefore>
									<option value=""> "Choose..."
									<option value="yes"> "Yes"
									<option values="no"> "No"
						<div.wrapper>
							<div>
								<label[fs:md c:gray8]>
									"Finally, is there anything particularly tricky we should
									 know about - a long sofa that won't fit down a narrow staircase,
									  for example? What is most important for you?"	
								<textarea[mt:1] rows=5 bind=values.edgeCases>

					# this indent is inside form	
					<Navigation schema=secondSchema values=values>