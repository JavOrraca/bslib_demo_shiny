fn_footer <- function(){
  div(
    class = "javier_footer",
    div(
      HTML("This web app demo was developed by <a href='https://www.javierorraca.com'>Javier Orraca</a> using the R programming language.<br>"),
      a(href = "https://www.linkedin.com/in/orraca/", icon("linkedin-in")),
      a(href = "https://soundcloud.com/scatterpodcast", icon("soundcloud")),
      a(href = "https://open.spotify.com/show/64UpJwByrdsrLSYObuEeHx?si=f047fnwiRdydzYLkIKvxrA&dl_branch=1", icon("spotify")),
      a(href = "https://podcasts.apple.com/us/podcast/scatter-podcast/id1458544194", icon("apple"))
    )
  )
}