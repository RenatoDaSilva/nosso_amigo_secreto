module CampaignsHelper
  def count_opened_emails(campaign)
    "#{campaign.count_opened}/#{campaign.members.count}"
  end
end