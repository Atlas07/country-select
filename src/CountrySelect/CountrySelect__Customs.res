module Theme = ReactSelect.Theme
module Style = ReactSelect.Style

let customTheme = Theme.make(
  ~colors=Theme.makeColors(
    ~primary="rgba(255, 219, 179, 1)",
    ~primary25="rgba(255, 219, 179, 0.7)",
    ~neutral90="rgba(51, 51, 51, 1)",
    ~neutral30="rgba(0, 0, 0, 0.32)",
    (),
  ),
  (),
)

let customStyles: Style.styles = {
  container: (provided, _) => {
    let override = {
      "border": "1px solid rgba(0, 0, 0, 0.2)",
      "borderRadius": "3px",
    }->Style.makeStyle

    Style.mergeStyles(provided, override)
  },
  control: (provided, _) => {
    let override = {
      "fontSize": "14px",
      "color": "var(--neutral-30)",
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
  input: (provided, state) => {
    let override = {
      "color": state.theme.colors.neutral30,
    }->Style.makeStyle

    Style.mergeStyles(provided, override)
  },
  menu: (_provided, _) => {
    {
      "border": 0,
    }->Style.makeStyle
  },
  menuList: (provided, _) => {
    let override = {
      "::-webkit-scrollbar": {
        "display": "none",
      },
    }->Style.makeStyle

    Style.mergeStyles(provided, override)
  },
  option: (provided, state) => {
    let override = {
      "fontSize": "14px",
      "height": "auto",
      "minHeight": "26px",
      "padding": "2px 12px",
      "alignItems": "center",
      "whiteSpace": "normal",
      "wordWrap": "break-word",
      "overflow": "hidden",
      "color": state.theme.colors.neutral90,
    }->Style.makeStyle
    Style.mergeStyles(provided, override)
  },
}
