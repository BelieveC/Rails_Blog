class PostsController < ApplicationController

	before_action :get_post, except: [:index, :new,:create]

	def index
		@posts = Post.all.order("created_at DESC")
	end

	def edit
		
	end

	def new
		@post = Post.new
	end

	def show
		
	end


	def create
		@post = Post.new(posts_params)
		if @post.save
			redirect_to(@post)
		else
			render('new')
		end
	end

	def update
		if @post.update(posts_params)
			flash[:notice] = "Yay! Post Updated Successfully."
			redirect_to @post
		else
			render('edit')
		end
	end

	def destroy
		@post.destroy
		redirect_to root_path, notice: "Successfully Deleted the Post!"
	end


	private
		def posts_params
			params.require(:post).permit(:title,:body)
		end

		def get_post
			@post = Post.find(params[:id])
		end
end
