const express = require("express");
const router = express.Router();
const teamController = require("../controllers/teamController");

// Homepage
router.get('/', (req,res) => {
    res.render("index");
});

router.get('/teams', teamController.viewAllTeams);
router.get('/teams/add', teamController.renderAddTeamPage);
router.post('/teams/add', teamController.addTeam);
router.get('/teams/:team_id/edit', teamController.editTeam);
router.post('/teams/:team_id/edit', teamController.update);
router.get('/teams/:team_id/delete', teamController.delete);

module.exports = router