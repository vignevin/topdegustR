#' get criteria used in tasting
#'
#' @description this function provides all criteria used in topdegust, or only criteria used in a given tasting.
#' If param id_degust is left empty, the function returns all criteria used in topdegust.
#'
#' @param host url of topdegust API, by default "https://topdegust.trydea.fr/api/topdegust"
#' @param token a token from topdegust API
#' @param id_tasting tasting id
#'
#' @return a data.frame with a row for each criteria and id, name, lower_bound,upper_bound, description,deleted,categorie,type...as cols
#'
#' @importFrom httr GET content_type_json
#' @importFrom jsonlite fromJSON
#'
#' @export
#'

getCriteria <- function(host="https://topdegust.trydea.fr/api/topdegust",token,id_tasting=NULL)
{
    result = try(httr::GET(paste0(host,"/criterias/",token = token),
              query = list(degustation=id_tasting),
              httr::content_type_json(),encode ="raw"))
    if(result$status_code!=200)
    {
      stop(paste(httr::http_status(result)$message), call. = FALSE)
    } else
    {
      print(httr::http_status(result)$message)
    }

    critDF = jsonlite::fromJSON(rawToChar(result$content))
    return(critDF)
}
