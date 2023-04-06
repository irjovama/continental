require_relative "../models/user"
require_relative "../models/category"
require_relative "../models/description"
require_relative "../models/question"
require_relative "../models/result"
require_relative "../models/test"
require_relative "../models/user_question"
require_relative "../models/user_test"
def obj_response(params)
    total_tests = UserTest.where("evaluated_id = ? ", params[:boss_id]).size
    finsh_tests = UserTest.where("evaluated_id = ? and status= ?", params[:boss_id], params[:finish]).size
    test = UserTest.find_by(evaluated_id: params[:boss_id]).test
    {
        console: [],
        test: {
            id: test.id,
            title: test.title,
            total_tests: total_tests,
            finsh_tests: finsh_tests,
            members_evaluation: 0,
            members_count_questions: 0,
            members_average: 0,
            self_evaluation: 0,
            self_count_questions: 0,
            self_average: 0,
        },
        categories: [

        ],
    }
end

def create_categories(questions)

    maping = questions.map do |q|
        {
            id: q.category.parent.id,
            name: q.category.parent.name,
            members_evaluation: 0,
            members_count_questions: 0,
            members_average: 0,
            self_evaluation: 0,
            self_count_questions: 0,
            self_average: 0,
            sub_categories: 
                questions.select do | q2| 
                    q2.category.parent_id == q.category.parent.id 
                end
                .map do |q3| 
                    {
                        id: q3.category.id,
                        name: q3.category.name,
                        members_evaluation: 0,
                        members_count_questions: 0,
                        members_average: 0,
                        self_evaluation: 0,
                        self_count_questions: 0,
                        self_average: 0,
                    }
                end.uniq
            
        }
    end
    .chunk_while { |a, b| a == b }.map(&:first)
    maping
end

class ReportController < ApplicationController
    def index
        params = {
            test_id: 1,
            finish: 1,
            boss_id: 1
        }
        response = obj_response(params)
        questions = UserTest.find_by(evaluated_id: params[:boss_id], status: params[:finish], test_id: params[:test_id]).test.questions
        # #create categories
        response[:categories] =create_categories(questions)


        questions.each do |question|
            question.user_question.each do |q|
                index = response[:categories].find_index {|c| c[:id] == question.category.parent_id }
                sub_index = response[:categories][index][:sub_categories].find_index {|c| c[:id] == q.question.category_id }
                if q.user_id == params[:test_id]
                    response[:test][:self_count_questions] += 1
                    response[:test][:self_evaluation] += q.evaluation * question.weight
                    response[:categories][index][:self_count_questions] += 1
                    response[:categories][index][:self_evaluation] += q.evaluation * question.weight
                    response[:categories][index][:self_average] = response[:categories][index][:self_count_questions].positive? && response[:categories][index][:self_evaluation] / response[:categories][index][:self_count_questions]
                else
                    response[:test][:members_count_questions] += 1
                    response[:test][:members_evaluation] += q.evaluation * question.weight

                    response[:categories][index][:members_count_questions] += 1
                    response[:categories][index][:members_evaluation] += q.evaluation * question.weight
                    response[:categories][index][:members_average] = response[:categories][index][:members_count_questions].positive? && response[:categories][index][:members_evaluation] / response[:categories][index][:members_count_questions]
                    
                    response[:categories][index][:sub_categories][sub_index][:members_count_questions] += 1
                    response[:categories][index][:sub_categories][sub_index][:members_evaluation] += q.evaluation * question.weight
                    response[:categories][index][:sub_categories][sub_index][:members_average] = response[:categories][index][:sub_categories][sub_index][:members_count_questions].positive? && response[:categories][index][:sub_categories][sub_index][:members_evaluation] / response[:categories][index][:sub_categories][sub_index][:members_count_questions]
                end
            end
        end


        response[:test][:members_average] = response[:test][:members_count_questions].positive? && response[:test][:members_evaluation] / response[:test][:members_count_questions]
        response[:test][:self_average] = response[:test][:self_count_questions].positive? && response[:test][:self_evaluation] / response[:test][:self_count_questions]
        

        render json: response
        
    end
end
