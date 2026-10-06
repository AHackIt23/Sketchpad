extends Node

const MAXIMUM_UNDOS := 20

var undo_redo := UndoRedo.new()

func _ready() -> void:
  undo_redo.max_steps = MAXIMUM_UNDOS

func add_action(
  action_name: String,
  do_callable: Callable,
  undo_callable: Callable) -> void:
  undo_redo.create_action(action_name)
  undo_redo.add_do_method(do_callable)
  undo_redo.add_undo_method(undo_callable)
  undo_redo.commit_action()

func undo() -> void:
  if undo_redo.has_undo():
    undo_redo.undo()
  
func redo() -> void:
  if undo_redo.has_redo():
    undo_redo.redo()
