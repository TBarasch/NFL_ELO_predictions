# Predicting NFL Winners using ELO ratings
- authors: Frank Lu, Simardeep Kaur, Tani Barasch

## About

In this project we attempt to predict NFL game winners using classification algorithems, Random Forest and Logistic Regression, in order to test the hypothesis that ELO ratings can be used to predict the outcome as presented by the website FiveThirtyEight.com in their 'NFL Prediction Game'.

The website [FiveThirtyEight](https://fivfethirtyeight.com/) launched a [“prediction game”](https://fivethirtyeight.com/features/how-to-play-our-nfl-predictions-game/) for NFL games this year, in which the readers assign a probability to to each teams wining chances for every game, competing with fivethirtyeight’s ELO based prediction system.

ELO ranking is a relative ranking system in which performing better then what the ELO would predict leads to an increase in ranking and performing worse that would be expected leads to  decrees. Where predictions and expectations are based on the difference between two players/teams ELO ratings.
A more general explanation can be found [here](https://www.youtube.com/watch?v=AsYfbmp0To0) by Singingbanana on youtube.

In order to test whether or not ELO is a valid method by which to predict NFL game outcomes, we will attempt to use historic ELO ratings to predict the winners of the 2019-2020 season games which has recently ended.
Using this data we train two machine learning classification algorithems: logistic regression and random forest to test the validity of ELO ratings as a predictor.

The data for this project will be the same data fivethirtyeigh uses to generate their own predictions which can be found in [this](https://github.com/fivethirtyeight/data/tree/master/nfl-elo) github repo.

## Report
The final report markdown can be found [here](https://github.com/TBarasch/NFL_ELO_predictions/blob/master/doc/Elo_prediction_report.md)

## Usage
To run this analysis, clone this github repo, install the dependencies as listed below and run the following code in the command line/terminal from the root directory of this project:

### Dependencies
- Python 3.7.3 and Python packages:
  - docopt==0.6.2
  - requests==2.22.0
  - pandas==0.24.2
  - scikit-learn==0.22.1
- R version 3.6.1 and R packages:
  - knitr==1.26
  - tidyverse==1.2.1
- Linux 18.04 LTS
  - Make==4.1

### Scripts

#### To run with a Docker container:
- First, we clean all the intermediate files from previous execution, run the command below:
```
docker run --rm -e PASSWORD="ppp" -p 8787:8787 -v $(pwd):/mnt tbarasch/g306_522 make -C /mnt clean
```

- Then create the report by running the command below from terminal:
```
docker run --rm -e PASSWORD="ppp" -p 8787:8787 -v $(pwd):/mnt tbarasch/g306_522 make -C /mnt all
```

#### To run on your own system:
- Clone this repo, and run the command below from the repo root in terminal:
```
make all
```

- To clean all the intermediate files, run the command below:
```
make clean
```


## Refrences
de Jonge, Edwin. 2018. Docopt: Command-Line Interface Specification Language. https://CRAN.R-project.org/package=docopt.

FiveThirtyEight. 2019. “Fivethirtyeight Data Repository.” fivethirtyeight. https://data.fivethirtyeight.com/.

Keleshev, Vladimir. 2014. Docopt: Command-Line Interface Description Language. https://github.com/docopt/docopt.

McKinney, Wes. 2010. “Data Structures for Statistical Computing in Python.” In Proceedings of the 9th Python in Science Conference, edited by Stéfan van der Walt and Jarrod Millman, 51–56.

Pedregosa, F., G. Varoquaux, A. Gramfort, V. Michel, B. Thirion, O. Grisel, M. Blondel, et al. 2011. “Scikit-learn: Machine Learning in Python.” Journal of Machine Learning Research 12: 2825–30.

R Core Team. 2019. R: A Language and Environment for Statistical Computing. Vienna, Austria: R Foundation for Statistical Computing. https://www.R-project.org/.

Van Rossum, Guido, and Fred L. Drake. 2009. Python 3 Reference Manual. Scotts Valley, CA: CreateSpace.

Wickham, Hadley. 2017. Tidyverse: Easily Install and Load the ’Tidyverse’. https://CRAN.R-project.org/package=tidyverse.

Xie, Yihui. 2014. “Knitr: A Comprehensive Tool for Reproducible Research in R.” In Implementing Reproducible Computational Research, edited by Victoria Stodden, Friedrich Leisch, and Roger D. Peng. Chapman; Hall/CRC. http://www.crcpress.com/product/isbn/9781466561595.
