module PicturesHelper
  def gallery_show(gallery)
    pictures = gallery.pictures
    if pictures.length < 4
      link_to picture_path(pictures[0]), :remote => true do
        image_tag gallery.pictures[0].image.url(:thumb), :class => "single-thumb"
      end
    elsif pictures.length < 9
      for picture in pictures[0..3] do
        link_to picture_path(picture), :remote => true do
          image_tag picture.image.url(:thumb), :class => "quadruple-thumbs"
        end
      end
    elsif pictures.length >= 9
      for picture in pictures[0..8] do
        link_to picture_path(picture), :remote => true do
          image_tag picture.image.url(:thumb), :class => "nona-thumbs"
        end
      end
    end
  end
end
