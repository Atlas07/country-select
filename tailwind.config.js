/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./index.html", "./src/**/*.{js,jsx,ts,tsx}"],
  corePlugins: {
    preflight: true, // This includes Tailwind's base styles
    ...Object.keys(
      require("tailwindcss/defaultConfig").corePlugins || {}
    ).reduce((acc, plugin) => ({ ...acc, [plugin]: false }), {}),
  },
  theme: {
    extend: {},
  },
  plugins: [],
};
