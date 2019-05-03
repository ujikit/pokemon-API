'use strict'

const Route = use('Route')

Route.post('/login', 'AuthController.login')
Route.post('/register', 'AuthController.register')

Route.group(() => {
  Route.get('/', 'PokemonController.index')
  Route.get('/:id', 'PokemonController.show')
  Route.post('/', 'PokemonController.store')
  // Route.patch('/:id', 'PokemonController.update')
  Route.delete('/:id', 'PokemonController.destroy')
}).prefix('pokemon')

Route.group(() => {
  Route.get('/', 'PokemonController.getName')
}).prefix('search')

Route.group(() => {
  Route.get('/', 'CategoryController.index')
}).prefix('category')

Route.group(() => {
  Route.get('/', 'TypeController.index')
}).prefix('type')
