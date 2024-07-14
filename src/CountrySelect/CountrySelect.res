%%raw(`import './CountrySelect.css'`)

module FilterAsync = ReactSelect.Filter.Async
module Customs = CountrySelect__Customs

module CustomControl = {
  let make: (
    React.component<ReactSelect.Components.controlProps>,
    React.element,
  ) => React.element = %raw(`
    function (Control, Icon) {
      return function (props) {
        const { children, ...rest } = props;

        return React.createElement(
          Control,
          rest,
          Icon,
          children
        );
      }
    }
  `)
}

let customControlComponent = CustomControl.make(
  ReactSelect.Components.control,
  <SearchSVG className="control-search-icon" />,
)

let filterCountries = FilterAsync.make(~config=FilterAsync.makeConfig(~matchFrom=#start, ()))

module Dropdown = {
  module Target = {
    @react.component
    let make = (~selectedOption: option<CountryModel.t>, ~isOpen, ~setIsOpen) => {
      <button className="shadow countries-dropdown-button" onClick={_ => setIsOpen(prev => !prev)}>
        {switch selectedOption {
        | Some(option) =>
          <>
            <span className={`fi fi-${option.value} flag-icon`} />
            <span className="countries-dropdown-text"> {option.label->React.string} </span>
            <TriangleSVG className="dropdown-arrow" direction={isOpen ? #up : #down} />
          </>
        | None => "Select a State"->React.string
        }}
      </button>
    }
  }

  @react.component
  let make = (~children, ~isOpen, ~onClose, ~target) => {
    <div className="dropdown">
      {target}
      {switch isOpen {
      | true =>
        <>
          <div className="menu"> {children} </div>
          <div className="blanket" onClick={onClose} />
        </>
      | false => React.null
      }}
    </div>
  }
}

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
          setSelectedOption(_ => countries->Array.find(country => country.value === default))
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

  let loadOptions = (inputValue, _callback) =>
    Promise.make((res, _rej) => {
      switch countries {
      | Some(options) =>
        let filtered =
          options->Array.filter(option => filterCountries(~candidate=option.label, ~inputValue))
        filtered->res
      | None => []->res
      }
    })

  let options = switch countries {
  | Some(counties) => counties
  | None => []
  }

  let handleChange = (option, _action) => {
    setSelectedOption(_ => option->Some)
    setIsOpen(_ => false)
    onChange(option)
  }

  <Dropdown
    isOpen={isOpen}
    onClose={_ => setIsOpen(_ => false)}
    target={<Dropdown.Target selectedOption isOpen setIsOpen />}>
    <ReactSelect.Async
      autoFocus=true
      backspaceRemovesValue=false
      components={
        dropdownIndicator: React.null,
        indicatorSeparator: React.null,
        control: customControlComponent,
        menuList: props => {
          let {children, maxHeight, selectProps, focusedOption, getValue, options} = props

          VirtualizedMenuList.make(
            ~maxHeight,
            ~children,
            ~selectProps,
            ~focusedOption,
            ~getValue,
            ~options,
          )
        },
      }
      controlShouldRenderValue=false
      hideSelectedOptions=false
      isClearable=false
      menuIsOpen=true
      onChange={(option, action) => handleChange(option, action)}
      tabSelectsValue=false
      value={selectedOption}
      className
      isLoading
      placeholder="Search"
      cacheOptions=true
      defaultOptions=options
      loadOptions
      maxMenuHeight=400
      styles={Customs.customStyles}
      theme={_ => Customs.customTheme}
      menuShouldScrollIntoView=false
      formatOptionLabel={(data, _context) => {
        <>
          <span className={`fi fi-${data.value} flag-icon flag-icon-option`} />
          <span> {data.label->React.string} </span>
        </>
      }}
    />
  </Dropdown>
}
