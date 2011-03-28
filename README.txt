Some utilities for Cappuccino
-----------------------------

Still work in progress.

GRClassMixin
------------

Runtime helper for mixing functionality into existing objects. Similiar to the 
mixins found in Ruby but to runtime. That means that methods defined by the class
including the mixin, *will* be overridden and lost. A mixin should not define
methods that a class wants to define.

GRRotateView
------------

Provide the basics for creating a view that can rotate it self and still know whether
a mouse event is destined for the view.


