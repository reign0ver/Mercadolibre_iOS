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

<img src="https://koenig-media.raywenderlich.com/uploads/2019/06/Android-Clean-Architecture.png" alt="clean_architecture_icon" />

Each circle represent different levels of software in your app, so what levels are for? Okay..

- The **center circle** is the most ***abstract***, and the **outer circle** is the most ***concrete***. 
This is called the ***Abstraction Principle*** 

- Each circle can depend only on the nearest inward circle. ***Dependency Rule***

As a brief conclusion about we said before and in a easier language to understand, when we talk about ***abstract*** layers, we're talking about ***protocols***.
Why? Easy, protocols define behavior rather than implementation, so they're really abstract. By the other hand when we talk about ***concrete*** layers, 
we're talking about ***classes*** that implement those ***protocols*** or contracts that already define the behavior that the classes have to conform.

Knowing this, let's see the layers of the architecture I used and what is inside one of them:

- **Presentation:** A layer that interacts with the UI (*I used MVP here*).
- **Interactors (UseCases):** Defines actions the user can trigger (*i.e. when a user searchs something searchProductInteractor*).
- **Domain:** Contains the business logic (*models*) of the app and the abstract definition of all the data sources (*Data protocols).
- **Data:** Concrete implementations of all the data sources defined in the Domain layer.
- **Framework:** Implements frameworks as DI frameworks, UI frameworks, Networking frameworks, etc.

The basic flow the app follows is:

View -> Presenter -> Interactor -> Repository -> DataSource

and with this, we can see the ***dependency rule*** is working as the foundation of Clean Architecture says!
