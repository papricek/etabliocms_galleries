module EtabliocmsGalleries
  module Admin
    class GalleriesController < EtabliocmsCore::Admin::BaseController

      def index
        @galleries = Gallery.order(params[:order] || "created_at DESC")
      end

      def new
        @gallery = Gallery.new
      end

      def create
        @gallery = Gallery.new(params[:gallery])
        if @gallery.save
          flash[:notice] = t('gallery.created')
          redirect_to params[:save_and_continue].present? ? {:action => 'edit'} : {:action => 'index'}
        else
          render :action => 'new'
        end
      end

      def edit
        @gallery = Gallery.find(params[:id])
      end

      def update
        @gallery = Gallery.find(params[:id])
        if @gallery.update_attributes(params[:gallery])
          flash[:notice] = t('gallery.updated')
          redirect_to params[:save_and_continue].present? ? {:action => 'edit'} : {:action => 'index'}
        else
          render :action => 'edit'
        end
      end

      def destroy
        Gallery.find(params[:id]).destroy
        flash[:notice] = t('gallery.destroyed')
        redirect_to :action => 'index'
      end

    end
  end
end
