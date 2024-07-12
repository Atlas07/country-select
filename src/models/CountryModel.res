@spice
type t = {
  label: string,
  value: string,
}

let toObject = t => {"label": t.label, "value": t.value}
let coutryToOption = country => country->toObject->ReactSelect.makeOption

// let country_decode = t_decode
// let encode = t_encode

@spice
type counties = array<t>
