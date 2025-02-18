--easymacros:macrotypes (this comment is used to identify MacroTypes module)

-- Label
export type label = (text: string) -> ()

-- Error
export type error = (text: string) -> ()

-- Heading
export type heading = (text: string, options: {
	font: (Enum.Font | Font)?,
}?) -> ()

-- Button
export type buttonHandler = {
	clicked: (self: buttonHandler) -> boolean,
}
export type button = (label: string) -> buttonHandler

-- Checkbox
export type checkboxHandler = {
	getValue: (self: checkboxHandler) -> boolean,
	clicked: (self: checkboxHandler) -> boolean,
}
export type checkbox = (text: string, options: {
	checked: boolean?,
	disabled: boolean?,
}?) -> checkboxHandler

-- String Input
export type stringinputHandler = {
	getValue: (self: stringinputHandler) -> string?,
	valueChanged: (self: stringinputHandler) -> boolean,
}
export type stringinput = (label: string, options: {
	default: string?,
	value: string?,
}?) -> stringinputHandler

-- Number Input
export type numberinputHandler = {
	getValue: (self: numberinputHandler) -> number?,
	valueChanged: (self: numberinputHandler) -> boolean,
}
export type numberinput = (
	label: string,
	options: {
		default: number?,
		value: number?,
		min: number?,
		max: number?,
	}?
) -> numberinputHandler

-- Dropdown
export type dropdownHandler = {
	getValue: (self: dropdownHandler) -> string?,
	valueChanged: (self: dropdownHandler) -> boolean,
}
export type dropdown = (label: string, items: { string }, options: {
	value: string?,
}?) -> dropdownHandler

-- Hooks
type destructor = () -> ()
type useEffectCallback = (() -> destructor) | (() -> ())

export type api = {
	label: label,
	error: error,
	heading: heading,
	button: button,
	checkbox: checkbox,
	stringinput: stringinput,
	numberinput: numberinput,
	dropdown: dropdown,

	useState: <T>(initialValue: T) -> (T, (T | ((oldValue: T) -> T)) -> ()),
	useEffect: (useEffectCallback, ...any) -> (),
	useInstance: (creator: (ref: {}) -> (Instance, Instance?)) -> any,
	useKey: (key: string) -> (),

	scope: (callback: (...any) -> (), ...any) -> (),
	create: (className: string, props: any) -> Instance,
	widget: <T>(fn: (...T) -> ()) -> (...T) -> (),
}

return {} :: api
