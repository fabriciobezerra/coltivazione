# frozen_string_literal: true

module HarvestsHelper
  def generate_harvest_title(harvest)
    harvest_number = Harvest.older(harvest).count + 1
    I18n.t('activerecord.attributes.harvest.harvest_number',
           seed: harvest.seed,
           number: harvest_number)
  end
end
