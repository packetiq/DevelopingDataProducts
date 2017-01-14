# Text of the books downloaded from:

# A Mid Summer Night's Dream:
#  http://www.gutenberg.org/cache/epub/2242/pg2242.txt

# The Merchant of Venice:
#  http://www.gutenberg.org/cache/epub/2243/pg2243.txt

# Romeo and Juliet:
#  http://www.gutenberg.org/cache/epub/1112/pg1112.txt

# The Adventures of Huckleberry Finn
#  http://www.textfiles.com/etext/AUTHORS/TWAIN/huck_finn
 
# Alice's Adventures in Wonderland
#  http://www.textfiles.com/etext/FICTION/alice13a.txt

# The Time Machine
#  http://www.textfiles.com/etext/FICTION/time_machine

# White Fang
#  http://www.textfiles.com/etext/FICTION/white_fang

# Sun Tzu on the Art of War
#  http://www.textfiles.com/etext/NONFICTION/suntx10.txt

# The book .txt files have been GZip'd to reduce file size

function(input, output, session) {
	# Define a reactive expression for the document term matrix
	terms <- reactive({
		# Change when the "update" button is pressed...
		input$update
		# ...but not for anything else
		isolate({
			withProgress({
				setProgress(message = "Processing corpus...")
				getTermMatrix(input$selection)
			})
		})
	})
	
	# Make the wordcloud drawing predictable during a session
	wordcloud_rep <- repeatable(wordcloud)
	
	output$plot <- renderPlot({
		v <- terms()
		wordcloud_rep(names(v), v, scale=c(4,0.5),
									min.freq = input$freq, max.words=input$max,
									colors=brewer.pal(8, "Dark2"))
	})
}
