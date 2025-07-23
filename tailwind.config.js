module.exports = {
  content: [
    "./app/views/**/*.{html.erb,html,js}",
    "./node_modules/flowbite/**/*.js"
  ],
  theme: {
    extend: {
      fontFamily: {
        brock: ['"BrockScript"', 'cursive'],
        vibes: ['"Great Vibes"', 'cursive'],
      },

    },
  },
  plugins: [
    require('flowbite/plugin')
  ],
}



