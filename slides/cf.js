//Let's deploy a <mark>.NET</mark> thing To CF
//
//animal api
//🐙 🐶 🐱
//<br>in the 🌥
//|| colorVar:alt
//
//**deploy 🙅‍♀️**<br>_steeltoe_ <br><mark>deploy 🙆🏽‍♂️</mark>
//
//<mark>⛅ ❯  </mark>
//to the command line!
//
//https://media.giphy.com/media/xT3i12DSQVKQWgZRq8/source.mp4
//
//<a href="https://steeltoe.io">steeltoe</a>
//|| colorVar:alt
//
//https://media.giphy.com/media/YA5oXxbyy8N5C/source.gif
//
//Thanks!
//🙇️
//|| colorVar:alt
const config = {
  colors: 'gina',
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
          text: `<h1>Let's deploy a <mark>.NET</mark> thing To CF</h1>`
        }
     ],
    },
    {
     blocks: [
       {
         textVar: 'title',
         scale: 3.5,
         type: 'text',
         text: `<h1>Animal API</h1>🐙🐶🐱`
       }
     ],
    },
    {
     blocks: [
       {
         textVar: 'title',
         scale: 3.5,
         type: 'text',
         text: `<h1><strong>DEPLOY 🙅‍♀️</strong></h1><br><h1><em>steeltoe</em></h1><br><h1><mark>deploy 🙆🏽‍♂️</mark</h1>`,
         colorVar: 'alt'
       }
     ],
    },
    {
     blocks: [
       {
         textVar: 'title',
         scale: 3.5,
         type: 'text',
         text: `<h1><mark>⛅ ❯  </mark></h1>to the command line!`
       }
      ]
    },
    {
     blocks: [
       {
         textVar: 'title',
         scale: 3.5,
         type: 'video',
         url: `https://media.giphy.com/media/xT3i12DSQVKQWgZRq8/source.mp4`
       }
      ]
    },
    {
     blocks: [
       {
         textVar: 'title',
         scale: 3.5,
         type: 'text',
         text: `<h1><a href="https://steeltoe.io">steeltoe</a></h1>`,
         colorVar: 'alt'
       }
      ]
    },
    {
     blocks: [
       {
         textVar: 'title',
         scale: 3.5,
         type: 'image',
         url: `https://media.giphy.com/media/YA5oXxbyy8N5C/source.gif`
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
         colorVar: 'alt'
       }
      ]
    }
  ]
}
