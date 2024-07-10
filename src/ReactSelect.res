type optionType
type options = array<optionType>

type actions = [
  | #clear
  | #"#create-option"
  | #"deselect-option"
  | #"pop-value"
  | #"remove-value"
  | #"select-option"
  | #"set-value"
]
type actionMeta = {action: actions}

type menuPlacement = [#bottom | #auto | #top]
type menuPosition = [#absolute | #fixed]

external makeOption: {..} => optionType = "%identity"

@module("react-select") @react.component
external make: (
  ~className: string=?,
  ~clearValue: unit => unit=?,
  ~defaultValue: option<optionType>=?,
  ~getStyles: (string, {"value": 'a}) => 'b=?,
  ~hasValue: bool=?,
  ~isMulti: bool=?,
  ~options: options,
  ~onChange: optionType => unit=?,
  ~selectOption: optionType => unit=?,
  ~selectProps: {..}=?,
) => React.element = "default"

module Async = {
  @module("react-select/async") @react.component
  external make: (
    // ~ref: React.ref<Nullable.t<Dom.element>>=?,
    ~ref: React.ref<Nullable.t<'z>>=?,
    ~cacheOptions: bool=?,
    ~className: string=?,
    ~clearValue: unit => unit=?,
    ~defaultValue: option<optionType>=?,
    ~getStyles: (string, {"value": 'a}) => 'b=?,
    ~hasValue: bool=?,
    ~isMulti: bool=?,
    ~isLoading: bool=?,
    ~isSelected: bool=?,
    ~isSearchable: bool=?,
    ~isClearable: bool=?,
    ~options: options=?, // TODO????
    ~onChange: (optionType, actionMeta) => unit=?,
    ~onMenuOpen: unit => unit=?,
    ~selectOption: optionType => unit=?,
    ~selectProps: {..}=?,
    ~emotion: {..}=?,
    ~loadOptions: string => promise<options>=?,
    ~defaultOptions: options=?,
    ~value: option<optionType>=?,
    ~menuShouldScrollIntoView: bool=?,
    ~menuShouldBlockScroll: bool=?,
    ~menuPlacement: menuPlacement=?,
    ~menuPosition: menuPosition=?,
    ~required: bool=?,
    ~placeholder: string=?,
  ) => React.element = "default"
}

type modules
@module("react-select") @val external all: modules = "components"
