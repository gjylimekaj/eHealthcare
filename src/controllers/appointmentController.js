const db = require("../../models");

exports.showAll = (req, res) => {
    db.Appointment.findAll().then(appointments => res.render('showAppointment', { appointments:appointments }));
};

exports.new = (req, res) => {
    res.render("addAppointment");
}

exports.create = (req, res) => {
    if(req.body.constructor !== Object && Object.keys(req.body).length !== 0) {
        db.Appointment.create({
            description: req.body.description,
            date: req.body.date,
            cancelation: req.body.cancelation,
        }).then(() => res.redirect('/appointments'));
    }
};

exports.edit = (req, res) => {
    db.Appointment.findAll({
        where: {
            id: req.params.id
        }
    }).then(appointment => res.render('editAppointment', {
        appointment: appointment[0].dataValues
    })
    );
};

exports.update = (req, res) => {
    db.Appointment.update({
        description: req.body.description,
        date: req.body.date,
        cancelation: req.body.cancelation,
    },
    {
        where: { id: req.params.id }
    }).then(() => res.redirect('/appointments'));
};

exports.delete = (req,res) => {
    db.Appointment.destroy({
        where: {
            id: req.params.id
        }
    }).then(() => res.redirect("/appointments"));
};