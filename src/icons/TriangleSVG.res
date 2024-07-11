%%raw(`import './TriangleSVG.css'`)

type direction = [#up | #down | #left | #right]

let getDirection = direction =>
  switch direction {
  | #up => "up"
  | #down => ""
  | #left => "left"
  | #right => "right"
  }

@react.component
let make = (~className="", ~direction=#down, ~fill="#333333", ~width="8", ~height="8") => {
  let directionClassName = getDirection(direction)

  <svg
    className={`${className} ${directionClassName}`}
    width
    height
    viewBox="0 0 8 8"
    fill="none"
    xmlns="http://www.w3.org/2000/svg">
    <path fillRule="evenodd" clipRule="evenodd" d="M0 2H8L4 7L0 2Z" fill />
  </svg>
}
