ui_About <- function(id){
  ns <- NS(id)
  
  tabPanel(
    "About",
    fluidRow(
      column(3),
      column(6,
             HTML("<center><img src='https://www.javierorraca.com/images/Javier.jpg' width = '800px'></center>"),
             p(),
             "My name is Javier Orraca and I’m a data scientist. I enjoy building predictive models, developing web applications, cooking, reading, and playing board games. For a living, I get to solve puzzles with data - Life is good.",
             h2("Professional"),
             HTML("My career includes over 15 years of data science, financial strategy, and business analytics for EY, PG&E, KPMG, and Health Net (a Centene Corporation company). As a Data Scientist at Health Net, I work for a Strategic Insights team supporting our Product Performance organization. I help our business develop predictive algorithms and deploy web apps for our internal leaders and Sales teams. I also get to have some extra fun at work by co-hosting a monthly Centene R User Group for our company’s analysts and data scientists."),
             p(),
             h2("Web App Development"),
             HTML("I am a proficient full stack web developer leveraging the R programming language and RStudio professional products. I develop and deploy client and server software including websites, APIs, and interactive web applications such as this demo that you're currently viewing. For interactive, enterprise-grade web apps, R is my programming language of choice."),
             p(),
             HTML("The R programming language allows me to build apps with clean UIs, advanced modules, and I can easily inject HTML, CSS, and JavaScript for unhinged front-end customization. This web app was built with R and the popular Shiny library for R. This site is hosted for free but commercial deployments of R Shiny apps requires more robust IT infrastructure."),
             p(),
             HTML("Open-source tools such as R, Python, and Julia are fast, flexible, fun, and the future of business analytics and data science.")
      ),
      column(3)
    )
  )
}

server_About <- function(id){
}