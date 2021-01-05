## Mercadolibre_iOS Documentation

### Architecture

First of all and I think, one of the most important parts of an app is the Architectural Pattern we decide to use, 
so that's why I'm gonna start explaining the architecture I used and why I decided to use it, based on its pros.

#### Clean Architecture

Most of you are maybe wondering, *what the hell is Clean Architecture*? Ok, let's start with it.

Clean architecture can be used in any application and platform, not just iOS or Android, so it’s very cool to understand the idea behind it.
If you want to learn more about it, I recommend you to read to ***Robert C. Martin***, also known as ***Uncle Bob***, 
who has written a book about how to write your applications in a *Clean Way*.

You've maybe seen this circle, or any other similar, the number of layers isn't really matter, but what I wanted to show you with this circle is:

<img src="https://koenig-media.raywenderlich.com/uploads/2019/06/Clean-Architecture-graph.png" alt="clean_architecture_icon" />

Each circle represent different levels of software in your app, so what levels are for? Okay..

- The **center circle** is the most ***abstract***, and the **outer circle** is the most ***concrete***. 
This is called the ***Abstraction Principle*** and it specifies that inner circles should contain business logic, 
and outer circles should contain implementation details. 

- *If you're not understanding what we're saying,* ***relax***, *we're going to go deeper with an example of which 
files belongs to this* ***business logic***, *so you can understand a lot better.*

- Another principle of Clean Architecture is the ***Dependency Rule*** (pay attention cause this is a really important one). 
This rule specifies that each circle can depend only on the nearest inward circle ***this is what makes the architecture works.***

- The outer circle represents the concrete frameworks or technologies that are specific to the platform such as networking and database access. 
Moving inward, each circle is more abstract and higher-level as we said before. The center circle is the most abstract and contains business logic, 
which doesn’t rely on the framework you’re using.

As a brief conclusion about we said before and in a easier language to understand, when we talk about ***abstract*** layers, we're talking about ***protocols***.
Why? Easy, protocols define behavior rather than implementation, so they're really abstract. By the other hand when we talk about ***concrete*** layers, 
we're talking about ***classes*** that implement those ***protocols*** or contracts that already define the behavior that the classes have to conform.
