_io = null
routes =
	home:
		type: 'get'
		link: '/'
		control: (req, res) ->
			HomeController::run(req, res, _io)
			return

	about:
		type: 'get'
		link: '/about'
		control: (req, res) ->
			console.log 'Page about'
			return

module.exports = class Routes
	init: (app, io)->
		_io = io
		for i of routes
			page = routes[i]
			app[page.type] page.link, page.control
			return