let countriesURL = "https://gist.githubusercontent.com/rusty-key/659db3f4566df459bd59c8a53dc9f71f/raw/4127f9550ef063121c564025f6d27dceeb279623/counties.json"

let fetchCountries = () => {
  open Webapi
  let controller = Fetch.AbortController.make()

  Fetch.fetchWithInit(countriesURL, Fetch.RequestInit.make(~signal=controller.signal, ()))
  ->Promise.then(Fetch.Response.json)
  ->Promise.thenResolve(CountryModel.counties_decode)
}
