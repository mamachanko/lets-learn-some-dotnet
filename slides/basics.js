// Let's learn about .NET
const config = {
  colors: 'belle',
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
          text: `<h1>Let's learn about <mark>.NET</mark></h1>
            <p>press <mark>f</mark> to go fullscreen</p>
          `
        }
      ]
    }
  ]
}
