# spec/integration/blogs_spec.rb
require 'swagger_helper'

describe 'Questions API' do

  path '/questions' do

    post 'Creates a question' do
      tags 'Questions'
      consumes 'application/json'
      parameter name: :question, in: :body, schema: {
        type: :object,
        properties: {
          question: { type: :string },
          level: { type: :string }
        },
        required: [ 'question', 'level' ]
      }

      response '201', 'question created' do
        let(:question) { { question: 'asuidhaiusdhausidhsauidhas', level: 'FACIL' } }
        run_test!
      end
    end
  end

end