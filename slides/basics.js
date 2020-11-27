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
          text: `<h1>Let's learn about <mark>.NET</mark></h1>`
        }
      ]
    },
    {
      blocks: [
        {
          textVar: 'title',
          scale: 3.5,
          type: 'text',
          text: `that <img src="https://img-prod-cms-rt-microsoft-com.akamaized.net/cms/api/am/imageFileData/RE1Mu3b?ver=5c31"/> thing`
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
          text: '<h1>so <strong>what</strong> is it?</h1>'
        }
      ]
    }
  ]
}

//Let's learn about <mark>.NET</mark>
//
//that <img src="https://img-prod-cms-rt-microsoft-com.akamaized.net/cms/api/am/imageFileData/RE1Mu3b?ver=5c31"/> thing
//
//https://media.giphy.com/media/l41YcLtmnhYyUlbfq/source.gif
//
//so **what** is it?
//|| colorVar:sec
//
//It's<br>not<br>Java
//|| colorVar:alt
//
//It's<br><span style="text-decoration: line-through;">**not**</span> like<br>Java
//|| colorVar:alt
//
//It's<br><span style="text-decoration: line-through;">**not**</span> like<br><span style="text-decoration: line-through;">**Java**</span> the JVM
//|| colorVar:alt
//
//It's<br><span style="text-decoration: line-through;">**not**</span> like<br><span style="text-decoration: line-through;">**Java**</span> the JVM
//|| colorVar:alt
//
//It's<br><span style="text-decoration: line-through;">**not**</span> _kinda_ like<br><span style="text-decoration: line-through;">**Java**</span> the JVM, all its languages, their ecosystems and spring and ... 
//|| colorVar:alt
//
//It's<br>not<br>Java️
//|| colorVar:alt
//
//so **what** is it?
//|| colorVar:sec
//
//<a href="https://twitter.com/kelseyhightower/status/1288693463022620672">Kelsey Hightower</a>
//🐦
//_"I went into .NET thinking this was a programming language, but it seems I've stumbled upon a mini operating system with support for multiple execution environments, programming languages, and now I have so many questions."_
//
//<a href="https://twitter.com/shanselman/status/1288698620804362240">Scott Hanselman</a>
//🐧
//```
//.NET = The Ecosystem
//CLR = JVM
//C#, F#, VB, others = Languages
//Nuget = npm, maven, etc
//dotnet cli = your entry point, SDK, driver, javac, go, etc 
//dotnet new = templates
//dotnet run = dev time compile and run
//dotnet publish = ready up for deploy
//```
//
//runtime<br>languages<br>libraries<br>frameworks<br>cli
//
//<mark>.net</mark> is an ecosystem
//
//Let's **build** something
//|| colorVar:alt
//
//`📚 ❯ `
//to the command line
//|| colorVar:sec
//
//thoughtful<br><mark>welcoming</mark><br>**familiar**
//|| colorVar:sec
//
//thanks!
//🙇
//
