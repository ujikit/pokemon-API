'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class PokemonsSchema extends Schema {
  up () {
    this.create('pokemons', (table) => {
      table.increments()
      table.string('name_pokemon', 80).nullable()
      table.integer('category_id').unsigned().index('category_id')
      table.foreign('category_id').references('categories.id').onDelete('cascade').onUpdate('cascade')
      table.string('latitude_pokemon', 80).nullable()
      table.string('longitude_pokemon', 80).nullable()
      table.timestamps()
    })
  }

  down () {
    this.drop('pokemons')
  }
}

module.exports = PokemonsSchema
