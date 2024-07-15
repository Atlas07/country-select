module ReactTestingLibrary = {
  type renderResult

  @module("@testing-library/react-hooks")
  external act: (unit => unit) => unit = "act"

  @module("@testing-library/react")
  external render: React.element => unit = "render"

  @module("@testing-library/react")
  external screen: renderResult = "screen"

  @module("@testing-library/react")
  external waitFor: (unit => 'a) => promise<'a> = "waitFor"

  @send external getByText: (renderResult, string) => Webapi.Dom.Element.t = "getByText"
  @send external findByText: (renderResult, string) => promise<Webapi.Dom.Element.t> = "findByText"
}

module JsDom = {
  @send
  external toBeInTheDocument: Vitest.expected<Webapi.Dom.Element.t> => unit = "toBeInTheDocument"
}
