let make = (props: ReactSelect.Components.Control.controlProps<CountryModel.t>) => {
  let {
    className,
    isDisabled,
    isFocused,
    children,
    innerRef,
    innerProps,
    selectProps,
    cx,
    clearValue,
    getClassNames,
    getStyles,
    getValue,
    hasValue,
    isMulti,
    isRtl,
    menuIsOpen,
    options,
    selectOption,
    setValue,
    theme,
  } = props

  <ReactSelect.Components.Control
    className
    isDisabled
    isFocused
    innerRef
    innerProps
    clearValue
    cx
    getClassNames
    getStyles
    getValue
    hasValue
    isMulti
    isRtl
    menuIsOpen
    options
    selectOption
    selectProps
    setValue
    theme>
    <SearchSVG className="control-search-icon" />
    {children}
  </ReactSelect.Components.Control>
}
