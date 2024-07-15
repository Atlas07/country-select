%%raw(`import './CountrySelect.css'`)

module FilterAsync = ReactSelect.Filter.Async
module Customs = CountrySelect__Customs

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
        | None =>
          <>
            <span> {"Select a State"->React.string} </span>
            <TriangleSVG className="dropdown-arrow" direction={isOpen ? #up : #down} />
          </>
        }}
      </button>
    }
  }

  @react.component
  let make = (~children, ~isOpen, ~onClose, ~target, ~isError) => {
    <div className="dropdown">
      {target}
      {switch isError {
      | true =>
        <div className="dropdown-error">
          <ErrorSVG className="dropdown-error-icon" width="16" height="16" fill="red" />
          <p> {"Something went wrong"->React.string} </p>
        </div>
      | false => React.null
      }}
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
  let {fetchState, countries, isError, isLoading} = CountrySelect__Hooks.useFetchCountries()
  let (isOpen, setIsOpen) = React.useState(_ => false)
  let (selectedOption, setSelectedOption) = React.useState(_ => None)

  React.useEffect(() => {
    switch (fetchState, country) {
    | (Loaded(countries), Some(default)) =>
      setSelectedOption(_ => countries->Array.find(country => country.value === default))
    | _ => ()
    }
    None
  }, (fetchState, country))

  let loadOptions = (inputValue, _callback) =>
    Promise.make((res, _rej) => {
      switch fetchState {
      | Loaded(options) =>
        let filtered =
          options->Array.filter(option => filterCountries(~candidate=option.label, ~inputValue))
        filtered->res
      | _ => []->res
      }
    })

  let handleChange = (option, _action) => {
    setSelectedOption(_ => option->Some)
    setIsOpen(_ => false)
    onChange(option)
  }

  <Dropdown
    isOpen={isOpen}
    onClose={_ => setIsOpen(_ => false)}
    isError
    target={<Dropdown.Target selectedOption isOpen setIsOpen />}>
    <ReactSelect.Async
      autoFocus=true
      backspaceRemovesValue=false
      components={
        dropdownIndicator: React.null,
        indicatorSeparator: React.null,
        control: ControlWithSearchIcon.make,
        menuList: VirtualizedMenuList.make,
      }
      controlShouldRenderValue=false
      hideSelectedOptions=false
      isClearable=false
      menuIsOpen=true
      onMenuClose={_ => setIsOpen(_ => false)}
      onChange={(option, action) => handleChange(option, action)}
      tabSelectsValue=false
      value={selectedOption}
      className
      placeholder="Search"
      cacheOptions=true
      defaultOptions=countries
      loadOptions
      maxMenuHeight=400
      styles=Customs.customStyles
      theme={_ => Customs.customTheme}
      menuShouldScrollIntoView=false
      isLoading
      isDisabled=isError
      formatOptionLabel={(data, _context) => {
        <div className="option-formatted">
          <span className={`fi fi-${data.value} flag-icon flag-icon-option`} />
          <span className="option-center-value"> {data.label->React.string} </span>
          // note: i'm not sure where i need to obtain this data
          // so i leave commented code here, so it could be easily used
          // <span className="option-right-value"> {"230.2K"->React.string} </span>
        </div>
      }}
    />
  </Dropdown>
}
