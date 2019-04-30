'use strict'

const Route = use('Route')

Route.post('/login', 'AuthController.login')
Route.post('/register', 'AuthController.register')

Route.group(() => {
  Route.get('/', 'PokemonController.index').middleware(['auth'])
  Route.post('/', 'PokemonController.store')
  // Route.delete('/:id', 'PokemonController.destroy')
}).prefix('pokemon')

Route.group(() => {
  Route.get('/', 'PokemonController.getName').middleware(['auth'])
}).prefix('search')

Route.group(() => {
  Route.get('/', 'CategoryController.index')
}).prefix('category')

Route.group(() => {
  Route.get('/', 'TypeController.index')
}).prefix('type')

Route.group(() => {
  Route.post('/', 'PokemonImageController.index')
}).prefix('upload')
