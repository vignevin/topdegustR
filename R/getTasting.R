
#' get metadata from tasting
#'
#' @param host url of topdegust API, by default "https://topdegust.trydea.fr/api/topdegust"
#' @param token a token from topdegust API
#' @param year year of the tasting, numeric
#' @param type type of the tasting, character
#' @param id_tasting tasting id, numeric
#' @param user user identifier, character
#'
#' @return a data.frama with a row for each tasting and metadata as cols
#'
#' @importFrom httr GET content_type_json
#' @importFrom jsonlite fromJSON
#'
#' @export
#'

getTasting <- function(host="https://topdegust.trydea.fr/api/topdegust",token,year=NULL,
                       type=NULL,id_tasting=NULL,user=NULL)
{
  tasting = httr::GET(paste0(host,"/degustations/",token = token),
                   query = list(year=year,
                                type=type,
                                degustation = id_tasting,
                                user = user),
                   httr::content_type_json(),encode ="raw")
  tastingDF = jsonlite::fromJSON(rawToChar(tasting$content))
  return(tastingDF)
}
