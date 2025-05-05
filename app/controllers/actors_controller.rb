class ActorsController < ApplicationController
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end
  def new
    d=Actor.new
    d.bio=params.fetch("bio")
    d.dob=params.fetch("dob")
    d.name=params.fetch("name")
    d.image=params.fetch("image")
    d.save
    redirect_to("/actors")
  end
  def delete
    the_id=params.fetch("path_id")
    matching_rec=Actor.where({:id=>the_id})
    the_actor=matching_rec.at(0)
    the_actor.destroy
    redirect_to("/actors")
  end
  def update
    the_id=params.fetch("path_id")
    matching_rec=Actor.where({:id=>the_id})
    a=matching_rec.at(0)
    a.bio=params.fetch("bio")
    a.dob=params.fetch("dob")
    a.name=params.fetch("name")
    a.image=params.fetch("image")
    a.save
    redirect_to("/actors/#{a.id}")
  end
end
