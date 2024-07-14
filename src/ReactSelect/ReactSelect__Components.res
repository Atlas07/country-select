type controlProps

type selectProps = {
  isClearable: bool,
  isDisabled: bool,
  isLoading: bool,
  isMulti: bool,
  isOptionDisabled: bool,
  menuListId: string,
}

@module("react-select") @scope("components")
external control: React.component<controlProps> = "Control"

module MenuList = {
  type props<'a> = {
    children: array<React.element>,
    clearValue: unit => unit,
    focusedOption: 'a,
    getValue: unit => array<'a>,
    hasValue: bool,
    innerRef: option<ReactDOM.domRef => unit>,
    isLoading: bool,
    isMulti: bool,
    isRtl: bool,
    maxHeight: int,
    options: array<'a>,
    selectOption: 'a => unit,
    selectProps: selectProps,
    theme: ReactSelect__Theme.t,
  }

  @module("react-select") @scope("components")
  external menuList: React.component<props<'a>> = "MenuList"

  //   @module("react-select") @scope("components") @react.component
  //   external make: (
  //     ~ref: 'ref=?,
  //     ~children: React.element,
  //     ~clearValue: unit => unit,
  //     ~cx: 'cx,
  //     ~focusedOption: optionType<'a>,
  //     ~getClassNames: ('key, 'props) => string,
  //     ~getStyles: ('key, 'props) => {..},
  //     ~getValue: unit => array<optionType<'a>>,
  //     ~hasValue: bool,
  //     ~innerProps: {..},
  //     ~innerRef: 'innerRefProps => 'innerRefObj=?,
  //     ~isLoading: bool,
  //     ~isMulti: bool,
  //     ~isRtl: bool,
  //     ~maxHeight: int,
  //     ~options: array<optionType<'a>>,
  //     ~selectOption: optionType<'a> => unit,
  //     ~selectProps: {..},
  //     ~setValue: 'setValueProps => unit,
  //     ~theme: Theme.t,
  //   ) => React.element = "MenuList"
}

type t<'a> = {
  @as("DropdownIndicator") dropdownIndicator?: React.element,
  @as("IndicatorSeparator") indicatorSeparator?: React.element,
  @as("Control") control?: React.element,
  @as("MenuList") menuList?: MenuList.props<'a> => React.element,
}
