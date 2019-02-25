require_relative 'lib/router'
require_relative 'lib/controller'
require_relative 'lib/cookbook'

CSV_FILE = File.join(File.dirname(__FILE__), 'data/database.csv')

cookbook = Cookbook.new(CSV_FILE)

controller = Controller.new(cookbook)

router = Router.new(controller)

router.run
