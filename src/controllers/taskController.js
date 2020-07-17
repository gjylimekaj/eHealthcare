const db = require("../../models");

exports.showAll = (req, res) => {
    db.Task.findAll().then(tasks => res.render('showTasks', { tasks: tasks }));
};

exports.new = (req, res) => {
    res.render("addTask");
}

exports.create = (req, res) => {
    if(req.body.constructor !== Object && Object.keys(req.body).length !== 0) {
        db.Task.create({
            description: req.body.description,
            start_time: req.body.start_time,
            end_time: req.body.end_time,
            date: req.body.date
        }).then(() => res.redirect('/tasks'));
    }
};

exports.edit = (req, res) => {
    db.Task.findAll({
        where: {
            id: req.params.id
        }
    }).then(task => res.render('editTask', {
        task: task[0].dataValues
    })
    );
};

exports.update = (req, res) => {
    db.Task.update({
        description: req.body.description,
        start_time: req.body.start_time,
        end_time: req.body.end_time,
        date: req.body.date
    },
    {
        where: { id: req.params.id }
    }).then(() => res.redirect('/tasks'));
};

exports.delete = (req,res) => {
    db.Task.destroy({
        where: {
            id: req.params.id
        }
    }).then(() => res.redirect("/tasks"));
};