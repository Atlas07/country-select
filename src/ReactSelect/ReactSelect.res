module Theme = ReactSelect__Theme
module State = ReactSelect__State
module Style = ReactSelect__Style
module Filter = ReactSelect__Filter

type optionType<'a> = 'a
type options<'a> = array<optionType<'a>>

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

type formatOptionLabelMeta<'a> = {
  context: [#menu | #value],
  inputValue: string,
  selectedValue: array<'a>
}

module Components = {
  type t = {
    @as("DropdownIndicator") dropdownIndicator?: React.element, // right binding?
    @as("IndicatorSeparator") indicatorSeparator?: React.element,
    @as("Control") control?: React.element,
  }

  type controlProps

  @module("react-select") @scope("components")
  external control: React.component<controlProps> = "Control"
}

@module("react-select") @react.component
external make: (
  ~className: string=?,
  ~clearValue: unit => unit=?,
  ~defaultValue: option<optionType<'a>>=?,
  ~getStyles: (string, {"value": 'a}) => 'b=?,
  ~hasValue: bool=?,
  ~isMulti: bool=?,
  ~options: options<'a>,
  ~onChange: optionType<'a> => unit=?,
  ~selectOption: optionType<'a> => unit=?,
  ~selectProps: {..}=?,
  ~styles: Style.styles=?,
) => React.element = "default"

module Async = {
  @module("react-select/async") @react.component
  external make: (
    ~ref: React.ref<Nullable.t<'z>>=?,
    ~cacheOptions: bool=?,
    ~className: string=?,
    ~classNamePrefix: string=?,
    ~name: string=?,
    ~clearValue: unit => unit=?,
    ~defaultValue: option<optionType<'a>>=?,
    ~getStyles: (string, {"value": 'a}) => 'b=?,
    ~hasValue: bool=?,
    ~isMulti: bool=?,
    ~isFocused: bool=?,
    ~isLoading: bool=?,
    ~isSelected: bool=?,
    ~isSearchable: bool=?,
    ~isClearable: bool=?,
    ~options: options<'a>=?,
    ~onChange: (optionType<'a>, actionMeta) => unit=?,
    ~onBlur: {..} => unit=?,
    ~onMenuOpen: unit => unit=?,
    ~selectOption: optionType<'a> => unit=?,
    ~selectProps: {..}=?,
    ~emotion: {..}=?,
    ~loadOptions: (string, options<'a> => unit) => promise<options<'a>>=?,
    ~defaultOptions: options<'a>=?,
    ~value: option<optionType<'a>>=?,
    ~menuShouldScrollIntoView: bool=?,
    ~menuShouldBlockScroll: bool=?,
    ~menuPlacement: menuPlacement=?,
    ~menuPosition: menuPosition=?,
    ~required: bool=?,
    ~placeholder: string=?,
    ~components: Components.t=?,
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
    ~formatOptionLabel: (optionType<'a>, formatOptionLabelMeta<optionType<'a>>) => React.element=?,
  ) => React.element = "default"
}
