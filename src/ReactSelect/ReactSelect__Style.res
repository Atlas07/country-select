type t

type styleFunction = (t, ReactSelect__State.t) => t

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
