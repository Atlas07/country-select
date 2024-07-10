let options = [
  {"label": "Ukraine", "value": "ua"},
  {"label": "United Arab Emirates", "value": "ae"},
  {"label": "United Kingdom", "value": "gb"},
  {"label": "United States", "value": "us"},
  {"label": "United States Minor Outlying Islands", "value": "um"},
]

@react.component
let make = (~className, ~country: option<string>, ~onChange) => {
  let defaultValue = switch country {
  | Some(code) =>
    options->Array.find(option => option["value"] === code)->Option.map(ReactSelect.makeOption)
  | None => None
  }

  let options = options->Array.map(ReactSelect.makeOption)
  <ReactSelect className options={options} defaultValue onChange />
}
