% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hierarchicalFWER.R
\name{hierarchicalFWER}
\alias{hierarchicalFWER}
\title{Hierarchical testing with FWER control}
\usage{
hierarchicalFWER(
  X,
  y,
  group,
  var,
  test = partialFtest,
  Shaffer = FALSE,
  addRoot = FALSE
)
}
\arguments{
\item{X}{original data}

\item{y}{associated response}

\item{group}{vector with index of groups. group[i] contains the index of the group of the variable var[i].}

\item{var}{vector with the variables contained in each group. group[i] contains the index of the group of the variable var[i].}

\item{test}{function for testing the nullity of a group of coefficients in linear regression. 
The function has 3 arguments: \code{X}, the design matrix, \code{y}, response, and \code{varToTest}, a vector containing 
the indices of the variables to test. The function returns a p-value}

\item{Shaffer}{boolean, if TRUE, a Shaffer correction is performed}

\item{addRoot}{If TRUE, add a common root containing all the groups}
}
\value{
a list containing:
\describe{
  \item{pvalues}{pvalues of the different test (without correction)}
  \item{adjPvalues}{adjusted pvalues}
  \item{groupId}{Index of the group}
  \item{hierMatrix}{Matrix describing the hierarchical tree.}
  }
}
\description{
Apply hierarchical test for each hierarchy, and test external variables for FWER control at level alpha
}
\details{
Version of the hierarchical testing procedure of Meinshausen for MLGL output. You can use th \link{selFWER} 
function to select groups at a desired level alpha
}
\examples{
set.seed(42)
X <- simuBlockGaussian(50, 12, 5, 0.7)
y <- X[, c(2, 7, 12)] \%*\% c(2, 2, -2) + rnorm(50, 0, 0.5)
res <- MLGL(X, y)
test <- hierarchicalFWER(X, y, res$group[[20]], res$var[[20]])
}
\references{
Meinshausen, Nicolai. "Hierarchical Testing of Variable Importance." Biometrika 95.2 (2008): 265-78.
}
\seealso{
\link{selFWER}, \link{hierarchicalFDR}
}
