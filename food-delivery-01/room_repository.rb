class RoomRepository
  def initialize()
    @rooms = []

    load_csv
  end

  def find(o_id_do_quarto_que_quero_achar)
    @rooms.find { |room| room.id == o_id_do_quarto_que_quero_achar }
  end

  def load_csv
    # ...
  end

  def save_csv
    # ...
  end

end
