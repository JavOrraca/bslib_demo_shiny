tagList(
  navbarPage(
    theme = fn_custom_theme(),
    id = "navbar",
    title = fn_navbar(),
    windowTitle = "Analytics Dashboard",
    footer = fn_footer(),
    
    #--- M O D U L E S ---#
    ui_Overview("main"),
    ui_Mapping("main"),
    ui_Reports("main"),
    ui_About("main")
  )
)