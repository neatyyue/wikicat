class LinkSerializer < ActiveModel::Serializer
  attributes :cat_subcats
  def cat_subcats
    URI::encode(object.cl_sortkey.force_encoding("ISO-8859-1")
                    .encode("utf-8", replace: nil).downcase.tr(" ", "_"))
  end
end
