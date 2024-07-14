%%raw(`import './VirtualizedMenuList.css'`)

let itemHeight = 26

let make = (
  ~children,
  ~maxHeight,
  ~selectProps: ReactSelect.Components.selectProps,
  ~focusedOption: ReactSelect.optionType<CountryModel.t>,
  ~getValue: unit => array<ReactSelect.optionType<CountryModel.t>>,
  ~options: array<ReactSelect.optionType<CountryModel.t>>,
) => {
  let listRef: React.ref<Js.Nullable.t<ReactWindow.listRef>> = React.useRef(Js.Nullable.null)

  React.useEffect(() => {
    let focusIndex = options->Array.findIndex(opt => opt.label === focusedOption.label)

    switch (focusIndex >= 0, listRef.current->Nullable.toOption) {
    | (true, Some(ref)) => ref.scrollToItem(. focusIndex, #smart)
    | _ => ()
    }

    None
  }, (focusedOption, options))

  switch options->Array.length === 0 {
  | true => selectProps.noOptionsMessage({inputValue: "No options"})
  | false =>
    <div
      ariaMultiselectable={selectProps.isMulti}
      id={selectProps.menuListId}
      role="listbox"
      tabIndex={-1}>
      <ReactWindow.FixedSizeList
        className="hide-scrollbar"
        height=maxHeight
        itemCount={children->Array.length}
        itemSize=itemHeight
        width="100%"
        ref={listRef}>
        {({index, style}) => {
          let child = children->Array.get(index)->Option.getOr(React.null)
          let option = options->Array.get(index)->Option.getOr(focusedOption)
          let isSelected = getValue()->Array.some(value => value.label == option.label)

          <div
            style={style}
            ariaSelected={isSelected}
            id={`${selectProps.menuListId}-option-${index->Int.toString}`}
            role="option"
            tabIndex={-1}>
            {child}
          </div>
        }}
      </ReactWindow.FixedSizeList>
    </div>
  }
}
