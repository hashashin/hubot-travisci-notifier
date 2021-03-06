# Description
#   A Travisci convert to Object from JSON.
#
class Travisci
  constructor: (@body) ->
    @json = JSON.parse(@body.payload) if @body?.payload

  repository_owner_name: ->
    @json.repository.owner_name

  repository_name: ->
    @json.repository.name

  branch: ->
    @json.branch

  number: ->
    @json.number

  author_name: ->
    @json.author_name

  commit: ->
    @json.commit.substr(0, 7)

  build_url: ->
    @json.build_url

  compare_url: ->
    @json.compare_url

  repository: ->
    "#{@repository_owner_name()}/#{@repository_name()}@#{@branch()}"

  status: ->
    if @json["status_message"] == 'Pending'
      "started"
    else
      "#{@json["status_message"].toLowerCase()}"

module.exports = Travisci
