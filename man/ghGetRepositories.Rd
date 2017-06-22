\name{ghGetRepositories}
\alias{ghGetRepositories}

\title{
Function get repositories list.
}
\description{
This function get repositories list with differnt parametesr from GitHub API.
}
\usage{
ghGetRepositories(user = NULL, token = NULL)
}

\arguments{
  \item{user}{Your GitHun login}
  \item{token}{Your GitHub API token, you can get him this link - https://github.com/settings/tokens, for more ditail go this link https://developer.github.com/v3/oauth_authorizations/#create-a-new-authorization}
}
\details{
GitHub API dicumentation - https://developer.github.com/v3/
}
\value{
Data frame with repositories list with differnt parametesr:
  \item{id }{Repositories ID, integer}
  \item{name }{Repositories name, character}
  \item{full_name }{Owner and repository name, character}
  \item{language }{Repository programm language, character}
  \item{owner_login }{Repository owner login, character}
  \item{owner_url }{Repository owner URL, character}
  \item{private }{Privat or public repository, logical}
  \item{html_url }{Repository URL, logical}
  \item{description }{Repository description, logical}
  \item{created_at }{Repository create date, date}
  \item{updated_at }{Repository last update date, date}
  \item{stargazers_count }{Repository stars count, integer}
  \item{watchers_count }{Repository watchers count, integer}
  \item{forks_count }{Repository forks count, integer}
  \item{open_issues_count }{Repository open issure count, integer}
}

\author{
Alexey Seleznev
}

\examples{
git_repos <- ghGetRepositories(user = "selesnow",  token = "abcde12345")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
