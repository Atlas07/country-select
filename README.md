# ReScript Country Select

A customizable country selection component built with ReScript and React.

## [Live Demo](https://atlas07.github.io/country-select/)

## Features

- Virtualized list for efficient rendering of large datasets
- Async loading of country data
- Customizable styling
- Keyboard navigation support (note: dropdown should be focused)
- Country flag icons integration
- Type-safe data validation

## Technology Stack

- [ReScript](https://rescript-lang.org): The JavaScript-like language you have been waiting for. (previously known as BuckleScript and Reason)
  - [@jihchi/vite-plugin-rescript](https://github.com/jihchi/vite-plugin-rescript): Integrate ReScript with Vite seamlessly.
- [React](https://reactjs.org): A JavaScript library for building user interfaces.
- [Vite](https://vitejs.dev): Next Generation Frontend Tooling.
- [React Select](https://react-select.com/home): A flexible and beautiful Select Input control for ReactJS with multiselect, autocomplete, async and creatable support.
- [react-window](https://github.com/bvaughn/react-window): React components for efficiently rendering large lists and tabular data.
- [flag-icons](https://github.com/lipis/flag-icons): A curated collection of all country flags in SVG.
- [vitest](https://vitest.dev/): A blazing fast unit-test framework, powered by [Vite](https://vitejs.dev) ⚡️.
  - [rescript-vitest](https://github.com/cometkim/rescript-vitest): ReScript bindings to Vitest.
  - [React Testing Library](https://testing-library.com/docs/react-testing-library/intro/): Helps you test UI components in a user-centric way.
- [GitHub Actions](https://github.com/features/actions): CI/CD platform for automated workflows.
- [Spice](https://github.com/sorellabs/spice): A type-safe structural validation library for OCaml and ReScript.

## Deployment

This project uses GitHub Actions for continuous deployment. The workflow is defined in `.github/workflows/deploy.yml`. It automatically builds and deploys the project to GitHub Pages on pushes to the main branch.

## Type-safe Validation

Spice for type-safe structural validation. Spice allows us to define and validate complex data structures at runtime, ensuring that our data always matches our expectations. This is particularly useful for validating API responses and form inputs.

## Virtualization

react-window for efficient rendering of large lists. This allows the country select component to handle a large number of options without performance issues.

## Country Flags

Country flag icons are provided by the flag-icons library, offering high-quality SVG flags for all countries.

## Getting Started

1. Clone the repository
2. Install dependencies: `npm install`
3. Start the development server: `npm run dev`
4. Run tests: `npm test`
5. Build for production: `npm run build`

## Next Steps

1. Add Storybook for CountriesSelect as it could be treated as reusable component
2. Implement i18n support for multi-language functionality
3. Implement keyboard shortcut for quick country selection (e.g., typing country code)
4. Create a changelog to track version updates and changes
5. Implement a theming system for easy style customization
6. Add support for region/continent filtering
7. Support for missing flags
8. Lazy load flags for slow connections, SSR support
