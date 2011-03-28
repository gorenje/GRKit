/*
 * Created by Gerrit Riessen
 * Copyright 2011, Gerrit Riessen
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

/*!
  A CPView with built in rotation support. This encapsulates a CALayer that is able to
  rotate. The intention, initially, is to have "tracking" view, i.e. nothing is drawn, 
  that allows us to capture mouse and keyboard events targeted for the encapsulated
  view.
*/
@implementation GRRotateView : CPView
{
  CALayer m_rootLayer;
}

- (id)initWithFrame:(CGRect)aFrame
{
  self = [super initWithFrame:aFrame];
  if ( self ) {
    m_rootLayer = [CALayer layer];
    [m_rootLayer setDelegate:self];
    [self setWantsLayer:YES];
    [self setLayer:m_rootLayer];
    [self setClipsToBounds:NO];
  }
  return self;
}

/*!
  Yes we want to have hitTests.
*/
- (BOOL)hitTests
{
  return YES;
}

/*!
  Our hit-test is be delegated off to our layer. This has been rotated (potentially)
  and can tell use whether we should handle any event.
*/
- (CPView)hitTest:(CPPoint)aPoint
{
  return ( [m_rootLayer hitTest:[[self superview] 
                                  convertPoint:aPoint toView:self]] ? self : nil );
}

/*!
  Rotate the layer by this many radians.
*/
- (void)setRotation:(float)aRadianValue
{
  [m_rootLayer setAffineTransform:CGAffineTransformMakeRotation(aRadianValue)];
}

/*!
  Default is to draw nothing since this is intended to be used as tracking view: we
  ensure that events are handled by this view because the mouse is in the rotated
  view.
*/
- (void)drawLayer:(CALayer)aLayer inContext:(CGContext)context
{
}

@end
