'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Patient extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  };
  Patient.init({
    weight: DataTypes.DECIMAL,
    arrived_at:DataTypes.TIME,
    left_at:DataTypes.TIME, 

  }, {
    sequelize,
    modelName: 'Patient',
    timestamps:false
  });
  return Patient;
};