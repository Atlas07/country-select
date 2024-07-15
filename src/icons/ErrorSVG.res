@react.component
let make = (
  ~width: string=?,
  ~height: string=?,
  ~fill: string="currentColor",
  ~stroke: string=?,
  ~className: string=?,
) =>
  <svg viewBox="0 0 32 32" ?width ?height fill ?stroke ?className>
    <path
      opacity="0.1"
      d="M16 0C24.8281 0 32 7.17194 32 16C32 24.8281 24.8281 32 16 32C7.17194 32 0 24.8281 0 16C0 7.17194 7.17194 0 16 0Z"
    />
    <rect
      x="9.63602" y="20.9497" width="16" height="2" rx="1" transform="rotate(-45 9.63602 20.9497)"
    />
    <rect
      x="11.0502" y="9.63599" width="16" height="2" rx="1" transform="rotate(45 11.0502 9.63599)"
    />
  </svg>
