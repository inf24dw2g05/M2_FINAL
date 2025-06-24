const passport = require('passport');
const GoogleStrategy = require('passport-google-oauth20').Strategy;
const { User } = require('../models');

module.exports = function(passport) {
  // Serialização do usuário
  //serializeUser: Determina quais dados do objeto de usuário devem ser armazenados na sessão. 
  //Neste caso, apenas o ID é armazenado para economizar espaço.
  passport.serializeUser((user, done) => {
    done(null, user.id);
  });

  // Deserialização do usuário
  //deserializeUser: Recupera o objeto de usuário completo quando necessário, usando o ID armazenado na sessão. 
  // Usa findByPk (find by primary key) do Sequelize para buscar o usuário pelo ID.

  passport.deserializeUser(async (id, done) => {
    try {
      const user = await User.findByPk(id);
      done(null, user);
    } catch (error) {
      done(error, null);
    }
  });

  // Estratégia Google OAuth
  passport.use(new GoogleStrategy({
      clientID: process.env.GOOGLE_CLIENT_ID,
      clientSecret: process.env.GOOGLE_CLIENT_SECRET,
      callbackURL: process.env.GOOGLE_CALLBACK_URL
    },
    async (accessToken, refreshToken, profile, done) => {
      try {
        // Procurar usuário existente
        let user = await User.findOne({ 
          where: { googleId: profile.id } 
        });

        if (user) {
          return done(null, user);
        }

        // Criar novo usuário se não existir
        //O await ESTÁ a espera que o registo do user seja criado na base de dados
        user = await User.create({
          googleId: profile.id,
          name: profile.displayName,
          email: profile.emails[0].value,
          avatar: profile.photos[0].value
        });

        return done(null, user);
      } catch (error) {
        return done(error, null);
      }
    }
  ));
};