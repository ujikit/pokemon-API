'use strict'
const Model = use('Model')

class Pokemon extends Model {

	types () {
		return this.belongsToMany('App/Models/Type').pivotTable('pokemon_type')
	}

	category () {
		return this.belongsTo('App/Models/Category')
	}

}

module.exports = Pokemon
