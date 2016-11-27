class EnviarDatos < ApplicationMailer
  default from: "gauchadas2016@gmail.com"
  def datos_postulante (postulacion)
    @gauchada = Gauchada.find(postulacion.gauchada_id)
    @user= User.find(@gauchada.user_id)
    @user_postulacion= User.find(postulacion.user_id)
    mail(to: @user.email, subject: 'Datos de contacto del postulante a tu gauchada')
  end
  def datos_usuario (postulacion)
    @gauchada = Gauchada.find(postulacion.gauchada_id)
    @user= User.find(@gauchada.user_id)
    @user_postulacion= User.find(postulacion.user_id)
    mail(to: @user_postulacion.email, subject: 'Datos de contacto del dueño de la gauchada')
  end
end
