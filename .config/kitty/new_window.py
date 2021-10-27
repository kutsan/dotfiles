def main(args):
    pass

from kittens.tui.handler import result_handler

@result_handler(no_ui=True)
def handle_result(args, answer, target_window_id, boss):
    tab = boss.active_tab

    if len(tab) == 1:
        tab.new_window(cwd_from=tab.active_window_for_cwd.child.pid_for_cwd)
    else:
        tab.next_window()
