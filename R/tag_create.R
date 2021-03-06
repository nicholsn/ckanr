#' Create a tag
#' 
#' IMPORTANT: You must be a sysadmin to create vocabulary tags.
#'
#' @export
#'
#' @param name (character) The name for the new tag, a string between 2 and 100
#' characters long containing only alphanumeric characters and -, _ and .,
#' e.g. 'Jazz'
#' @param vocabulary_id (character) The id of the vocabulary that the new
#' tag should be added to, e.g. the id of vocabulary 'Genre'
#' @template args
#' @template key
#' @examples \dontrun{
#' ckanr_setup(url = "https://demo.ckan.org/",
#'   key = Sys.getenv("CKAN_DEMO_KEY"))
#' tag_create(name = "TestTag1", vocabulary_id = "Testing1")
#' }
tag_create <- function(name, vocabulary_id,
  key = get_default_key(), url = get_default_url(), as = 'list', ...) {

  warning("not tested yet, may not work", call. = FALSE)
  body <- cc(list(name = name, vocabulary_id = vocabulary_id))
  res <- ckan_POST(url, 'tag_create',
                   body = tojun(body, TRUE), key = key,
                   encode = "json", ctj(), ...)
  switch(as, json = res, list = jsl(res), table = jsd(res))
}
