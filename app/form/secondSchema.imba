import * as yup from 'yup'

const multiStory = ["Townhouse", "Apartment/Condo"]

export const secondSchema = yup.object().shape(
	toStreetAddress: yup.string()
			.required("This field is required.")
	toCity: yup.string()
			.required("This field is required.")
	toZip: yup.number()
			.typeError("5 digit number is required")
			.max(99999, "5 digit number is required")
			.required("This field is required.")
	toState: yup.string()
			.required("This field is required.")
	toLocation: yup.string()
			.required("This field is required.")
	toFloor: yup.number().notRequired()
			.when("toLocation", {
				is: do(val) multiStory.includes(val) === true
				then: yup.number()
						.typeError("Must enter number")
						.required("Floor number is required.")
			})
	toElevator: yup.string().notRequired()
				.when("toLocation", {
				is: do(val) multiStory.includes(val) === true
				then: yup.string()
						.required("This field is required.")
				})
	toLoadingDistance: yup.string()
			.required("This field is required.")
	fromStreetAddress: yup.string()
			.required("This field is required.")
	fromCity: yup.string()
			.required("This field is required.")
	fromZip: yup.number()
			.typeError("5 digit number is required")
			.max(99999, "5 digit number is required")
			.required("This field is required.")
	fromState: yup.string()
			.required("This field is required.")
	fromLocation: yup.string()
			.required("This field is required.")
	fromFloor: yup.number().notRequired()
			.when("fromLocation", {
				is: do(val) multiStory.includes(val) === true
				then: yup.number()
						.typeError("Must enter number")
						.required("Floor number is required.")
			})
	fromElevator: yup.string().notRequired()
				.when("fromLocation", {
				is: do(val) multiStory.includes(val) === true
				then: yup.string()
						.required("This field is required.")
				})
	fromLoadingDistance: yup.string()
			.required("This field is required.")
)