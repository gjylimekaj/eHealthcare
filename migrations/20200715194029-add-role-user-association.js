'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    return queryInterface.addColumn(
      'Users', // name of Source model
      'roleId', // name of the key we're adding 
      {
        type: Sequelize.INTEGER,
        references: {
          model: 'Roles', // name of Target model
          key: 'id', // key in Target model that we're referencing
        },
        onUpdate: 'CASCADE',
        onDelete: 'SET NULL',
      }
    );
  },

  down: async (queryInterface, Sequelize) => {
    return queryInterface.removeColumn(
      'Users', // name of Source model
      'roleId', // name of the key we're adding 
    );
  }
};
