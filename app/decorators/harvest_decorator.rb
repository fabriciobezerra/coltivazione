# frozen_string_literal: true

class HarvestDecorator < Draper::Decorator
  delegate_all

  def title
    harvest_number = Harvest.older(self).count + 1
    I18n.t('activerecord.attributes.harvest.harvest_number',
           seed: seed,
           number: harvest_number)
  end
end
