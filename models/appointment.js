'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Appointment extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  };
  Appointment.init({
    description: DataTypes.STRING,
    date: DataTypes.DATE,
    cancelation: DataTypes.STRING


  }, {
    sequelize,
    modelName: 'Appointment',
    timestamps:false
  });
  return Appointment;
};