const db = require("../../models");

exports.showAll = (req, res) => {
    db.Prescription.findAll().then(prescriptions => res.render('showPrescription', { prescriptions: prescriptions }));
};

exports.new = (req, res) => {
    res.render("addPrescription");
}

exports.create = (req, res) => {
    if(req.body.constructor !== Object && Object.keys(req.body).length !== 0) {
        db.Prescription.create({
            description: req.body.description
        }).then(() => res.redirect('/prescriptions'));
    }
};

exports.edit = (req, res) => {
    db.Prescription.findAll({
        where: {
            id: req.params.id
        }
    }).then(prescription => res.render('editPrescription', {
        prescription: prescription[0].dataValues
    })
    );
};

exports.update = (req, res) => {
    db.Prescription.update({
        description: req.body.description
    },
    {
        where: { id: req.params.id }
    }).then(() => res.redirect('/prescriptions'));
};

exports.delete = (req,res) => {
    db.Prescription.destroy({
        where: {
            id: req.params.id
        }
    }).then(() => res.redirect("/prescriptions"));
};