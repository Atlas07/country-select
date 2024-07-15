@spice
type t = {
  label: string,
  value: string,
}

@spice
type counties = array<t>

let make = (~label, ~value) => {
  label,
  value,
}
