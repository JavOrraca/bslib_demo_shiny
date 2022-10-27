ui_About <- function(id){
  ns <- NS(id)
  
  tabPanel(
    "About",
    fluidRow(
      column(3),
      column(6,
             HTML("<center><img src='https://www.javierorracadeatcu.com/images/Javier_Tulum.jpg' width = '800px'></center>"),
             p(),
             "My name is Javier Orraca-Deatcu and I’m a data scientist. I enjoy building predictive models, developing web applications, cooking, reading, and playing board games. For a living, I get to solve puzzles with data - Life is good.",
             h2("Professional"),
             HTML("My career includes over 15 years of data science, financial strategy, and business analytics for EY, PG&E, KPMG, Health Net (a Centene Corporation company), and Bloomreach. My teams apply data science techniques to empower decision makers with descriptive, predictive, and prescriptive analytics. I help bridge the gap between business needs and IT to develop and deploy automation solutions, predictive algorithms, and interactive web apps."),
             p(),
             h2("Web App Development"),
             HTML("I am a proficient full stack web dev leveraging the R programming language and Posit (formerly RStudio) professional products. I develop and deploy client and server software such as packages, websites, APIs, and interactive web apps such as this demo that you're currently viewing. For interactive, enterprise-grade web apps, R is my programming language of choice."),
             p(),
             HTML("The R programming language allows me to build apps with clean UIs, advanced modules, and I can easily inject HTML, CSS, and JavaScript for unhinged front-end customization. This web app was built with R and the popular Shiny library for R. This site is hosted for free but commercial deployments of R Shiny apps require more robust IT infrastructure."),
             p(),
             HTML("Open-source tools such as R, Python, and Julia are fast, flexible, fun, and the future of business analytics and data science.")
      ),
      column(3)
    )
  )
}

server_About <- function(id){
}