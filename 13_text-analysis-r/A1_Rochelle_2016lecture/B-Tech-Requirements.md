# Software Requirements

## R and RStudio

[R](http://www.r-project.org/) is a programming language that is especially powerful for data exploration, visualization, and statistical analysis. To interact with R, we use [RStudio](http://www.rstudio.com/).

####Windows

Install R by downloading and running [this .exe file from CRAN](http://cran.r-project.org/bin/windows/base/release.htm). Also, please install the [RStudio IDE](http://www.rstudio.com/ide/download/desktop).

####Mac OS X

Install R by downloading and running [this .pkg file from CRAN](http://cran.r-project.org/bin/macosx/R-latest.pkg). Also, please install the [RStudio IDE](http://www.rstudio.com/ide/download/desktop).

####Linux

You can download the [binary files](http://cran.r-project.org/index.html) for your distribution from CRAN. Or you can use your package manager (e.g. for Debian/Ubuntu run `sudo apt-get install r-base` and for Fedora run `sudo yum install R`). Also, please install the [RStudio IDE](http://www.rstudio.com/ide/download/desktop).

## Java

Make sure that your Java Runtime-Environment (JRE) installation is up to date. Your JRE version should be at least 1.7.

####Windows

For Windows, [visit this page](http://www.oracle.com/technetwork/java/javase/downloads/jre8-downloads-2133155.html) to download Windows x64 package of JRE JRE version 8, and then follow the installation instructions. You can browse to this [website](https://www.java.com/en/download/installed.jsp) to test your installation. (Note: This won't work in Chrome)

####Mac OS X

If your OS is up-to-date, you should have at least Java 1.7. You can update your OS using Software Update.

See [here](https://support.apple.com/en-us/HT202678) for more detailed information.

You can browse to this [website](https://www.java.com/en/download/installed.jsp) to test your installation. (Note: This won't work in Chrome)

####Linux

For Linux, [visit this page](http://www.oracle.com/technetwork/java/javase/downloads/jre8-downloads-2133155.html) to download Linux x64 package of JRE JRE version 8, and then follow the installation instructions.

## Required R Packages

1. `tm` # text mining in R
2. `RTextTools` # a machine learning package for text classification 
3. `qdap` # quantiative discourse analysis
4. `qdapDictionaries` # for sentiment analysis, etc
4. `entropy` # tools applying Information Theory 
5. `dplyr` # data preparation and pipes $>$
6. `ggplot2` # for plotting
7. `SnowballC` # for stemming
8. `matrixStats` # for stats
9. `data.table` # for easier data manipulation
10. `scales` # to help us plot
11. `lsa` # latent semantic analysis
12. `cluster` # for clustering analysis
13. `fpc` # flexible procedures for clustering
14. `mallet` # a wrapper around the Java machine learning tool MALLET
15. `wordcloud` # to visualize wordclouds
16. `rJava` # dependency for mallet
17. Any dependencies to the packages above.

#### Installation

To install these packages, you can open RStudio and use the command `install.packages()` in the console. For example, to install the `tm` package, you would type:
```{r}
install.packages('tm')
```
Make sure to use quotation marks around the name of the package.

If RStudio returns an error message, go to "Preferences" and check the "Packages" section. Under "CRAN Mirror," if no mirror is selected, choose "Global (CDN) - RStudio". Otherwise, check your internet connection.
