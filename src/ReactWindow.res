type scrollToAlignment = [#auto | #start | #center | #end | #smart]
type scrollDirection = [#forward | #backward]
type layout = [#vertical | #horizontal]

type itemData

type listChildComponentProps = {
  index: int,
  style: ReactDOM.Style.t,
  data: itemData,
}

type listRef = {scrollToItem: (. int, scrollToAlignment) => unit}

module FixedSizeList = {
  @module("react-window") @react.component
  external make: (
    ~children: listChildComponentProps => React.element,
    ~className: string=?,
    ~height: int,
    ~itemCount: int,
    ~itemSize: int,
    ~layout: layout=?,
    ~overscanCount: int=?,
    ~width: string,
    ~ref: React.ref<Js.Nullable.t<listRef>>=?,
  ) => React.element = "FixedSizeList"
}
