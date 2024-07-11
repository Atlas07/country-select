%%raw(`import './CountrySelect.css'`)

module Style = ReactSelect.Style

let selectStyles: Style.styles = {
  container: provided => {
    let override = {
      "border": "1px solid rgba(0, 0, 0, 0.2)",
      "borderRadius": "3px",
    }->Style.makeStyle

    Style.mergeStyles(provided, override)
  },
  control: provided => {
    let override = {
      "border": 0,
      "boxShadow": 0,
      "borderBottom": "1px solid rgba(0, 0, 0, 0.2)",
      "borderRadius": 0,
      "&:hover": {
        "borderColor": "rgba(0, 0, 0, 0.2)",
      },
    }->Style.makeStyle

    Style.mergeStyles(provided, override)
  },
  menu: _provided => {
    {
      "border": 0,
    }->Style.makeStyle
  },
  menuList: provided => {
    let override = {
      "::-webkit-scrollbar": {
        "display": "none",
      },
    }->Style.makeStyle

    Style.mergeStyles(provided, override)
  },
}

module Dropdown = {
  @react.component
  let make = (~children, ~isOpen, ~target) => {
    <div className="dropdown">
      {target}
      {switch isOpen {
      | true => <div className="menu"> {children} </div>
      | false => React.null
      }}
    </div>
  }
}

let coutryToOption = country => country->CountryModel.toObject->ReactSelect.makeOption

@react.component
let make = (~className, ~country: option<string>, ~onChange) => {
  let (countries, setCountries) = React.useState(_ => None)
  let (isLoading, setIsLoading) = React.useState(_ => false)
  let (isOpen, setIsOpen) = React.useState(_ => false)
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
    setIsOpen(_ => false)
    onChange(option)
  }

  <Dropdown
    isOpen={isOpen}
    target={<button
      className="shadow countries-dropdown-button" onClick={_ => setIsOpen(prev => !prev)}>
      {switch selectedOption {
      | Some(value) =>
        let formatted = value->Obj.magic
        <>
          <span className={`fi fi-${formatted["value"]} flag-icon`} />
          <span className="countries-dropdown-text"> {formatted["label"]->React.string} </span>
          <TriangleSVG direction={isOpen ? #up : #down} />
        </>
      | None => "Select a State"->React.string
      }}
    </button>}>
    <ReactSelect.Async
      autoFocus=true
      backspaceRemovesValue=false
      components={"DropdownIndicator": React.null, "IndicatorSeparator": React.null}
      controlShouldRenderValue=false
      hideSelectedOptions=false
      isClearable=false
      menuIsOpen=true
      onChange={(option, action) => handleChange(option, action)}
      tabSelectsValue=false
      value=selectedOption
      className
      classNamePrefix="TEST"
      isLoading
      placeholder="Search"
      cacheOptions=true
      defaultOptions=options
      loadOptions
      maxMenuHeight=400
      styles={selectStyles}
      // onBlur={_ => setIsOpen(_ => false)}
    />
  </Dropdown>
}
