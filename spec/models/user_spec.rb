require 'spec_helper'

describe User do
  before { 
    @user = User.new
  }



  subject { @user }
  it { should respond_to(:username)}
  it { @user.username = ""
       @user.should_not be_valid}
  it { should respond_to(:name)}
  it { @user.name = ""
       @user.should_not be_valid}
  it { should respond_to(:email)}
  it { @user.email = ""
       @user.should_not be_valid}
  it { should respond_to(:type)}
  it { @user.type = nil
       @user.should_not be_valid}
  it { should respond_to(:status)}
  it { @user.status = nil
       @user.should_not be_valid}
  
  context "Visitante" do

    before {@user.type = 3}
    
    it "Con tipo 3 es un visitante" do
      @user.should be_visitante
    end

    it "Con tipo diferente a 3 no es un visitante" do
      @user.type = 1
      @user.should_not be_visitante
    end

    it "Tiene publicaciones guardadas" do
      @user.should respond_to(:posts_saved)
    end
    
    pending "Guarda publicacion" do
      publicacion = mock_model("Publicacion")
      @user.guardar_publicacion(publicacion)
      @user.publicaciones_guardadas.size.should equal 1
    end

    pending "Agregar comentario a una publicacion" do
      publicacion = mock_model("Publicacion")
      comentario = mock_model("Comentario")
      publicacion.stub!(:agregar_comentario).with(comentario).and_return(comentario)

      @user.comentar(publicacion,comentario).should equal comentario
    end

    pending "Calificar una publicacion" do
      publicacion = mock_model("Publicacion")
      publicacion.stub!(:calificar).with(5).and_return(5)

      @user.calificar(publicacion,5).should == 5 
    end

    pending "Debe poder suscribirse a un anunciante" do
      @data.update({username:"otherusername", correo:"other@example.com"})
      otro_user = Usuario.new(@data)

      @user.save
      otro_user.save

      @user.seguir(otro_usuario)
      @user.suscripciones.count.should == 1
    end

  end
    
end
