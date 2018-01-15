### Discriminating Words

[Comparing Corpuses by Word Use](http://sappingattention.blogspot.com/2011/10/comparing-corpuses-by-word-use.html)

When we want to determine whether a word is more distinctive of a one text versus another, there are two basic approaches: addition and multiplication. If a word appears in Text A twice and Text B ten times, do we care that it appears eight times more in Text B (ie measure by addition) or five times more frequently (ie measure by multiplication)? Schmidt visually explores the implications of each approach and then shows how Dunning's Log-Likelihood statistic marries these two approaches. See [response by Ted Underwood](http://tedunderwood.com/2011/11/09/identifying-the-terms-that-characterize-an-author-or-genre-why-dunnings-may-not-be-the-best-method/), experimenting with Mann-Whitney rank test as an alternative.

[Prizewinners Vs. Bestsellers](http://txtlab.org/?p=494), Eva Portelance

The publishing industry regularly draws a distinction among books along familiar lines: the kind of book that wins praise (“literary fiction”) and the kind that sells (“commercial fiction”). Portelance asks whether there might be a difference in the content of these books – whether their authors have categorically “different intuitions on language” – and uses discriminating words to explore that possibility.

[Fightin’ Words: Lexical Feature Selection and Evaluation for Identifying the Content of Political Conflict](http://languagelog.ldc.upenn.edu/myl/Monroe.pdf), Burt Monroe, Michael Colaresi, Kevin Quinn

Abstract: Entries in the burgeoning "text-as-data’"’" movement are often accompanied by lists or visualizations of how word (or other lexical feature) usage differs across some pair or set of documents. These are intended either to establish some target semantic concept (like the content of partisan frames) to estimate word-specific measures that feed forward into another analysis (like locating parties in ideological space) or both. We discuss a variety of techniques for selecting words that capture partisan, or other, differences in political speech and for evaluating the relative importance of those words. We introduce and emphasize several new approaches based on Bayesian shrinkage and regularization. We illustrate the relative utility of these approaches with analyses of partisan, gender, and distributive speech in the U.S. Senate. 


### Sentiment Analysis

[A Novel Method for Detecting Plot](http://www.matthewjockers.net/2014/06/05/a-novel-method-for-detecting-plot/), Matt Jockers

Drawing inspiration from Kurt Vonnegut's theory of narrative, this is the first of several blog posts in which Jockers describes a principle that measuring emotional valence over the course of a novel can account for elements of plot. Later posts suggest the possibility that, based on this kind of accounting, there are just a handful of basic plot arcs. He has also released an R package – [syuzhet](https://cran.r-project.org/web/packages/syuzhet/index.html) – that automates this process.


### Clustering Methods

[Quantitative Formalism: An Experiment](http://litlab.stanford.edu/LiteraryLabPamphlet1.pdf), Sarah Allison, Ryan Heuser, Matt Jockers, Franco Moretti, Michael Witmore

If we show a computer the texts of nineteenth-century novels, can it identify gothic novels from bildungsroman? What in a text signals genre? After promising results sorting Shakespeare's comedies from the tragedies and histories, Allison et al use word frequencies across novels to sort them into genre and explore the interpretive ramifications. The pamphlet is written with a collaborative and experimental ethos.

[On the “Conversion Novel”](http://txtlab.org/?p=459), Andrew Piper

Not clustering per se, but a novel application of distance methods. Piper hypothesizes that the conversion novel – as characterized by Augustine's Confessions – can be identified in part by the distance between the word frequencies of the first and second halves of a book. That is, conversion novels will have second halves that are more distant from their first halves. How might the movement from one vocabulary to another over the course of the book implicate the reader in that conversion process?


### Topic Modeling

[Topic Modeling and Figurative Language](journalofdigitalhumanities.org/2-1/topic-modeling-and-figurative-language-by-lisa-m-rhody/), Lisa M. Rhody

The explicit objective of LDA is to identify words that cluster together in some meaningful way, yet it is unable to tell us what that meaning is. This poses a problem for literature in which techniques like irony and metaphor can distance a word from its dictionary meanings in unexpected ways. Rhody examines topics assigned to a particular poem, giving special attention to one with a deeply ambiguous relationship among its terms.

[What can Topic Models of the PMLA Teach us about the History of Literary Scholarship?](http://journalofdigitalhumanities.org/2-1/what-can-topic-models-of-pmla-teach-us-by-ted-underwood-and-andrew-goldstone/), Andrew Goldstone, Ted Underwood

The PMLA is a long-running, generalist journal in literary study, and as such a great variety of subjects and schools appeared in its pages over the course of the twentieth century. By using topic modeling as an exploratory method, Goldstone and Underwood trouble the supposed arrivals of critical movements, as well as identify as-yet-untheorized currents in criticism.
