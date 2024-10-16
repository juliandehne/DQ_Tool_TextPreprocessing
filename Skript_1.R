install.packages("skimr")

data()
rm(Olympic_data)
install.packages("devtools")
install.packages("readr")
install.packages("spelling")
install.packages("polyglotr")
install.packages("deeplr")
install.packages("stringdist")
install.packages("textTinyR")

rm(auth_key)

install.packages("reticulate")

# Lade reticulate
library(reticulate)

# Installiere die transformers Bibliothek in Python (falls nicht bereits geschehen)
py_run_string("!pip install transformers")

# Importiere die transformers Bibliothek
transformers <- import("transformers")

# Lade das Modell zur Korrektur
model <- transformers$pipeline("fill-mask", model = "bert-base-uncased")

# Beispielhafter Twitter-Datensatz
tweets <- data.frame(tweet_text = c(
  "I love programing in R.", 
  "Ths is a wnderful day!",
  "R is grreat for data analysis."
))

# Rechtschreibkorrektur für Tweets
corrected_tweets <- sapply(tweets$tweet_text, function(tweet) {
  # Nutze das Modell zur Korrektur des Textes
  result <- model(tweet)
  # Wandle das Ergebnis in einen lesbaren Text um (erster Vorschlag)
  corrected <- result[[1]]$sequence
  return(corrected)
})

# Ausgabe der korrigierten Tweets
corrected_tweets