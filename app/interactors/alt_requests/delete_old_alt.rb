# -*- encoding : utf-8 -*-
module AltRequests
  class DeleteOldAlt
    include Interactor

    def call
      if context[:document].approved?
        context[:alt].destroy
      end
    end
  end
end
