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
          text: `<h1>Let's TDD an API with <mark>.NET</mark></h1>`
        }
      ]
    },
    {
      blocks: [
        {
          textVar: 'title',
          scale: 3.5,
          type: 'text',
          text: `<h1>Animal API</h1>🐙🐶🐱`,
          colorVar: 'sec'
        }
      ]
    },
    {
     blocks: [
       {
         textVar: 'title',
         scale: 3.5,
         type: 'text',
         text: `<h1><strong>BOOTSTRAP</strong></h1><br><h1><em>STATIC DATA</em></h1><br><h1>DATABASE</h1>`,
         colorVar: 'alt'
       }
     ],
    },
    {
     blocks: [
       {
         textVar: 'title',
         scale: 3.5,
         type: 'image',
         url: 'https://media.giphy.com/media/l2Je3LK91ePwCvoyY/giphy.gif'
       }
      ]
    },
    {
     blocks: [
       {
         textVar: 'title',
         scale: 3.5,
         type: 'text',
         text: `<h1>Thanks!</h1>🙇️`,
       }
      ]
    }
  ]
}
