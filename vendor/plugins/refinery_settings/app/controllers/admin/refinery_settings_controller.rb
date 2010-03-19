class Admin::RefinerySettingsController < Admin::BaseController
  before_filter :find_all_categories
  before_filter :find_category
    
  crudify :refinery_setting, :title_attribute => :title, :order => "name ASC"
  
private
  def find_all_categories
    @categories = RefinerySetting.find(:all, :conditions => ['category IS NOT NULL']).map{ |i| i.category }.uniq
  end
  
  def find_category
    if @categories.include?(params[:category])
      @category = params[:category]
    end
  end
  
  def paginate_all_refinery_settings
    if params[:category]
      @refinery_settings = RefinerySetting.paginate :page => params[:page], 
                                                    :order => "name ASC",
                                                    :conditions => {:category => params[:category]}
    else
      @refinery_settings = RefinerySetting.paginate :page => params[:page], 
                                                    :order => "name ASC",
                                                    :conditions => {:category => nil}
    end
  end
end
