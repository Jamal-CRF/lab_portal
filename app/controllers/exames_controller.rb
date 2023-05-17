class ExamesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_exame, only: [:show, :edit, :update]
  before_action :check_doctor_permission, only: [:new, :create, :edit, :update]

  def index
    @exames = current_user.doctor? ? Exame.all : current_user.patient_exames
  end

  def show
  end

  def new
    @exame = Exame.new
  end

  def create
    @exame = current_user.doctor_exames.new(exame_params)
    if @exame.save
      redirect_to exame_path(@exame), notice: 'Exame criado com sucesso.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @exame.update(exame_params)
      redirect_to exame_path(@exame), notice: 'Exame atualizado com sucesso.'
    else
      render :edit
    end
  end

  private

  def set_exame
    @exame = Exame.find(params[:id])
  end

  def exame_params
    params.require(:exame).permit(:description, :doctor_id, :patient_id)
  end

  def check_doctor_permission
    unless current_user.doctor?
      redirect_to root_path, alert: 'Acesso negado. Somente médicos podem realizar essa ação.'
    end
  end
end
