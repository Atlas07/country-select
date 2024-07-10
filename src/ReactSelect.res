type optionType
type options = array<optionType>

type actionTypes = [
  | #clear
  | #"#create-option"
  | #"deselect-option"
  | #"pop-value"
  | #"remove-value"
  | #"select-option"
  | #"set-value"
]

// type valueType =
//   | OptionType(optionType)
//   | OptionsType(optionsType)
//   | Null
//   | Undefined

external makeOption: {..} => optionType = "%identity"

@module("react-select") @react.component
external make: (
  ~className: string=?,
  ~clearValue: unit => unit=?,
  ~defaultValue: option<optionType>=?,
  ~getStyles: (string, {"value": 'a}) => 'b=?,
  // ~getValue: unit => valueType=?,
  ~hasValue: bool=?,
  ~isMulti: bool=?,
  ~options: options,
  ~onChange: optionType => unit=?,
  ~selectOption: optionType => unit=?,
  ~selectProps: {..}=?,
  // ~setValue: (valueType, actionTypes) => unit=?,
  ~emotion: {..}=?,
) => React.element = "default"
