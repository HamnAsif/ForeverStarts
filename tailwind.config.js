module.exports = {
  content: [
    "./app/views/**/*.{html.erb,html,js}",
    "./node_modules/flowbite/**/*.js"
  ],
  theme: {
    extend: {},
  },
  plugins: [
    require('flowbite/plugin')
  ],
}


