open Vitest
open Bindings
open ReactTestingLibrary
open JsDom

let awaitFor = ms => {
  Promise.make((resolve, _reject) => {
    let _ = setTimeout(() => {
      resolve(. ())
    }, ms)
  })
}

let mockCountriesFetch: (string, array<CountryModel.t>) => promise<unit> = %raw(`
  function (urlToMock, mockedCountries) {

    global.fetch = (url) => {
      if (url === urlToMock) {
        return Promise.resolve({
            ok: true,
            json: () => Promise.resolve(mockedCountries)
        })
      } else {
        Promise.resolve({})
      }
    }
  }
`)

beforeEach(() => {
  %raw("vi.resetAllMocks()")
})

testAsync("renders component with selected default country", async t => {
  t->assertions(1)

  let countries = [
    CountryModel.make(~label="United States", ~value="us"),
    CountryModel.make(~label="Ukraine", ~value="ua"),
  ]
  await mockCountriesFetch(Queries.countriesURL, countries)

  act(() => {
    render(
      <CountrySelect
        className="country-select" country=Some("us") onChange={country => Js.log(country)}
      />,
    )
  })

  await waitFor(() => {
    screen->getByText("United States")->expect->toBeInTheDocument
  })
})

testAsync("renders component with no selected default country", async t => {
  t->assertions(1)

  let countries = [
    CountryModel.make(~label="United States", ~value="us"),
    CountryModel.make(~label="Ukraine", ~value="ua"),
  ]
  await mockCountriesFetch(Queries.countriesURL, countries)

  act(() => {
    render(
      <CountrySelect
        className="country-select" country=None onChange={country => Js.log(country)}
      />,
    )
  })

  await waitFor(() => {
    screen->getByText("Select a Country")->expect->toBeInTheDocument
  })
})

testAsync("renders component with no options", async t => {
  t->assertions(1)

  let countries = []
  await mockCountriesFetch(Queries.countriesURL, countries)

  act(() => {
    render(
      <CountrySelect
        className="country-select" country=None onChange={country => Js.log(country)}
      />,
    )
  })

  await waitFor(() => {
    screen->getByText("Select a Country")->expect->toBeInTheDocument
  })
})
