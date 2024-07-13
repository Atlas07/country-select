type virtualItem = {
  key: int,
  index: int,
  start: int,
  size: int,
  lane: int,
}

type virtualizerOptions<'item> = {
  count: int,
  getScrollElement: unit => Js.Nullable.t<Dom.element>,
  estimateSize: unit => int,
  overscan: int,
  getItemKey?: int => 'item,
  horizontal?: bool,
  lanes?: int,
}

type align = [#auto | #start | #center | #end]
type behavior = [#auto | #smooth]

type scrollToIndexOptions = {
  align?: align,
  behavior?: behavior,
}

type virtualizer = {
  getVirtualItems: unit => array<virtualItem>,
  getTotalSize: unit => int,
  scrollToIndex: (. int, option<scrollToIndexOptions>) => unit,
  measure: unit => unit,
}

@module("@tanstack/react-virtual")
external useVirtualizer: virtualizerOptions<'item> => virtualizer = "useVirtualizer"
