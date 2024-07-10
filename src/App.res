%%raw(`import './App.css'`)

@react.component
let make = () => {
  <CountrySelect
    className="custom-class" country=Some("us") onChange={country => Js.log(country)}
  />
}
