const express = require("express");
const router = express.Router();
const teamController = require("./controllers/teamController");
const doctorController = require("./controllers/doctorController");
const departmentController = require("./controllers/departmentController");
const vendorController = require("./controllers/vendorController");
const roleController = require("./controllers/roleController");

// Homepage
router.get('/', (req,res) => {
    res.render("index");
});

router.get('/teams', teamController.showAll);
router.get('/teams/new', teamController.new);
router.post('/teams/new', teamController.create);
router.get('/teams/:id/edit', teamController.edit);
router.post('/teams/:id/edit', teamController.update);
router.get('/teams/:id/delete', teamController.delete);

router.get('/doctors', doctorController.showAll);
router.get('/doctors/new', doctorController.new);
router.post('/doctors/new', doctorController.create);
router.get('/doctors/:id/edit', doctorController.edit);
router.post('/doctors/:id/edit', doctorController.update);
router.get('/doctors/:id/delete', doctorController.delete);

router.get('/departments', departmentController.showAll);
router.get('/departments/new', departmentController.new);
router.post('/departments/new', departmentController.create);
router.get('/departments/:id/edit', departmentController.edit);
router.post('/departments/:id/edit', departmentController.update);
router.get('/departments/:id/delete', departmentController.delete);

router.get('/vendors', vendorController.showAll);
router.get('/vendors/new', vendorController.new);
router.post('/vendors/new', vendorController.create);
router.get('/vendors/:id/edit', vendorController.edit);
router.post('/vendors/:id/edit', vendorController.update);
router.get('/vendors/:id/delete', vendorController.delete);

router.get('/roles', roleController.showAll);
router.get('/roles/new', roleController.new);
router.post('/roles/new', roleController.create);
router.get('/roles/:id/edit', roleController.edit);
router.post('/roles/:id/edit', roleController.update);
router.get('/roles/:id/delete', roleController.delete);

module.exports = router;