require 'rails_helper'

RSpec.describe ExamesController, type: :controller do
  describe 'GET #index' do
    it 'redirects to login if user is not authenticated' do
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'returns http success if user is authenticated' do
      sign_in FactoryBot.create(:user)
      get :index
    end

    it 'assigns exames to doctors' do
      doctor = FactoryBot.create(:user, :doctor)
      exame = FactoryBot.create(:exame, doctor: doctor)
      sign_in doctor
    
      get :index
      expect(assigns(:exames)).to eq([exame])
    end
  end

  describe 'GET #show' do
    let(:exame) { FactoryBot.create(:exame) }
    let(:user) { FactoryBot.create(:user) }

    before do
      sign_in user
    end

    it 'returns http success' do
      get :show, params: { id: exame.id }
      expect(response).to have_http_status(:success)
    end

    it 'assigns the correct exame to @exame' do
      get :show, params: { id: exame.id }
      expect(assigns(:exame)).to eq(exame)
    end
  end

  describe 'POST #create' do
    let(:user) { FactoryBot.create(:user) }
    let(:doctor) { FactoryBot.create(:user, :doctor) }
    let(:patient) { FactoryBot.create(:user, :patient) }
  
    before do
      sign_in doctor
    end
  
    context 'with valid parameters' do
      it 'creates a new exame' do
        expect {
          post :create, params: { exame: { title: 'Exame Test', description: 'Exame description', doctor_id: doctor.id, patient_id: patient.id } }
        }.to change(Exame, :count).by(1)
      end
  
      it 'redirects to the created exame' do
        post :create, params: { exame: { title: 'Exame Test', description: 'Exame description', doctor_id: doctor.id, patient_id: patient.id } }
        expect(response).to redirect_to(exame_path(Exame.last))
      end
  
      it 'sets a success notice' do
        post :create, params: { exame: { title: 'Exame Test', description: 'Exame description', doctor_id: doctor.id, patient_id: patient.id } }
        expect(flash[:notice]).to eq('Exame criado com sucesso.')
      end
    end
  
    context 'with invalid parameters' do
      it 'does not create a new exame' do
        expect {
          post :create, params: { exame: { title: '', description: 'Exame description', doctor_id: doctor.id, patient_id: patient.id } }
        }.not_to change(Exame, :count)
      end
  
      it 'renders the new template' do
        post :create, params: { exame: { title: '', description: 'Exame description', doctor_id: doctor.id, patient_id: patient.id } }
        expect(response).to render_template(:new)
      end
    end
  end
end
