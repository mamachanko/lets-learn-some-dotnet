//Let's TDD an API with <mark>.NET</mark>
//
//animal api
//🐙 🐶 🐱
//|| colorVar:alt
//
//**bootstrap**<br>_static data_<br><mark>database</mark>
//
//https://media.giphy.com/media/l2Je3LK91ePwCvoyY/giphy.gif
//
//Thanks!
//🙇🏻‍♂️
//|| colorVar:alt
//
//
const config = {
  colors: 'flo',
  fonts: 'heron',
  transition: 'fadeIn',
  controllers: {
    fullscreen: true,
    focus: true,
    swiper: true,
    markdown: true,
    preload: true,
    pagenum: true,
    progressbar: true,
    consoleNotes: {
      clear: true
    }
  },
  modules: {
    highlightjs: 'gradient-dark'
  },
  scenes: [
    {
      blocks: [
        {
          textVar: 'title',
          scale: 3.5,
          type: 'text',
          text: `<h1>Let's TDD an API with <mark>.NET</mark> </h1>
            <p>press <mark>f</mark> to go fullscreen</p>
          `
        }
      ]
    }
  ]
}
