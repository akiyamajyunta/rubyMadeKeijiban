class PostsController < ApplicationController

    before_action :set_post , only:[:update, :destroy,:edit ]


    def index 
        @posts = Post.all
        
    end 

    def new
        @post = Post.new 

    end

    def create
        @post = Post.new(posts_params)
        if @post.save
            redirect_to posts_path
        else
            render :new
        end   
    end     

    def edit
        #@post = Post.find(params[:id])
    end

    def update
       # @post = Post.find(params[:id])
        if @post.update(posts_params)
            redirect_to posts_path
        else
            render :edit

        end
    end    

    def destroy
        #@post = Post.find(params[:id])
        @post.destroy
            redirect_to posts_path   
    end   
    
    private

        def posts_params
            params.require(:post).permit(:title, 
                                        :content ,) 
        end

        def set_post
            @post = Post.find(params[:id])
        end
end