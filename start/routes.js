'use strict'

const Route = use('Route')

Route.group(() => {
  Route.get('/', 'PokemonController.index')
  Route.post('/', 'PokemonController.store')
  Route.get('/:id', 'PokemonController.show')
  Route.patch('/:id', 'PokemonController.update')
  Route.delete('/:id', 'PokemonController.destroy')
}).prefix('pokemon')

Route.group(() => {
  Route.get('/', 'CategoryController.index')
}).prefix('category')

Route.group(() => {
  Route.get('/', 'TypeController.index')
}).prefix('type')

Route.group(() => {
  Route.post('/', 'PokemonImageController.index')
}).prefix('upload')
