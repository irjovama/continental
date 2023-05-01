require_relative "../models/user"
require_relative "../models/category"
require_relative "../models/description"
require_relative "../models/question"
require_relative "../models/result"
require_relative "../models/test"
require_relative "../models/user_question"
require_relative "../models/user_test"



class ReportController < ApplicationController
    def page3
        workers = User.where("leader_id = ?", params[:leader_id])
        categories = workers.map do |w|
            w.user_question.map do |q| 
                sub_categories = q.question.category.parent.sub_categories.map {|s| {name: s.name} }
                {
                    name: q.question.category.parent.parent.name,
                    sub_categories: 
                } 
            end.uniq
        end.first
        result = categories.map do |c|
            category = Category.find_by(name: c[:name] )
            matrix_g = []
            c[:sub_categories] = c[:sub_categories].map do |sbc|
                sub_category = Category.find_by(name: sbc[:name] )
                matrix = sub_category.questions.map{|q| q.user_question.where("user_id != ?",params[:leader_id] ).map {|uq| uq.evaluation}}
                self_matrix = sub_category.questions.map{|q| q.user_question.where("user_id = ?",params[:leader_id] ).map {|uq| uq.evaluation}}
                matrix_g <<  matrix
                # Convertir los valores de cadena a números
                numeric_matrix = matrix.map { |row| row.map(&:to_i) }
                # Calcular el promedio
                total_sum = numeric_matrix.flatten.sum
                total_elements = numeric_matrix.flatten.length
                sbc[:average] = (( total_sum.to_f / total_elements) * 10).round(1)


                numeric_matrix = self_matrix.map { |row| row.map(&:to_i) }
                # Calcular el promedio
                total_sum = numeric_matrix.flatten.sum
                total_elements = numeric_matrix.flatten.length
                sbc[:self_average] = (( total_sum.to_f / total_elements) * 10).round(1)
                sbc[:results] = Result.where(category: sub_category).where("? between min_range and max_range", sbc[:average]).map do |r|
                    {name: "", data: r.descriptions.map{|d| d.body}} 
                end
                sbc
            end
            # Convertir los valores de cadena a números
            numeric_matrix = matrix_g.map do |inner_array|
                inner_array.map do |row|
                    row.map(&:to_i)
                end
            end
            # Calcular el promedio
            total_sum = numeric_matrix.flatten(2).sum
            total_elements = numeric_matrix.flatten(2).length
            c[:average] = ((total_sum.to_f / total_elements) * 10 ).round(1)
            c[:results] = Result.where(category_id: category.sub_categories.pluck(:id)).where("? between min_range and max_range", c[:average]).map do |r|
                {name: r.category.name, data: r.descriptions.map {  |d| d.body}}
            end
            c
        end
        render json: result
    end
    def page2
        workers = User.where("leader_id = ?", params[:leader_id])
        workers_evaluations = UserQuestion.where(user_id: workers.pluck(:id)).map do |uq| 
            {name: uq.question.category.parent.parent.name, evaluation: uq.evaluation.to_f}
        end
        workers_averages = workers_evaluations.group_by { |eval| eval[:name] }.map do |name, evals|
            sum = evals.sum { |eval| eval[:evaluation].to_f * 10}
            average = sum / evals.size
            { name: name, team: average.round(2) }
        end.map do |data|
            sub_categories = Category.find_by(name: data[:name]).sub_categories.map do |sc| 
                {category: sc.name, sub_categories: sc.sub_categories}
            end
            {name: data[:name], team: data[:team], sub_categories: }
        end
        render json: workers_averages
    end
    def page1
        user = User.find(params[:leader_id])
        workers = User.where("leader_id = ?", params[:leader_id])
        success = UserTest.where("evaluated_id = ? and status = ? and user_id != ? ", params[:leader_id], 1, params[:leader_id]).size
        general_average = (UserQuestion.where(user_id: workers.pluck(:id)).average(:evaluation).to_f ).round(1) *10
        workers_evaluations = UserQuestion.where(user_id: workers.pluck(:id)).map do |uq| 
            {user_id: uq.user_id ,name: uq.question.category.parent.parent.name, evaluation: uq.evaluation.to_f}
        end
        workers_averages = workers_evaluations.group_by { |eval| eval[:name] }.map do |name, evals|
            sum = evals.sum { |eval| eval[:evaluation].to_f * 10}
            average = sum / evals.size
            { name: name, team: average.round(2) }
        end
        self_evaluations = UserQuestion.where(user_id: params[:leader_id]).map do |uq| 
            {user_id: uq.user_id ,name: uq.question.category.parent.parent.name, evaluation: uq.evaluation.to_f}
        end
        self_averages = self_evaluations.group_by { |eval| eval[:name] }.map do |name, evals|
            sum = evals.sum { |eval| eval[:evaluation].to_f * 10}
            average = sum / evals.size
            { name: name, evaluation: average.round(2) }
        end
        render json: {
            name: "#{user.name} #{user.middlename} #{user.lastname}",
            workers: workers.size,
            success: success,   
            general_average: general_average ,
            averages: workers_averages.map do |a| 
                sa = self_averages.find { |s| s[:name] == a[:name]}
                {auto: sa[:evaluation], name: a[:name], team: a[:team]} 
            end
        }
    end




end
