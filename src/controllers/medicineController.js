const db = require("../../models");

exports.showAll = (req, res) => {
    db.Medicine.findAll().then(medicines => res.render('showMedicines', { medicines: medicines }));
};

exports.new = (req, res) => {
    res.render("addMedicine");
}

exports.create = (req, res) => {
    if(req.body.constructor !== Object && Object.keys(req.body).length !== 0) {
        db.Medicine.create({
            name: req.body.name,
            quantity: req.body.quantity
        }).then(() => res.redirect('/medicines'));
    }
};

exports.edit = (req, res) => {
    db.Medicine.findAll({
        where: {
            id: req.params.id
        }
    }).then(medicine => res.render('editMedicine', {
        medicine: medicine[0].dataValues
    })
    );
};

exports.update = (req, res) => {
    db.Medicine.update({
        name: req.body.name,
        quantity: req.body.quantity
    },
    {
        where: { id: req.params.id }
    }).then(() => res.redirect('/medicines'));
};

exports.delete = (req,res) => {
    db.Medicine.destroy({
        where: {
            id: req.params.id
        }
    }).then(() => res.redirect("/medicines"));
};