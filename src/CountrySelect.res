let coutryToOption = country => country->CountryModel.toObject->ReactSelect.makeOption

@react.component
let make = (~className, ~country: option<string>, ~onChange) => {
  let (countries, setCountries) = React.useState(_ => None)
  let (isLoading, setIsLoading) = React.useState(_ => false)
  let (selectedOption, setSelectedOption) = React.useState(_ => None)

  React.useEffect(() => {
    setIsLoading(_ => true)
    Queries.fetchCountries()
    ->Promise.thenResolve(maybeCountries => {
      Js.log(maybeCountries)

      switch maybeCountries {
      | Ok(countries) =>
        setCountries(_ => countries->Some)
        setIsLoading(_ => false)

        switch country {
        | Some(default) =>
          setSelectedOption(
            _ =>
              countries
              ->Array.find(country => country.value === default)
              ->Option.map(coutryToOption),
          )

        | None => ()
        }

      | _ =>
        setIsLoading(_ => false)
        assert(false)
      }
    })
    ->Promise.done

    None
  }, [])

  let filterOptions = inputValue => {
    switch countries {
    | Some(options) =>
      let lowerCasedInputValue = String.toLowerCase(inputValue)
      options->Array.filter(option =>
        option.label->String.toLowerCase->String.includes(lowerCasedInputValue)
      )
    | None => []
    }
  }

  let loadOptions = inputValue =>
    Promise.make((res, _rej) => {
      inputValue->filterOptions->Array.map(coutryToOption)->res
    })

  let options = switch countries {
  | Some(counties) => counties->Array.map(coutryToOption)
  | None => []
  }

  let handleChange = (option, _action) => {
    setSelectedOption(_ => option->Some)
    onChange(option)
  }

  <>
    // <ReactSelect className options={options} defaultValue onChange />
    <ReactSelect.Async
      className
      cacheOptions=true
      value=selectedOption
      defaultOptions=options
      loadOptions
      onChange={(option, action) => handleChange(option, action)}
      isLoading
      menuShouldScrollIntoView=true
      menuPosition=#fixed
    />
  </>
}
