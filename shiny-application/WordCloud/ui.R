fluidPage(
	# Application title
	titlePanel("Book Word Cloud"),
	
	sidebarLayout(
		# Sidebar with a slider and selection inputs
		sidebarPanel(
			
			selectInput("selection", "Choose a book:",
									choices = books),

						h6("Then click here to process the book's words:"),
			
			actionButton("update", "Process Words"),
			
			h6("Processing a large book takes a while - please be patient..."),
			
			
			hr(),
			sliderInput("freq",
									"Minimum Word Frequency:",
									min = 1,  max = 100, value = 25),
			sliderInput("max",
									"Maximum Words in Cloud:",
									min = 1,  max = 100,  value = 50)
		),
		# Show Word Cloud
		mainPanel(
			plotOutput("plot")
		)
	)
)
