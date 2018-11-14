# Plugin System

OmniDB 2.9 introduces the plugin system, a feature that allows users to develop and
share their own features that can be plugged into OmniDB without having to deploy
the whole application again.

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_194.png)

The plugin system is based on hooks that are located in different parts of the
interface. Each plugin can subscribe to any hook and have a collection of API
functions to perform different tasks, such as creating inner/outer tabs, creating
tree nodes and calling python functions in the plugin's python code.

Here is an example of a plugin that adds the Test action into the inner tab +
context menu:

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_195.png)

For more details about the Plugin system, instructions on how to install and also
to develop plugins, please refer to the github page:

[Plugin System](https://github.com/OmniDB/plugins)
