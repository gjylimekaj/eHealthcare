const db = require("../../models");

exports.showAll = (req, res) => {
    db.Patient.findAll().then(patients => res.render('showPatients', { patients:patients }));
};

exports.new = (req, res) => {
    res.render("addPatient");
}

exports.create = (req, res) => {
    if(req.body.constructor !== Object && Object.keys(req.body).length !== 0) {
        db.Patient.create({
           weight: req.body.weight,
           arrived_at: req.body.arrived_at,
           left_at: req.body.left_at
        }).then(() => res.redirect('/patients'));
    }
};

exports.edit = (req, res) => {
    db.Patient.findAll({
        where: {
            id: req.params.id
        }
    }).then(patient => res.render('editPatient', {
        patient: patient[0].dataValues
    })
    );
};

exports.update = (req, res) => {
    db.Patient.update({
        weight: req.body.weight,
        arrived_at: req.body.arrived_at,
        left_at: req.body.left_at
    },
    {
        where: { id: req.params.id }
    }).then(() => res.redirect('/patients'));
};

exports.delete = (req,res) => {
    db.Patient.destroy({
        where: {
            id: req.params.id
        }
    }).then(() => res.redirect("/patients"));
};