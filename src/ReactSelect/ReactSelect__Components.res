type controlProps
type innerProps
type getStylesProps
type setValueProps
type propertyName
type classNamesProps

type noOptionsMessageProps = {inputValue: string}
type selectProps = {
  isClearable: bool,
  isDisabled: bool,
  isLoading: bool,
  isMulti: bool,
  isOptionDisabled: bool,
  menuListId: string,
  noOptionsMessage: noOptionsMessageProps => React.element,
}

type cxState = {string: bool}
type cx = (cxState, array<string>) => string

module Control = {
  type controlProps<'a> = {
    className: string,
    isDisabled: bool,
    isFocused: bool,
    children: React.element,
    innerRef: ReactDOM.domRef => unit,
    innerProps: innerProps,
    clearValue: unit => unit,
    cx: cx,
    getStyles: (string, getStylesProps) => ReactDOM.Style.t,
    getClassNames: (propertyName, classNamesProps) => string,
    getValue: unit => array<'a>,
    hasValue: bool,
    isMulti: bool,
    isRtl: bool,
    menuIsOpen: bool,
    options: array<'a>,
    selectOption: 'a => unit,
    selectProps: selectProps,
    setValue: ('a, setValueProps) => unit,
    theme: ReactSelect__Theme.t,
  }

  @module("react-select") @scope("components") @react.component
  external make: (
    ~className: string=?,
    ~isDisabled: bool=?,
    ~isFocused: bool=?,
    ~children: React.element,
    ~innerRef: ReactDOM.domRef => unit=?,
    ~innerProps: innerProps=?,
    ~clearValue: unit => unit=?,
    ~cx: cx,
    ~getStyles: (string, getStylesProps) => ReactDOM.Style.t,
    ~getClassNames: (propertyName, classNamesProps) => string,
    ~getValue: unit => array<'a>=?,
    ~hasValue: bool=?,
    ~isMulti: bool=?,
    ~isRtl: bool=?,
    ~menuIsOpen: bool=?,
    ~options: array<'a>=?,
    ~selectOption: 'a => unit=?,
    ~selectProps: selectProps=?,
    ~setValue: ('a, setValueProps) => unit=?,
    ~theme: ReactSelect__Theme.t,
  ) => React.element = "Control"
}

module MenuList = {
  type menuProps<'a> = {
    children: array<React.element>,
    clearValue: unit => unit,
    focusedOption: option<'a>,
    getValue: unit => array<'a>,
    hasValue: bool,
    innerRef: option<ReactDOM.domRef => unit>,
    isLoading: bool,
    isMulti: bool,
    isRtl: bool,
    maxHeight: int,
    options: array<'a>,
    selectOption: option<'a> => unit,
    selectProps: selectProps,
    theme: ReactSelect__Theme.t,
  }

  @module("react-select") @scope("components")
  external make: menuProps<'a> => React.element = "MenuList"
}

type t<'a> = {
  @as("DropdownIndicator") dropdownIndicator?: React.element,
  @as("IndicatorSeparator") indicatorSeparator?: React.element,
  @as("Control") control?: Control.controlProps<'a> => React.element,
  @as("MenuList") menuList?: MenuList.menuProps<'a> => React.element,
}
