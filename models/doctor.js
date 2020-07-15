'use strict';
var Sequelize = require('sequelize');
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Doctor extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      Doctor.belongsTo(models.Team);
    }
  };
  Doctor.init({
    speciality: DataTypes.STRING,
    start_work: DataTypes.TIME
  }, {
    sequelize,
    modelName: 'Doctor',
    timestamps: false
  });
  return Doctor;
};