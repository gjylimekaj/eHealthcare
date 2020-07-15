'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    return queryInterface.addColumn(
      'Vendors', // name of Source model
      'DeptId', // name of the key we're adding 
      {
        type: Sequelize.INTEGER,
        references: {
          model: 'Departments', // name of Target model
          key: 'id', // key in Target model that we're referencing
        },
        onUpdate: 'CASCADE',
        onDelete: 'SET NULL',
      }
    );
  },

  down: async (queryInterface, Sequelize) => {
    return queryInterface.removeColumn(
      'Vendors', // name of Source model
      'DeptId' // key we want to remove
    );
  }
};
