# EXPLAINATION

## Movements

The keymaps are mapped to functions in `flight/jump.lua`. `f` (the keymap) to `f` (the function), `F` to `F`, `t` to `t`, `T` to `T`, `;` to `continue(false)` and `,` to `continue(true)`.
In each function (except continue), it will set 2 states (found in `flight/utils.lua`): the `last_mode` state and the `last_target` state. The `last_mode` state is set at the start of the function if not `is_continue`.
These functions then will get the target from the user (input) using `searchpos()`, and set `last_target` to the target from `searchpos()`. Function `t` and `T` will do some tweaking after doing `searchpos()`.
Notice that functions f, F, t, T accept an argument `is_continue`. If true, then it will not ask for new target. Instead, it will get the target from `last_target`.

The `continue` function is very simple. It accepts an argument `backward_continue` to indicate the `,` keymap.
The function first gets last_mode from the `state` table and store it in `last_mode`. If `backward_continue` is true, it will flip `last_mode` with the `utils.swap_direction()` function (e.g. input `f` -> `F`)
After that, it will call functions accordingly (if las rtt_mode is "f", it will call function `f`)
