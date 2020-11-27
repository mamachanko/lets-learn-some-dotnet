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
          text: `<h1>Let's learn about <mark>.NET</mark></h1>`
        }
      ]
    },
    {
      layout: 'stack',
      blocks: [
        {
          type: 'image',
          url: 'https://www.globbit.com/wp-content/uploads/2016/02/Satya-Nadella.jpg'
        },
        {
          textVar: 'mention',
          scale: 3.5,
          type: 'text',
          text: '<h1>that microsoft thing</h1>'
        }
      ],
    },
    {
      blocks: [
        {
          textVar: 'title',
          scale: 3.5,
          type: 'image',
          url: 'https://media.giphy.com/media/l41YcLtmnhYyUlbfq/source.gif'
        }
      ]
    },
    {
      blocks: [
        {
          textVar: 'title',
          scale: 3.5,
          type: 'text',
          colorVar: 'sec',
          text: '<h1>so <strong>what</strong> is it?</h1>'
        }
      ]
    },
    {
      blocks: [
        {
          textVar: 'title',
          scale: 3.5,
          type: 'text',
          text: ` <h1> It's <br> not <br> Java </h1> `
        }
      ]
    },
    {
      blocks: [
        {
          textVar: 'title',
          scale: 3.5,
          type: 'text',
          text: ` <h1> It's <br> <span style="text-decoration: line-through;"><strong>not</strong></span> like <br> Java </h1> `
        }
      ]
    },
    {
      blocks: [
        {
          textVar: 'title',
          scale: 3.5,
          type: 'text',
          text: ` <h1> It's <br> <span style="text-decoration: line-through;"><strong>not</strong></span> like <br> <span style="text-decoration: line-through;"><strong>Java</strong></span> the JVM </h1> `
        }
      ]
    },
    {
      blocks: [
        {
          textVar: 'title',
          scale: 3.5,
          type: 'text',
          text: ` <h1> It's <br> <span style="text-decoration: line-through;"><strong>not</strong></span> <em>kinda</em> like <br> <span style="text-decoration: line-through;"><strong>Java</strong></span> the JVM, all its languages, their ecosystems and spring and ...  </h1> `
        }
      ]
    },
    {
      blocks: [
        {
          textVar: 'title',
          scale: 3.5,
          type: 'text',
          text: `<h1>It's<br>not<br>Java</h1>🤷`
        }
      ]
    },
    {
      blocks: [
        {
          textVar: 'title',
          scale: 3.5,
          type: 'text',
          colorVar: 'sec',
          text: `<h1/>so <strong>what</strong> is it?</h1>`
        }
      ]
    },
    {
      blocks: [
        {
          textVar: 'title',
          scale: 3.5,
          type: 'text',
          colorVar: 'sec',
          text: '<h1><a href="https://twitter.com/kelseyhightower/status/1288693463022620672">What Kelsey Hightower said.</a></h1>'
        }
      ]
    },
    {
      blocks: [
        {
          textVar: 'title',
          scale: 3.5,
          type: 'text',
          colorVar: 'sec',
          text: '<h1><a href="https://twitter.com/shanselman/status/1288698620804362240">What Scott Hanselman replied.</a></h1>'
        }
      ]
    },
    {
      blocks: [
        {
          textVar: 'title',
          scale: 3.5,
          type: 'text',
          text: `<h1/>runtime<br>languages<br>libraries<br>frameworks<br>cli</h1>`
        }
      ]
    },
    {
      blocks: [
        {
          textVar: 'title',
          scale: 3.5,
          type: 'text',
          text: `<h1/><mark>.net</mark> is an ecosystem</h1>`
        }
      ]
    },
    {
      blocks: [
        {
          textVar: 'title',
          scale: 3.5,
          type: 'text',
          text: `<h1/>Let's <strong>build</strong> something</h1>`
        }
      ]
    },
    {
      blocks: [
        {
          textVar: 'title',
          scale: 3.5,
          type: 'text',
          colorVar: 'sec',
          text: `<h1/><code>📚 ❯ </code></h1>to the command line`
        }
      ]
    },
    {
      blocks: [
        {
          textVar: 'title',
          scale: 3.5,
          type: 'text',
          text: `<h1/>thoughtful<br><mark>welcoming</mark><br><strong>familiar</strong></h1>`
        }
      ]
    },
    {
      blocks: [
        {
          textVar: 'title',
          scale: 3.5,
          type: 'text',
          text: `<h1/>thanks!</h1>🙇`
        }
      ]
    },
  ]
}

