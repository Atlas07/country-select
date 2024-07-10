%%raw(`import './App.css'`)

@react.component
let make = () => {
  <div className="country-select-wrapper">
    <CountrySelect
      className="country-select" country=Some("us") onChange={country => Js.log(country)}
    />
  </div>
}
