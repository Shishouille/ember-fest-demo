/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./app/**/*.{gjs,gts,hbs,html,js,ts}'],
  theme: {
    extend: {
      colors: {
        primary: '#ea473b',
        'primary-hover': '#c83328',
      },
    },
  },
  plugins: [require('@tailwindcss/forms')],
};
// primary: '#ea473b',
// 'primary-hover': '#c83328',
// secondary: '#08175e',
// subdued: '#e8e8e8',
// 'subdued-light': '#d8d8d8',
// 'primary-light': '#fdffd6',
// important: '#00ffc4',
