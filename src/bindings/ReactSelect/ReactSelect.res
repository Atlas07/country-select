module Theme = ReactSelect__Theme
module State = ReactSelect__State
module Style = ReactSelect__Style
module Filter = ReactSelect__Filter
module Components = ReactSelect__Components

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
  selectedValue: array<'a>,
}

module Async = {
  @module("react-select/async") @react.component
  external make: (
    ~ref: React.ref<Nullable.t<'z>>=?,
    ~cacheOptions: bool=?,
    ~className: string=?,
    ~classNamePrefix: string=?,
    ~name: string=?,
    ~clearValue: unit => unit=?,
    ~defaultValue: option<'a>=?,
    ~getStyles: (string, {"value": 'a}) => 'b=?,
    ~hasValue: bool=?,
    ~isMulti: bool=?,
    ~isFocused: bool=?,
    ~isLoading: bool=?,
    ~isSelected: bool=?,
    ~isSearchable: bool=?,
    ~isClearable: bool=?,
    ~isDisabled: bool=?,
    ~options: array<'a>=?,
    ~onChange: ('a, actionMeta) => unit=?,
    ~onBlur: {..} => unit=?,
    ~onMenuOpen: unit => unit=?,
    ~onMenuClose: unit => unit=?,
    ~selectOption: 'a => unit=?,
    ~selectProps: {..}=?,
    ~emotion: {..}=?,
    ~loadOptions: (string, array<'a> => unit) => promise<array<'a>>=?,
    ~defaultOptions: array<'a>=?,
    ~value: option<'a>=?,
    ~menuShouldScrollIntoView: bool=?,
    ~menuShouldBlockScroll: bool=?,
    ~menuPlacement: menuPlacement=?,
    ~menuPosition: menuPosition=?,
    ~required: bool=?,
    ~placeholder: string=?,
    ~components: Components.t<'a>=?,
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
    ~formatOptionLabel: ('a, formatOptionLabelMeta<'a>) => React.element=?,
  ) => React.element = "default"
}
