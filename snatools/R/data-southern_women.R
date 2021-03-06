#' Davis' Southern Women (Deep South)
#' 
#' `southern_women` is an adaptation of the [Pajek](http://mrvar.fdv.uni-lj.si/pajek/)
#' dataset "DeepSouth.paj". \cr
#' 
#' From the [UC Irvine Network Data Repository documentation](https://networkdata.ics.uci.edu/netdata/html/davis.html): \cr
#' 
#' This is a data set of 18 women observed over a nine-month period. During that period, 
#' various subsets of these women met in a series of 14 informal social events. The data 
#' recored which women met for which events.
#' 
#' This data is originally from Davis, Gardner and Gardner (1941) via UCINET. This 
#' documentation is taken from Freeman (2003) in his usual lucid description. See the 
#' reference to the paper below:
#' 
#' In the 1930s, five ethnographers, Allison Davis, Elizabeth Stubbs Davis, Burleigh B. 
#' Gardner, Mary R. Gardner and J. G. St. Clair Drake, collected data on stratification in 
#' Natchez, Mississippi (Warner, 1988, p. 93). They produced the book cited below 
#' (Davis, et al., 1941) that reported a comparative study of social class in black and in 
#' white society. One element of this work involved examining the correspondence between 
#' people's social class levels and their patterns of informal interaction. Davis et. al 
#' was concerned with the issue of how much the informal contacts made by individuals were 
#' established solely (or primarily) with others at approximately their own class levels. 
#' To address this question the authors collected data on social events and examined 
#' people's patterns of informal contacts.
#' 
#' In particular, they collected systematic data on the social activities of 18 women whom they observed over a nine-month period. During 
#' that period, various subsets of these women had met in a series of 14 informal social 
#' events. The participation of women in events was uncovered using “interviews, the 
#' records of participant observers, guest lists, and the newspapers” 
#' (Davis et al., p. 149). Homans (1950, p. 82), who presumably had been in touch with the 
#' research team, reported that the data reflect joint activities like, “a day's work 
#' behind the counter of a store, a meeting of a women's club, a church supper, a card 
#' party, a supper party, a meeting of the Parent-Teacher Association, etc.”
#'
#' This data set has several interesting properties. It is small and manageable. It 
#' embodies a relatively simple structural pattern, one in which, according to Davis et 
#' al., the women seemed to organize themselves into two more or less distinct groups. 
#' Moreover, they reported that the positions - core and peripheral - of the members of 
#' these groups could also be determined in terms of the ways in which different women had 
#' been involved in group activities. 
#' 
#' At the same time, the Souther Women data set is complicated enough that some of the 
#' details of its patterning are less than obvious. As Homans (1950, p. 84) put it, “The 
#' pattern is frayed at the edges.“ And, finally, this data set comes to us in a two-mode 
#' “woman by event” form. Thus, it provides an opportunity to explore methods designed for 
#' direct application to two-mode data. But at the same time, it can easily be transformed 
#' into two one-mode matrices (woman by woman or event by event) that can be examined 
#' using tools for one-mode analysis.
#' 
#' Because of these properties, this Souther Women data set has become something of a 
#' touchstone for comparing analytic methods in social network analysis. Davis, Gardner 
#' and Gardner presented an intuitive interpretation of the data, based in part on their 
#' ethnographic experience in the community. Then the Souther Women data set was picked up
#' by Homans (1950) who provided an alternative intuitive interpretation. In 1972, 
#' Phillips and Conviser used an analytic tool, based on information theory, that provided
#' a systematic way to reexamine the Souther Women data. Since then, this data set has 
#' been analyzed again and again. It reappears whenever any network analyst wants to 
#' explore the utility of some new tool for analyzing data.
#' 
#' @format
#' * Object Class: `igraph`
#'   + directed: `FALSE`
#'   + bipartite: `TRUE`
#'     + actors: `18`
#'     + non-actors: `14`
#'   + multiplex: `FALSE`
#'   + vertices: `32` ("novices")
#'   + edges: `89` ("affect relations")
#'   + loops: `FALSE`
#' * Vertex Attributes:
#'   + `name`
#'     + `character` representing each person's name.
#'   + `type`/`.actor`
#'     + `logical` indicating whether each vertex belong's to the networks actor mode.
#' * Edge Attributes:
#'   + `event_date` 
#'     + `character` indicating the month and day that the event occurred.
#'   + `event_month`
#'     + `numeric` indicating the month that the event occurred.
#'   + `event_day`
#'     + `numeric` indicating the day that the vent occurred.
#'
#' @source \url{http://vlado.fmf.uni-lj.si/pub/networks/data/GBM/davis.htm}
#' 
#' @references Breiger R. (1974). The duality of persons and groups. Social Forces, 53, 
#' 181-190.
#' @references Davis, A et al. (1941). Deep South. Chicago: University of Chicago Press.
#' @references Linton C. Freeman (2003). Finding Social Groups: A Meta-Analysis of the 
#' Southern Women Data, In Ronald Breiger, Kathleen Carley and Philippa Pattison, eds. 
#' Dynamic Social Network Modeling and Analysis. Washington: The National Academies Press. 
#' 
#' @examples
#' library(snatools)
#' 
#' southern_women
#' 
#' as_network(southern_women)
#' 
"southern_women"