%%raw(`import './VirtualizedMenuList.css'`)

let itemHeight = 26

let make = (props: ReactSelect.Components.MenuList.menuProps<CountryModel.t>) => {
  let {children, maxHeight, selectProps, focusedOption, getValue, options} = props
  let listRef: React.ref<Js.Nullable.t<ReactWindow.listRef>> = React.useRef(Js.Nullable.null)

  React.useEffect(() => {
    let focusIndex = switch focusedOption {
    | Some(focusedOption) => options->Array.findIndex(opt => opt.label === focusedOption.label)
    | None => -1
    }

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

          let isSelected = switch focusedOption {
          | Some(focusedOption) =>
            let option = options->Array.get(index)->Option.getOr(focusedOption)
            getValue()->Array.some(value => value.label == option.label)
          | None => false
          }

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
