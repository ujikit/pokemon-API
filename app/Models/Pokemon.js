'use strict'
const Model = use('Model')

class Pokemon extends Model {

	types () {
		return this.belongsTo('App/Models/Type')
	}

	categories () {
		return this.belongsTo('App/Models/Category')
	}

}

module.exports = Pokemon
