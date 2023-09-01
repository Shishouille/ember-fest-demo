/** @type {import('tailwindcss').Config} */
const defaultTheme = require('tailwindcss/defaultTheme');

module.exports = {
  content: ['./app/**/*.{gjs,gts,hbs,html,js,ts}'],
  theme: {
    extend: {
      fontFamily: {
        sans: ['TomkinCondense', ...defaultTheme.fontFamily.sans],
        title: ['TTTravels'],
      },
      colors: {
        primary: '#ea473b',
        'primary-hover': '#c83328',
        secondary: '#08175e',
        important: '#00ffc4',
        subdued: '#e8e8e8',
        'subdued-light': '#d8d8d8',
        accent: '#fdffd6',
      },
    },
  },
  plugins: [require('@tailwindcss/forms')],
};
// primary: '#ea473b',
// 'primary-hover': '#c83328',
// accent: '#08175e',
// subdued: '#e8e8e8',
// 'subdued-light': '#d8d8d8',
// 'primary-light': '#fdffd6',
// important: '#00ffc4',
