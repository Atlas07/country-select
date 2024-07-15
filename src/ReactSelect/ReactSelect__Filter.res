type matchFrom = [#any | #start]

type filterOption<'option> = {
  label: string,
  value: string,
  data: 'option,
}

type t<'option> = {
  ignoreCase: bool,
  ignoreAccents: bool,
  trim: bool,
  matchFrom: matchFrom,
  stringify: filterOption<'option> => string,
}

// note: react-select supports custom createFilter logic
// only for sync component because of inner implementation.
// it should be able to access candidate.data.__isNew__
// reference: https://react-select.com/advanced#custom-filter-logic

// In order to support same API there is reimplementation
// of createFilter fn inside Async module
module Async = {
  let makeConfig = (
    ~ignoreCase=true,
    ~ignoreAccents=true,
    ~matchFrom=#any,
    ~trim=true,
    ~stringify=option => `${option.label} ${option.value}`,
    (),
  ) => {
    ignoreCase,
    ignoreAccents,
    matchFrom,
    trim,
    stringify,
  }

  // note: would be improvement to implement ignoreAccents
  let make = (~config: t<'option>, ~candidate: string, ~inputValue: string) => {
    let prepareString = str => {
      let trimmed = config.trim ? str->String.trim : str
      config.ignoreCase ? trimmed->String.toLowerCase : trimmed
    }

    let processedInput = prepareString(inputValue)
    let processedCandidate = prepareString(candidate)

    switch config.matchFrom {
    | #start => processedCandidate->String.startsWith(processedInput)
    | #any => processedCandidate->String.includes(processedInput)
    }
  }
}

@module("react-select")
external createFilter: (t<'option>, 'candidate, string) => bool = "createFilter"
