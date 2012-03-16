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
        @gallery = Gallery.new(params[:etabliocms_galleries_gallery])
        if @gallery.save
          flash[:notice] = t('gallery.created')
          redirect_to params[:save_and_continue].present? ? edit_admin_gallery_path(@gallery.id) : {:action => 'index'}
        else
          render :action => 'new'
        end
      end

      def edit
        @gallery = Gallery.find(params[:id])
      end

      def update
        @gallery = Gallery.find(params[:id])
        if @gallery.update_attributes(params[:etabliocms_galleries_gallery])
          flash[:notice] = t('gallery.updated')
          redirect_to params[:save_and_continue].present? ? edit_admin_gallery_path(@gallery.id) : {:action => 'index'}
        else
          render :action => 'edit'
        end
      end

      def destroy
        Gallery.find(params[:id]).destroy
        flash[:notice] = t('gallery.destroyed')
        redirect_to :action => 'index'
      end

      def sort
        Gallery.all.each do |gallery|
          gallery.position = params['etabliocms_galleries_gallery'].index(gallery.id.to_s) + 1
          gallery.save
        end
        render :nothing => true
      end

      def sort_pictures
        @gallery = Gallery.find(params[:id])
        @gallery.pictures.all.each do |picture|
          picture.position = params['etabliocms_galleries_picture'].index(picture.id.to_s) + 1
          picture.save
        end
        render :nothing => true
      end
    end
  end
end
