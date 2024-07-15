type fetchState<'a> =
  | Initial
  | Loading
  | Loaded('a)
  | Error(string)

type hookResult = {
  fetchState: fetchState<array<CountryModel.t>>,
  isLoading: bool,
  isError: bool,
  countries: array<CountryModel.t>,
}

let isLoading = fetchState =>
  switch fetchState {
  | Loading => true
  | _ => false
  }

let isError = fetchState =>
  switch fetchState {
  | Error(_) => true
  | _ => false
  }

let countries = fetchState =>
  switch fetchState {
  | Loaded(countries) => countries
  | _ => []
  }

let useFetchCountries = () => {
  let (fetchState, setFetchState) = React.useState(() => Initial)

  React.useEffect(() => {
    setFetchState(_ => Loading)
    Queries.fetchCountries()
    ->Promise.thenResolve(maybeCountries => {
      Js.log(maybeCountries)

      switch maybeCountries {
      | Ok(countries) => setFetchState(_ => countries->Loaded)
      | Error(error) => setFetchState(_ => error.message->Error)
      }
    })
    ->Promise.catch(error => {
      setFetchState(_ => error->String.make->Error)
      Promise.resolve()
    })
    ->Promise.done

    None
  }, [])

  {
    fetchState,
    isLoading: fetchState->isLoading,
    isError: fetchState->isError,
    countries: fetchState->countries,
  }
}
