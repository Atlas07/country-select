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

let mockFetch: string => promise<unit> = %raw(`
  function (urlToMock) {
     const mockedCountries = [
        {"label": "United States", "value": "us"},
        {"label": "Ukraine", "value": "ua"},
    ]

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

testAsync("renders component with preselected option", async t => {
  t->assertions(1)

  await mockFetch(Queries.countriesURL)

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
