class DownloadsController < ApplicationsController
  def information_pack
    send_file "#{Rails.root}/public/HACKNEY FOSTERING INFO BROCHURE 2019.pdf", type: 'application/pdf', status: 202
  end
end