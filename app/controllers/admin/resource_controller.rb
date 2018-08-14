class Admin::ResourceController < AdminController
  def upload
    begin
      ir = ImageResource.create(original: params[:upload])
      render json: {"uploaded": true, "url": "#{url_for(ir.original)}"}
    rescue => e
      logger.debug(e)
      logger.debug(e.backtrace.join("\n"))
      render json: {"uploaded": false, "error": "could not upload this image"}
    end

    # success response :

    # {
    #     "uploaded": true,
    #     "url": "http://127.0.0.1/uploaded-image.jpeg"
    # }
    # failure response :

    # {
    #     "uploaded": false,
    #     "error": {
    #         "message": "could not upload this image"
    #     }
    # }
  end
end