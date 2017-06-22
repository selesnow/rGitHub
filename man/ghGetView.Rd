\name{ghGetView}
\alias{ghGetView}

\title{
Function get repositories statistic.
}
\description{
This function get repositories statistic by views and unique views by last 14 days from GitHub API.
}
\usage{
ghGetView(user = NULL, repos = NULL, token = NULL)
}

\arguments{
  \item{user}{Your GitHun login}
  \item{repos}{Repository alias}
  \item{token}{Your GitHub API token, you can get him this link - https://github.com/settings/tokens, for more ditail go this link https://developer.github.com/v3/oauth_authorizations/#create-a-new-authorization}
}
\details{
GitHub API dicumentation - https://developer.github.com/v3/
}
\value{
Data frame with data by last 14 days:
  \item{timestamp }{statistic date, date}
  \item{views }{count of total views, integer}
  \item{uniques }{count of unique views, integer}
}

\author{
Alexey Seleznev
}

\examples{
github_stat <- ghGetView(user = "selesnow", repos = "ryandexdirect",  token = "abcde12345")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
