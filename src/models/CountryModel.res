@spice
type t = {
  label: string,
  value: string,
}

let toObject = t => {"label": t.label, "value": t.value}

// let country_decode = t_decode
// let encode = t_encode

@spice
type counties = array<t>
