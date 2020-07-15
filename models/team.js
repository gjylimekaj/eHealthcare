'use strict';
var Sequelize = require('sequelize');
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Team extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  };
  Team.init({
    description: DataTypes.STRING,
    procedure_info: DataTypes.STRING,
    due_date: DataTypes.TIME,
    start_at: DataTypes.TIME,
    end_at: DataTypes.TIME
  }, {
    sequelize,
    modelName: 'Team',
    timestamps: false
  });
  return Team;
};