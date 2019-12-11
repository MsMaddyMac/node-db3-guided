// we need access to Knex - line 1 gives us that
const db = require('../data/db-config.js');

module.exports = {
    allUsers,
    findById,
    add, 
    findUserPosts
}

function findUserPosts(userId) {
    return db('posts as p')
    .select('p.id', 'p.contents as Quote', 'u.username as Author')
    .join('users as u', "p.user_id", "u.id")
    .where({ user_id: userId });
}

function allUsers() {
    return db('users');
}

function findById(id) {
    return db('users')
    .where({ id })
    .first();
}

function add(user) {
    return db('users')
        .insert(user, 'id')
        .then(ids => {
            const [ id ] = ids;

        return findById(id);
    })
}