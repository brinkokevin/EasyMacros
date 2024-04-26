---
sidebar_position: 6
---

# Understanding Render Function

## The `render` function

The `render` function is the heart of your macro. It's called every frame, and it's where you define the UI components of your macro. The `render` function receives an `api` object as an argument, which provides functions for creating UI components.

```lua
local function render(api)
    api.label("Hello, World!")
end
```

Easy Macros uses a modified version of `Plasma`, an immediate mode UI library.

Here are some important bits from the Plasma documentation.

### What is immediate mode?

Plasma is an immediate mode UI library, as opposed to retained mode.

In a retained mode model, you might make a button and connect a clicked event, with code that is invoked when the event happens. The button is retained in the DataModel, and to change the text on it, you need to store a reference to it.

But under an immediate mode model, you show the button and check if it's been clicked immediately, and you do that every single frame (60 times per second). There's no need for a clicked event or to store a reference to the button.

As another example, let's say you had a window that you only wanted to be shown when it was visible. In retained mode, you would create the window and store a reference to the window. When the button to toggle visibility is toggled, you use the reference to the window to make it visible or not.

In immediate mode, it's much simpler: you just check if the window should be rendered with an if statement and render the window inside the if statement. That's it: if the window wasn't supposed to be rendered, you just never call the code to render the window.

### Advantages

The main advantage of immediate mode is that code becomes vastly simpler:

You never need to have any on-click handlers and callbacks that disrupt your code flow.
You don't have to worry about a lingering callback calling something that is gone.
Your GUI code can easily live in a simple function (no need for an object just for the UI).
You don't have to worry about the world and GUI state being out-of-sync (i.e., the GUI showing something outdated), because the GUI isn't storing any state - it is showing the latest state immediately.
In other words, a whole lot of code, complexity, and bugs are gone, and you can focus your time on something more interesting than writing GUI code.

To learn more, check out the [Plasma documentation](https://eryn.io/plasma/docs/intro).
