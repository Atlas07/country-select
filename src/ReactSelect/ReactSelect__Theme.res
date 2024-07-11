type colors = {
  primary: string,
  primary75: string,
  primary50: string,
  primary25: string,
  danger: string,
  dangerLight: string,
  neutral0: string,
  neutral5: string,
  neutral10: string,
  neutral20: string,
  neutral30: string,
  neutral40: string,
  neutral50: string,
  neutral60: string,
  neutral70: string,
  neutral80: string,
  neutral90: string,
}

let makeColors = (
  ~primary="#2684FF",
  ~primary75="#4C9AFF",
  ~primary50="#B2D4FF",
  ~primary25="#DEEBFF",
  ~danger="#DE350B",
  ~dangerLight="#FFBDAD",
  ~neutral0="hsl(0, 0%, 100%)",
  ~neutral5="hsl(0, 0%, 95%)",
  ~neutral10="hsl(0, 0%, 90%)",
  ~neutral20="hsl(0, 0%, 80%)",
  ~neutral30="hsl(0, 0%, 70%)",
  ~neutral40="hsl(0, 0%, 60%)",
  ~neutral50="hsl(0, 0%, 50%)",
  ~neutral60="hsl(0, 0%, 40%",
  ~neutral70="hsl(0, 0%, 30%)",
  ~neutral80="hsl(0, 0%, 20%)",
  ~neutral90="hsl(0, 0%, 10%)",
  (),
) => {
  primary,
  primary75,
  primary50,
  primary25,
  danger,
  dangerLight,
  neutral0,
  neutral5,
  neutral10,
  neutral20,
  neutral30,
  neutral40,
  neutral50,
  neutral60,
  neutral70,
  neutral80,
  neutral90,
}

type spacing = {
  baseUnit: int,
  controlHeight: int,
  menuGutter: int,
}

let makeSpacing = (~baseUnit=4, ~controlHeight=38, ~menuGutter=8, ()) => {
  baseUnit,
  controlHeight,
  menuGutter,
}

type t = {
  borderRadius: int,
  colors: colors,
  spacing: spacing,
}

let make = (~borderRadius=4, ~colors=makeColors(), ~spacing=makeSpacing(), ()) => {
  borderRadius,
  colors,
  spacing,
}
