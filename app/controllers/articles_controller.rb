  def new
    @burden = Burden.order("created_at DESC")
    @category = Category.order("created_at DESC")
    @day = Day.order("created_at DESC")
    @prefecture = Prefecture.order("created_at DESC")
    @status = Status.order("created_at DESC")
  end