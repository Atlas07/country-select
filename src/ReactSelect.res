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

module Theme = {
  type colors = {
    primary: string,
    primary75: string,
    primary50: string,
    primary25: string,
    danger: string,
    dangerLight: string,
    neutral0: string,
    neutral5: string,
    neutral10: string,
    neutral20: string,
    neutral30: string,
    neutral40: string,
    neutral50: string,
    neutral60: string,
    neutral70: string,
    neutral80: string,
    neutral90: string,
  }

  let makeColors = (
    ~primary="#2684FF",
    ~primary75="#4C9AFF",
    ~primary50="#B2D4FF",
    ~primary25="#DEEBFF",
    ~danger="#DE350B",
    ~dangerLight="#FFBDAD",
    ~neutral0="hsl(0, 0%, 100%)",
    ~neutral5="hsl(0, 0%, 95%)",
    ~neutral10="hsl(0, 0%, 90%)",
    ~neutral20="hsl(0, 0%, 80%)",
    ~neutral30="hsl(0, 0%, 70%)",
    ~neutral40="hsl(0, 0%, 60%)",
    ~neutral50="hsl(0, 0%, 50%)",
    ~neutral60="hsl(0, 0%, 40%",
    ~neutral70="hsl(0, 0%, 30%)",
    ~neutral80="hsl(0, 0%, 20%)",
    ~neutral90="hsl(0, 0%, 10%)",
    (),
  ) => {
    primary,
    primary75,
    primary50,
    primary25,
    danger,
    dangerLight,
    neutral0,
    neutral5,
    neutral10,
    neutral20,
    neutral30,
    neutral40,
    neutral50,
    neutral60,
    neutral70,
    neutral80,
    neutral90,
  }

  type spacing = {
    baseUnit: int,
    controlHeight: int,
    menuGutter: int,
  }

  let makeSpacing = (~baseUnit=4, ~controlHeight=38, ~menuGutter=8, ()) => {
    baseUnit,
    controlHeight,
    menuGutter,
  }

  type t = {
    borderRadius: int,
    colors: colors,
    spacing: spacing,
  }

  let make = (~borderRadius=4, ~colors=makeColors(), ~spacing=makeSpacing(), ()) => {
    borderRadius,
    colors,
    spacing,
  }
}

module State = {
  type t = {
    value: string,
    @as("type")
    _type: string,
    theme: Theme.t,
    role: string,
    // ...
  }
}

module Style = {
  type t

  type styleFunction = (t, State.t) => t

  type styles = {
    container: styleFunction,
    control: styleFunction,
    menu: styleFunction,
    menuList: styleFunction,
    option: styleFunction,
    input: styleFunction,
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
    ~theme: Theme.t => Theme.t=?,
  ) => React.element = "default"
}

// type modules
// @module("react-select") @val external all: modules = "components"
