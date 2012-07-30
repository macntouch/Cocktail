/*
	This file is part of Cocktail http://www.silexlabs.org/groups/labs/cocktail/
	This project is © 2010-2011 Silex Labs and is released under the GPL License:
	This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License (GPL) as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version. 
	This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
	To read the license please visit http://www.gnu.org/copyleft/gpl.html
*/
package cocktail.core.linebox;

import cocktail.core.background.BackgroundManager;
import cocktail.core.dom.Document;
import cocktail.core.dom.Node;
import cocktail.core.dom.NodeBase;
import cocktail.core.geom.GeomData;
import cocktail.core.layer.LayerRenderer;
import cocktail.core.renderer.ElementRenderer;
import cocktail.core.style.ComputedStyle;
import cocktail.port.NativeElement;
import cocktail.core.style.StyleData;

/**
 * 
 * This is the base class for the elements which can be laid out as line, like text.
 * 
 * For instance, an InlineBoxRenderer will generate as many LineBox as the number
 * of lines where one of its children is.
 * For the text, a TextRenderer will generate as many TextLineBox as there is words
 * and space in its text.
 * 
 * The line boxes are owned both by the element renderer which created them and the
 * container block which lay them out in a line.
 * 
 * Block box renderer which establishes an inline formatting context has an array 
 * of root line box, each one being the root of one line in the inline formatting context.
 * 
 * It extends Node as line box are stored in a tree for each line of an inline
 * formatting context
 * 
 * @author Yannick DOMINGUEZ
 */
class LineBox extends NodeBase<LineBox>
{
	/**
	 * A reference to the element renderer which created this
	 * line box
	 */
	public var elementRenderer(default, null):ElementRenderer;
	
	/**
	 * A reference to the LayerRenderer which will render this line box.
	 * It is retrieved from the ElementRenderer
	 */
	public var layerRenderer(get_layerRenderer, never):LayerRenderer;
	
	/**
	 * the bounds of the line box, in the space of its containing
	 * block (the block which started the inline formatting context)
	 */
	public var bounds(get_bounds, set_bounds):RectangleData;
	
	/**
	 * the ascent of the line box with its leading applied
	 */
	public var leadedAscent(get_leadedAscent, set_leadedAscent):Float;
	
	/**
	 * the descent of the line box with its leading applied
	 */
	public var leadedDescent(get_leadedDescent, set_leadedDescent):Float;
	
	/**
	 * the left margin of the line box
	 */
	public var marginLeft:Float;
	
	/**
	 * the right margin of the line box
	 */
	public var marginRight:Float;
	
	/**
	 * the left padding of the line box
	 */
	public var paddingLeft:Float;
	
	/**
	 * the right margin of the line box
	 */
	public var paddingRight:Float;
	
	/**
	 * class constructor. Init class attribute
	 */
	public function new(elementRenderer:ElementRenderer) 
	{
		super();
			bounds = {
			x:0.0,
			y:0.0,
			width:0.0,
			height:0.0
		}
		
		this.elementRenderer = elementRenderer;
		
		marginLeft = 0;
		marginRight = 0;
		paddingLeft = 0;
		paddingRight = 0;
		
		leadedAscent = 0;
		leadedDescent = 0;
	}
	
	//////////////////////////////////////////////////////////////////////////////////////////
	// PUBLIC RENDERING METHODS
	//////////////////////////////////////////////////////////////////////////////////////////
	
	/**
	 * Render this LineBox using the provided
	 * graphic context as canvas
	 * 
	 * Default is to draw the background of the line box, this
	 * is expected behaviour for line boxes generated by an InlineBoxRenderer
	 */
	public function render(graphicContext:NativeElement, forceRendering:Bool):Void
	{
		var backgrounds:Array<NativeElement> = BackgroundManager.render(bounds, elementRenderer.coreStyle, elementRenderer);
		#if (flash9 || nme)
		var containerGraphicContext:flash.display.DisplayObjectContainer = cast(graphicContext);
		var globalBounds:RectangleData =  elementRenderer.globalBounds;
		for (i in 0...backgrounds.length)
		{
			backgrounds[i].x = bounds.x  + globalBounds.x;
			backgrounds[i].y = bounds.y + globalBounds.y;
			containerGraphicContext.addChild(backgrounds[i]);
		}
		#end
	}
		
	//////////////////////////////////////////////////////////////////////////////////////////
	// PUBLIC HELPER METHODS
	//////////////////////////////////////////////////////////////////////////////////////////
	
	/**
	 * Wether this is a TextLineBox
	 */
	public function isText():Bool
	{
		return false;
	}
	
	/**
	 * Helper method to determine if this
	 * line box wraps a space character
	 */
	public function isSpace():Bool
	{
		return false;
	}
	
	/**
	 * Wheter the line box is a 
	 * place holder for an absolutely
	 * positioned element to determine
	 * its static position
	 */
	public function isStaticPosition():Bool
	{
		return false;
	}

	
	/**
	 * Wether the lineboxe's ElementRenderer is
	 * aboslutely positioned
	 * 
	 * TODO 5 : check of still necessary
	 */
	public function isAbsolutelyPositioned():Bool
	{
		var computedStyle:ComputedStyle = elementRenderer.computedStyle;
		return computedStyle.position == fixed || computedStyle.position == absolute;
	}
	
	/**
	 * Wether the lineBoxe's ElementRenderer
	 * establishes a new formatting context
	 */
	public function establishesNewFormattingContext():Bool
	{
		return elementRenderer.establishesNewFormattingContext();
	}
	
	//////////////////////////////////////////////////////////////////////////////////////////
	// PUBLIC FORMATTING METHODS
	//////////////////////////////////////////////////////////////////////////////////////////
	
	//TODO 4 : doc + missing values for vertical align
	public function getBaselineOffset(parentBaselineOffset:Float, parentXHeight:Float):Float
	{
		
		var baselineOffset:Float = parentBaselineOffset + elementRenderer.coreStyle.computedStyle.verticalAlign;
		
		switch (elementRenderer.coreStyle.verticalAlign)
		{
			case VerticalAlign.middle:
				baselineOffset -=  (bounds.height / 2) - (parentXHeight / 2);
				
			case VerticalAlign.top:
				
			default:	
		}
		
		return baselineOffset;
	}
	
	//////////////////////////////////////////////////////////////////////////////////////////
	// SETTERS/GETTERS
	//////////////////////////////////////////////////////////////////////////////////////////
	
	private function get_layerRenderer():LayerRenderer
	{
		return elementRenderer.layerRenderer;
	}
	
	private function get_bounds():RectangleData
	{
		return bounds;
	}
	
	private function set_bounds(value:RectangleData):RectangleData
	{
		return bounds = value;
	}
	
	private function get_leadedAscent():Float 
	{
		return leadedAscent;
	}
	
	private function set_leadedAscent(value:Float):Float 
	{
		leadedAscent = value;
		return value;
	}
	
	private function get_leadedDescent():Float 
	{
		return leadedDescent;
	}
	
	private function set_leadedDescent(value:Float):Float 
	{
		leadedDescent = value;
		return value;
	}
}