'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class User extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  };
  User.init({
    first_name: DataTypes.STRING,
    last_name: DataTypes.STRING,
    birth_date: DataTypes.DATE,
    gender: DataTypes.CHAR,
    email: DataTypes.STRING,
    password: DataTypes.STRING,
    contact_num: DataTypes.STRING,
    zip_code: DataTypes.STRING,
    street: DataTypes.STRING,
    city: DataTypes.STRING,
    counrty: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'User',
    timestamps: false
  });
  return User;
};