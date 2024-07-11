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

type components = {"DropdownIndicator": React.element, "IndicatorSeparator": React.element}

@module("react-select")
external components: components = "components"

module Style = {
  type t

  type styleFunction = t => t

  type styles = {
    container: styleFunction,
    control: styleFunction,
    menu: styleFunction,
    menuList: styleFunction,
  }

  external makeStyle: {..} => t = "%identity"

  let mergeStyles: (t, t) => t = %raw(`
  function(provided, override) {
    return {
      ...provided,
      ...override,
    }
  }
`)
}

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
  ~styles: Style.styles=?,
) => React.element = "default"

module Async = {
  @module("react-select/async") @react.component
  external make: (
    // ~ref: React.ref<Nullable.t<Dom.element>>=?,
    ~ref: React.ref<Nullable.t<'z>>=?,
    ~cacheOptions: bool=?,
    ~className: string=?,
    ~classNamePrefix: string=?,
    ~name: string=?,
    ~clearValue: unit => unit=?,
    ~defaultValue: option<optionType>=?,
    ~getStyles: (string, {"value": 'a}) => 'b=?,
    ~hasValue: bool=?,
    ~isMulti: bool=?,
    ~isFocused: bool=?,
    ~isLoading: bool=?,
    ~isSelected: bool=?,
    ~isSearchable: bool=?,
    ~isClearable: bool=?,
    ~options: options=?, // TODO????
    ~onChange: (optionType, actionMeta) => unit=?,
    ~onBlur: {..} => unit=?,
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
    ~components: components=?,
    ~inputValue: string=?,
    ~onInputChange: (string, actionMeta) => unit=?,
    ~menuIsOpen: bool=?,
    ~autoFocus: bool=?,
    ~backspaceRemovesValue: bool=?,
    ~controlShouldRenderValue: bool=?,
    ~hideSelectedOptions: bool=?,
    ~tabSelectsValue: bool=?,
    ~minMenuHeight: int=?,
    ~maxMenuHeight: int=?,
    ~styles: Style.styles=?,
  ) => React.element = "default"
}

// type modules
// @module("react-select") @val external all: modules = "components"
